package com.javachina.controller;

import com.blade.ioc.annotation.Inject;
import com.blade.jdbc.core.Take;
import com.blade.jdbc.model.Paginator;
import com.blade.kit.DateKit;
import com.blade.kit.StringKit;
import com.blade.mvc.annotation.*;
import com.blade.mvc.http.HttpMethod;
import com.blade.mvc.http.Request;
import com.blade.mvc.http.Response;
import com.blade.mvc.view.ModelAndView;
import com.blade.mvc.view.RestResponse;
import com.javachina.constants.Actions;
import com.javachina.constants.Constant;
import com.javachina.dto.HomeTopic;
import com.javachina.dto.NodeTree;
import com.javachina.exception.TipException;
import com.javachina.ext.Access;
import com.javachina.ext.AccessLevel;
import com.javachina.kit.Utils;
import com.javachina.model.Comment;
import com.javachina.model.Favorite;
import com.javachina.model.Topic;
import com.javachina.model.Userlog;
import com.javachina.service.*;
import lombok.extern.slf4j.Slf4j;

import java.util.List;
import java.util.Map;

@Controller
@Slf4j
public class TopicController extends BaseController {

    @Inject
    private TopicService topicService;

    @Inject
    private NodeService nodeService;

    @Inject
    private CommentService commentService;

    @Inject
    private OptionsService optionsService;

    @Inject
    private UserService userService;

    @Inject
    private UserlogService userlogService;

    @Inject
    private FavoriteService favoriteService;

    /**
     * 发布帖子页面
     */
    @Route(value = "/topic/add", method = HttpMethod.GET)
    @Access
    public ModelAndView show_add_topic(Request request, Response response) {
        this.putData(request);
        Long pid = request.queryAsLong("pid");
        request.attribute("pid", pid);
        return this.getView("topic_add");
    }

    /**
     * 编辑帖子页面
     */
    @Route(value = "/topic/edit/:tid", method = HttpMethod.GET)
    @Access
    public ModelAndView show_ediot_topic(@PathParam("tid") String tid, Request request, Response response) {

        Topic topic = topicService.getTopicById(tid);
        if (null == topic) {
            request.attribute(this.ERROR, "不存在该帖子");
            return this.getView("info");
        }

        if (!topic.getUsername().equals(getLoginUser().getUsername())) {
            request.attribute(this.ERROR, "您无权限编辑该帖");
            return this.getView("info");
        }

        // 超过300秒
        if ((DateKit.getCurrentUnixTime() - topic.getCreated()) > 300) {
            request.attribute(this.ERROR, "发帖已经超过300秒，不允许编辑");
            return this.getView("info");
        }

        this.putData(request);
        request.attribute("topic", topic);

        return this.getView("topic_edit");
    }

    /**
     * 编辑帖子操作
     */
    @Route(value = "/topic/edit", method = HttpMethod.POST)
    @JSON
    @Access
    public RestResponse edit_topic(Request request, Response response) {
        String tid = request.query("tid");
        String title = request.query("title");
        String content = request.query("content");
        Integer nid = request.queryAsInt("nid");

        if (null == tid) {
            return RestResponse.fail("不存在该帖子");
        }

        // 不存在该帖子
        Topic topic = topicService.getTopicById(tid);
        if (null == topic) {
            return RestResponse.fail("不存在该帖子");
        }

        // 无权限操作
        if (!topic.getUsername().equals(getLoginUser().getUsername())) {
            return RestResponse.fail("无权限操作该帖");
        }

        // 超过300秒
        if ((DateKit.getCurrentUnixTime() - topic.getCreated()) > 300) {
            return RestResponse.fail("超过300秒禁止编辑");
        }

        if (StringKit.isBlank(title) || StringKit.isBlank(content) || null == nid) {
            return RestResponse.fail("部分内容未输入");
        }

        if (title.length() < 4 || title.length() > 50) {
            return RestResponse.fail("标题长度在4-50个字符哦");
        }

        if (content.length() < 5) {
            return RestResponse.fail("您真是一字值千金啊。");
        }

        if (content.length() > 10000) {
            return RestResponse.fail("内容太长了，试试少吐点口水");
        }

        Integer last_time = topicService.getLastUpdateTime(getUsername());
        if (null != last_time && (DateKit.getCurrentUnixTime() - last_time) < 10) {
            return RestResponse.fail("您操作频率太快，过一会儿操作吧！");
        }

        try {

            title = Utils.cleanXSS(title);
            content = Utils.cleanXSS(content);

            // 编辑帖子
            topicService.update(tid, nid, title, content);
            userlogService.save(Userlog.builder().uid(getUid()).action(Actions.UPDATE_TOPIC).content(content).build());

            return RestResponse.ok(tid);
        } catch (Exception e) {
            return fail(e, "编辑帖子失败");
        }
    }

    /**
     * 发布帖子操作
     */
    @Route(value = "/topic/add", method = HttpMethod.POST)
    @JSON
    @Access
    public RestResponse publish(@QueryParam String title,
                                @QueryParam String content,
                                @QueryParam Integer nid) {

        if (StringKit.isBlank(title) || StringKit.isBlank(content) || null == nid) {
            return RestResponse.fail("部分内容未输入");
        }

        if (title.length() < 4 || title.length() > 50) {
            return RestResponse.fail("标题长度在4-50个字符哦");
        }

        if (content.length() < 5) {
            return RestResponse.fail("您真是一字值千金啊。");
        }

        if (content.length() > 10000) {
            return RestResponse.fail("内容太长了，试试少吐点口水");
        }

        Integer uid = getUid();

        Integer last_time = topicService.getLastCreateTime(getUsername());
        if (null != last_time && (DateKit.getCurrentUnixTime() - last_time) < 10) {
            return RestResponse.fail("您操作频率太快，过一会儿操作吧！");
        }

        title = Utils.cleanXSS(title);
        content = Utils.cleanXSS(content);

        // 发布帖子
        try {
            Topic topic = new Topic();
            topic.setUsername(getLoginUser().getUsername());
            topic.setNid(nid);
            topic.setTitle(title);
            topic.setContent(content);
            topic.setIs_top(0);
            String tid = topicService.publish(topic);
            Constant.SYS_INFO = optionsService.getSystemInfo();
            Constant.VIEW_CONTEXT.set("sys_info", Constant.SYS_INFO);
            userlogService.save(Userlog.builder().uid(uid).action(Actions.ADD_TOPIC).content(content).build());
            return RestResponse.ok(tid);
        } catch (Exception e) {
            return fail(e, "发布帖子失败");
        }
    }

    private void putData(Request request) {
        List<NodeTree> nodes = nodeService.getTree();
        request.attribute("nodes", nodes);
    }

    /**
     * 帖子详情页面
     */
    @Route(value = "/topic/:tid", method = HttpMethod.GET)
    public ModelAndView show_topic(@PathParam("tid") String tid, Request request, Response response) {

        Topic topic = topicService.getTopicById(tid);
        if (null == topic || topic.getStatus() != 1) {
            response.go("/");
            return null;
        }

        this.putDetail(request, getUid(), topic);

        // 刷新浏览数
        topicService.addViews(tid);
        return this.getView("topic_detail");
    }

    private void putDetail(Request request, Integer uid, Topic topic) {

        Integer page = request.queryInt("p");
        if (null == page || page < 1) {
            page = 1;
        }

        // 帖子详情
        Map<String, Object> topicMap = topicService.getTopicMap(topic, true);
        request.attribute("topic", topicMap);

        // 是否收藏
        boolean is_favorite = favoriteService.isFavorite(Favorite.builder().uid(uid).event_type("topic").favorite_type(Actions.FAVORITE).event_id(topic.getTid()).build());
        request.attribute("is_favorite", is_favorite);

        // 是否点赞
        boolean is_love = favoriteService.isFavorite(Favorite.builder().uid(uid).event_type("topic").favorite_type(Actions.LOVE).event_id(topic.getTid()).build());
        request.attribute("is_love", is_love);

        Take cp = new Take(Comment.class);
        cp.eq("tid", topic.getTid()).asc("cid").page(page, 20);
        Paginator<Map<String, Object>> commentPage = commentService.getPages(cp);
        request.attribute("commentPage", commentPage);
    }

    /**
     * 评论帖子操作
     */
    @Route(value = "/topic/comment", method = HttpMethod.POST)
    @JSON
    @Access
    public RestResponse comment(Request request, Response response,
                                @QueryParam String content, @QueryParam String tid) {

        Topic topic = topicService.getTopicById(tid);
        if (null == topic) {
            response.go("/");
            return null;
        }
        try {
            if (StringKit.isBlank(content)) {
                return RestResponse.fail("骚年，有些东西木有填哎！");
            }

            content = Utils.cleanXSS(content);

            if (content.length() > 5000) {
                return RestResponse.fail("内容太长了，试试少吐点口水。");
            }

            Integer uid = getUid();

            Comment comment = Comment.builder()
                    .tid(tid)
                    .author(getLoginUser().getUsername())
                    .owner(topic.getUsername())
                    .content(content)
                    .agent(request.userAgent()).ip(request.address()).build();

            topicService.comment(comment, topic.getTitle());
            Constant.SYS_INFO = optionsService.getSystemInfo();
            Constant.VIEW_CONTEXT.set("sys_info", Constant.SYS_INFO);
            userlogService.save(Userlog.builder().uid(uid).action(Actions.ADD_COMMENT).content(content).build());
            return RestResponse.ok();
        } catch (Exception e) {
            return fail(e, "评论帖子失败");
        }
    }

    /**
     * 加精和取消加精
     */
    @Route(value = "/topic/essence", method = HttpMethod.POST)
    @JSON
    @Access(level = AccessLevel.ADMIN)
    public RestResponse doEssence(Request request) {

        String tid = request.query("tid");
        if (StringKit.isBlank(tid)) {
            return RestResponse.fail();
        }

        Topic topic = topicService.getTopicById(tid);
        if (null == topic) {
            return RestResponse.fail("不存在该帖子");
        }

        try {
            Integer count = topic.getIs_essence() == 1 ? 0 : 1;
            topicService.essence(tid, count);
            userlogService.save(Userlog.builder().uid(getUid()).action(Actions.ESSENCE).content(tid + ":" + count).build());
            return RestResponse.ok(tid);
        } catch (Exception e) {
            return fail(e, "设置失败");
        }
    }

    /**
     * 帖子下沉
     */
    @Route(value = "/topic/sink", method = HttpMethod.POST)
    @JSON
    @Access(level = AccessLevel.ADMIN)
    public RestResponse sink(Request request) {

        String tid = request.query("tid");
        if (StringKit.isBlank(tid)) {
            return RestResponse.fail();
        }

        try {
            Integer uid = getUid();
            boolean isFavorite = favoriteService.isFavorite(Favorite.builder().uid(uid).event_type("topic").favorite_type(Actions.SINK).event_id(tid).build());
            if (!isFavorite) {
//                favoriteService.update(Types.sinks.toString(), user.getUid(), tid);
//                topicCountService.update(Types.sinks.toString(), tid, 1);
                topicService.updateWeight(tid);
                userlogService.save(Userlog.builder().uid(uid).action(Actions.SINK).content(tid).build());
            }
            return RestResponse.ok(tid);
        } catch (Exception e) {
            return fail(e, "设置失败");
        }
    }

    /**
     * 删除帖子
     */
    @Route(value = "/topic/delete", method = HttpMethod.POST)
    @JSON
    @Access(level = AccessLevel.SADMIN)
    public RestResponse delete(Request request, @QueryParam String tid) {
        try {
            topicService.delete(tid);
            return RestResponse.ok(tid);
        } catch (Exception e) {
            return fail(e, "删除帖子失败");
        }
    }

    /**
     * 精华帖页面
     */
    @Route(value = "/essence", method = HttpMethod.GET)
    public ModelAndView essence(Request request, Response response) {
        // 帖子
        Take tp = new Take(Topic.class);
        Integer page = request.queryInt("p", 1);
        Paginator<HomeTopic> topicPage = topicService.getEssenceTopics(page, 15);
        tp.eq("status", 1).eq("is_essence", 1).desc("created", "updated").page(page, 15);
        request.attribute("topicPage", topicPage);
        return this.getView("essence");
    }

}
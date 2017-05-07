package com.javachina.service.impl;

import com.blade.ioc.annotation.Inject;
import com.blade.ioc.annotation.Service;
import com.blade.jdbc.ar.SampleActiveRecord;
import com.blade.jdbc.core.Take;
import com.blade.jdbc.model.PageRow;
import com.blade.jdbc.model.Paginator;
import com.blade.kit.BeanKit;
import com.blade.kit.CollectionKit;
import com.blade.kit.DateKit;
import com.blade.kit.StringKit;
import com.javachina.constants.Actions;
import com.javachina.constants.EventType;
import com.javachina.dto.HomeTopic;
import com.javachina.exception.TipException;
import com.javachina.ext.Funcs;
import com.javachina.ext.PageHelper;
import com.javachina.kit.Utils;
import com.javachina.model.*;
import com.javachina.service.*;
import com.vdurmont.emoji.EmojiParser;
import org.sql2o.Sql2o;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Service
public class TopicServiceImpl implements TopicService {

    @Inject
    private SampleActiveRecord activeRecord;

    @Inject
    private UserService userService;

    @Inject
    private NodeService nodeService;

    @Inject
    private CommentService commentService;

    @Inject
    private OptionsService optionsService;

    @Inject
    private RemindService remindService;

    @Override
    public Topic getTopicById(String tid) {
        return activeRecord.byId(Topic.class, tid);
    }

    @Override
    public Paginator<Map<String, Object>> getPageList(Take take) {
        if (null != take) {
            Paginator<Topic> topicPage = activeRecord.page(take);
            return this.getTopicPageMap(topicPage);
        }
        return null;
    }

    private List<Map<String, Object>> getTopicListMap(List<Topic> topics) {
        List<Map<String, Object>> topicMaps = new ArrayList<Map<String, Object>>();
        if (null != topics && topics.size() > 0) {
            for (Topic topic : topics) {
                Map<String, Object> map = this.getTopicMap(topic, false);
                if (null != map && !map.isEmpty()) {
                    topicMaps.add(map);
                }
            }
        }
        return topicMaps;
    }

    private Paginator<Map<String, Object>> getTopicPageMap(Paginator<Topic> topicPage) {
        long totalCount = topicPage.getTotal();
        int page = topicPage.getPageNum();
        int pageSize = topicPage.getLimit();
        Paginator<Map<String, Object>> result = new Paginator<>(totalCount, page, pageSize);

        List<Topic> topics = topicPage.getList();
        List<Map<String, Object>> topicMaps = this.getTopicListMap(topics);
        result.setList(topicMaps);
        return result;
    }

    @Override
    public String publish(Topic topic) {
        if (null == topic) {
            throw new TipException("帖子信息为空");
        }
        Integer time = DateKit.getCurrentUnixTime();
        String tid = Utils.genTopicID();
        topic.setCreated(time);
        topic.setUpdated(time);
        topic.setStatus(1);

        activeRecord.insert(topic);
        Integer uid = topic.getUid();
        this.updateWeight(tid);
        // 更新节点下的帖子数
        nodeService.updateCount(topic.getNid(), EventType.TOPICS, +1);
        // 更新总贴数
        optionsService.updateCount(EventType.TOPIC_COUNT, +1);

        // 通知@的人
        Set<String> atUsers = Utils.getAtUsers(topic.getContent());
        if (CollectionKit.isNotEmpty(atUsers)) {
            for (String user_name : atUsers) {
                User user = userService.getUserByLoginName(user_name);
                if (null != user && !user.getUid().equals(topic.getUid())) {
//                    eventService.save(Types.topic_at.toString(), uid, user.getUid(), tid);
                }
            }
        }
        return tid;
    }

    @Override
    public void delete(String tid) {
        if (null == tid) {
            throw new TipException("帖子id为空");
        }
        Topic topic = this.getTopicById(tid);
        if (null == topic) {
            throw new TipException("不存在该帖子");
        }
        Topic temp = new Topic();
        temp.setTid(tid);
        temp.setStatus(2);
        activeRecord.update(temp);

        // 更新节点下的帖子数
        nodeService.updateCount(topic.getNid(), EventType.TOPICS, +1);
        // 更新总贴数
        optionsService.updateCount(EventType.TOPIC_COUNT, +1);
    }

    @Override
    public Map<String, Object> getTopicMap(Topic topic, boolean isDetail) {
        if (null == topic) {
            return null;
        }
        String tid = topic.getTid();
        Integer uid = topic.getUid();
        Integer nid = topic.getNid();

        User user = userService.getUserById(uid);
        Node node = nodeService.getNodeById(nid);

        Map<String, Object> map = BeanKit.beanToMap(topic);
        if (null != user) {
            map.put("username", user.getUsername());
            String avatar = Funcs.avatar_url(user.getAvatar());
            map.put("avatar", avatar);
        }

        if (null != node) {
            map.put("node_name", node.getTitle());
            map.put("node_slug", node.getSlug());
        }

        if (topic.getComments() > 0) {
//            Comment comment = commentService.getTopicLastComment(tid);
//            if (null != comment) {
//                User reply_user = userService.getUserById(comment.getOwner_id());
//                map.put("reply_name", reply_user.getUsername());
//            }
        }

        if (isDetail) {
            String content = Utils.markdown2html(topic.getContent());
            map.put("content", content);
        } else {
            map.remove("content");
        }

        return map;
    }


    /**
     * 评论帖子
     *
     * @param uid     评论人uid
     * @param to_uid  发帖人uid
     * @param tid     帖子id
     * @param content 评论内容
     * @return
     */
    @Override
    public boolean comment(Comment comment, String title) {
        try {

            if (null == comment) {
                throw new TipException("评论不能为空");
            }

            String content = comment.getContent();
            Integer last_time = this.getLastUpdateTime(comment.getAuthor_id());
            if (null != last_time && (DateKit.getCurrentUnixTime() - last_time) < 10) {
                throw new TipException("您操作频率太快，过一会儿操作吧！");
            }

            content = EmojiParser.parseToAliases(content);

            Integer cid = commentService.save(comment);

            this.updateWeight(comment.getTid());

            // 通知
            if (!comment.getAuthor_id().equals(comment.getOwner_id())) {

                remindService.saveRemind(Remind.builder().from_user(comment.getAuthor()).to_uid(comment.getOwner_id()).event_id(comment.getTid())
                        .title(title).content(content).remind_type(Actions.COMMENT).build());

                // 通知@的用户
                Set<String> atUsers = Utils.getAtUsers(content);
                if (CollectionKit.isNotEmpty(atUsers)) {
                    for (String user_name : atUsers) {
                        User user = userService.getUserByLoginName(user_name);
                        if (null != user && !user.getUid().equals(comment.getAuthor_id())) {
                            remindService.saveRemind(Remind.builder().from_user(comment.getAuthor()).to_uid(user.getUid()).event_id(comment.getTid())
                                    .title(title).content(content).remind_type(Actions.AT).build());
                        }
                    }
                }
                // 更新总评论数
                optionsService.updateCount(EventType.COMMENT_COUNT, +1);
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Integer getTopics(Integer uid) {
        if (null != uid) {
            Topic topic = new Topic();
            topic.setUid(uid);
            topic.setStatus(1);
            return activeRecord.count(topic);
        }
        return 0;
    }

    @Override
    public String update(String tid, Integer nid, String title, String content) {
        if (null != tid && null != nid && StringKit.isNotBlank(title) && StringKit.isNotBlank(content)) {
            try {
                Topic topic = new Topic();
                topic.setTid(tid);
                topic.setNid(nid);
                topic.setTitle(title);
                topic.setContent(content);
                topic.setUpdated(DateKit.getCurrentUnixTime());
                activeRecord.update(topic);
                return tid;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    @Override
    public Integer getLastCreateTime(Integer uid) {
        if (null == uid) {
            return null;
        }
        return activeRecord.one(Integer.class, "select created from t_topic where uid = ? order by created desc limit 1", uid);
    }

    @Override
    public Integer getLastUpdateTime(Integer uid) {
        if (null == uid) {
            return null;
        }
        return activeRecord.one(Integer.class, "select updated from t_topic where uid = ? order by created desc limit 1", uid);
    }

    @Override
    public void refreshWeight() {
        try {
            List<String> topics = activeRecord.list(String.class, "select tid from t_topic where status = 1");
            if (null != topics) {
                for (String tid : topics) {
                    this.updateWeight(tid);
                }
            }
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public void updateWeight(String tid) {
        updateWeight(this.getTopicById(tid));
    }

    public void updateWeight(String tid, Integer loves, Integer favorites, Integer comment, Integer sinks, Integer created) {
        try {
            double weight = Utils.getWeight(loves, favorites, comment, sinks, created);
            Topic topic = new Topic();
            topic.setTid(tid);
            topic.setWeight(weight);
            activeRecord.update(topic);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public void essence(String tid, Integer count) {
        try {
            Topic topic = new Topic();
            topic.setTid(tid);
            topic.setIs_essence(count);
            activeRecord.update(topic);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateWeight(Topic topic) {
        try {
            if (null == topic) {
                throw new TipException("帖子为空");
            }
            Integer loves = topic.getLoves();
            Integer favorites = topic.getFavorites();
            Integer comment = topic.getComments();
            Integer sinks = topic.getSinks();
            Integer created = topic.getCreated();
            this.updateWeight(topic.getTid(), loves, favorites, comment, sinks, created);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public Paginator<HomeTopic> getHomeTopics(Integer nid, int page, int limit) {
        return getTopics(nid, page, limit, "a.weight desc");
    }

    @Override
    public Paginator<HomeTopic> getRecentTopics(Integer nid, int page, int limit) {
        return getTopics(nid, page, limit, "a.updated desc");
    }

    @Override
    public Paginator<HomeTopic> getEssenceTopics(int page, int limit) {
        if (page <= 0) {
            page = 1;
        }
        if (limit <= 0 || limit >= 50) {
            limit = 20;
        }
        String sql = "select a.tid, a.title, c.title as node_title, c.slug as node_slug from t_topic a " +
                "left join t_node c on a.nid = c.nid " +
                "where a.status=1 and a.is_essence=1 order by a.created desc, a.updated desc";

        Sql2o sql2o = activeRecord.sql2o();
        Paginator<HomeTopic> topicPaginator = PageHelper.go(sql2o, HomeTopic.class, sql, new PageRow(page, limit));
        return topicPaginator;

    }

    private Paginator<HomeTopic> getTopics(Integer nid, int page, int limit, String orderBy) {
        if (page <= 0) {
            page = 1;
        }
        if (limit <= 0 || limit >= 50) {
            limit = 20;
        }
        String sql = "select b.username, b.avatar, a.tid, a.title, a.created, a.updated," +
                " c.title as node_title, c.slug as node_slug, a.comments from t_topic a " +
                "left join t_user b on a.uid = b.uid " +
                "left join t_node c on a.nid = c.nid " +
                "where a.status=1 ";
        if (null != nid) {
            sql += "and a.nid = :p1 ";
        }
        sql += "order by " + orderBy;

        Sql2o sql2o = activeRecord.sql2o();
        Paginator<HomeTopic> topicPaginator;

        if (null != nid) {
            topicPaginator = PageHelper.go(sql2o, HomeTopic.class, sql, new PageRow(page, limit), nid);
        } else {
            topicPaginator = PageHelper.go(sql2o, HomeTopic.class, sql, new PageRow(page, limit));
        }
        return topicPaginator;
    }

    @Override
    public List<HomeTopic> getHotTopics(int page, int limit) {
        if (page <= 0) {
            page = 1;
        }
        if (limit <= 0 || limit >= 50) {
            limit = 10;
        }

        String sql = "select b.username, b.avatar, a.tid, a.title from t_topic a " +
                "left join t_user b on a.uid = b.uid " +
                "where a.status = 1 order by a.weight desc, a.comments desc";

        Sql2o sql2o = activeRecord.sql2o();
        Paginator<HomeTopic> topicPaginator = PageHelper.go(sql2o, HomeTopic.class, sql, new PageRow(page, limit));
        if (null != topicPaginator) {
            return topicPaginator.getList();
        }
        return null;
    }

    @Override
    public void addViews(String tid) {
        if (StringKit.isNotBlank(tid)) {
            String sql = "update t_topic set views = views+1 where tid = ?";
            activeRecord.execute(sql, tid);
        }
    }
}

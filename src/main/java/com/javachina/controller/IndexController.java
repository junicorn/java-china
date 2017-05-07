package com.javachina.controller;

import com.blade.ioc.annotation.Inject;
import com.blade.jdbc.core.Take;
import com.blade.jdbc.model.Paginator;
import com.blade.kit.StringKit;
import com.blade.kit.base.MapCache;
import com.blade.mvc.annotation.Controller;
import com.blade.mvc.annotation.PathParam;
import com.blade.mvc.annotation.Route;
import com.blade.mvc.http.HttpMethod;
import com.blade.mvc.http.Request;
import com.blade.mvc.http.Response;
import com.blade.mvc.view.ModelAndView;
import com.javachina.constants.Actions;
import com.javachina.constants.Constant;
import com.javachina.dto.HomeTopic;
import com.javachina.dto.LoginUser;
import com.javachina.dto.NodeTree;
import com.javachina.kit.FamousDay;
import com.javachina.kit.SessionKit;
import com.javachina.kit.Utils;
import com.javachina.model.Favorite;
import com.javachina.model.Node;
import com.javachina.service.FavoriteService;
import com.javachina.service.NodeService;
import com.javachina.service.TopicService;
import lombok.extern.slf4j.Slf4j;

import java.util.List;
import java.util.Map;

/**
 * 首页控制器
 */
@Controller
@Slf4j
public class IndexController extends BaseController {

    @Inject
    private TopicService topicService;

    @Inject
    private NodeService nodeService;

    @Inject
    private FavoriteService favoriteService;

    private MapCache mapCache = MapCache.single();

    /**
     * 首页热门
     */
    @Route(value = "/", method = HttpMethod.GET)
    public ModelAndView show_home(Request request) {

        this.putData(request);

        // 帖子
        String tab = request.query("tab");
        Integer page = request.queryAsInt("p");
        Integer nid = null;

        if (StringKit.isNotBlank(tab)) {
            Take np = new Take(Node.class);
            np.eq("status", 1).eq("slug", tab);
            Node node = nodeService.getNodeByTake(np);
            if (null != node) {
                nid = node.getNid();
                request.attribute("tab", tab);
                request.attribute("node_name", node.getTitle());
            }
        }

        Paginator<HomeTopic> topicPage = topicService.getHomeTopics(nid, page, 20);
        request.attribute("topicPage", topicPage);

        // 最热帖子
        List<HomeTopic> hotTopics = mapCache.get(Constant.C_HOT_TOPICS);
        if (null == hotTopics) {
            hotTopics = topicService.getHotTopics(1, 10);
            mapCache.set(Constant.C_HOT_TOPICS, hotTopics, 60 * 10);
        }
        request.attribute("hot_topics", hotTopics);

        // 最热门的8个节点
        List<Node> hotNodes = mapCache.get(Constant.C_HOT_NODES);
        if (null == hotNodes) {
            hotNodes = nodeService.getHotNodes(1, 8);
            mapCache.set(Constant.C_HOT_NODES, hotNodes, 60 * 60 * 12);
        }
        request.attribute("hot_nodes", hotNodes);

        return this.getView("home");
    }

    /**
     * 最新
     */
    @Route(value = "/recent", method = HttpMethod.GET)
    public ModelAndView show_recent(Request request) {

        this.putData(request);

        // 帖子
        String tab = request.query("tab");
        Integer page = request.queryAsInt("p");
        Integer nid = null;

        if (StringKit.isNotBlank(tab)) {
            Take np = new Take(Node.class);
            np.eq("status", 1).eq("slug", tab);
            Node node = nodeService.getNodeByTake(np);
            if (null != node) {
                nid = node.getNid();
                request.attribute("tab", tab);
                request.attribute("node_name", node.getTitle());
            }
        }

        Paginator<HomeTopic> topicPage = topicService.getRecentTopics(nid, page, 15);
        request.attribute("topicPage", topicPage);

        // 最热帖子
        List<HomeTopic> hotTopics = mapCache.get(Constant.C_HOT_TOPICS);
        if (null == hotTopics) {
            hotTopics = topicService.getHotTopics(1, 10);
            mapCache.set(Constant.C_HOT_TOPICS, hotTopics, 60 * 10);
        }
        request.attribute("hot_topics", hotTopics);

        // 最热门的8个节点
        List<Node> hotNodes = mapCache.get(Constant.C_HOT_NODES);
        if (null == hotNodes) {
            hotNodes = nodeService.getHotNodes(1, 8);
            mapCache.set(Constant.C_HOT_NODES, hotNodes, 60 * 60 * 12);
        }
        request.attribute("hot_nodes", hotNodes);

        return this.getView("recent");
    }

    /**
     * 放置节点
     *
     * @param request
     */
    private void putData(Request request) {

        List<NodeTree> nodes = mapCache.get(Constant.C_HOME_NODE_KEY);
        if (null == nodes) {
            // 读取节点列表
            nodes = nodeService.getTree();
            mapCache.set(Constant.C_HOME_NODE_KEY, nodes, 60 * 60 * 12);
        }

        request.attribute("nodes", nodes);

        FamousDay famousDay = mapCache.get(Constant.C_HOME_FAMOUS_KEY);
        if (null == famousDay) {
            // 每日格言
            famousDay = Utils.getTodayFamous();
            mapCache.set(Constant.C_HOME_FAMOUS_KEY, famousDay, 60 * 60 * 12);
        }

        request.attribute("famousDay", famousDay);
    }

    /**
     * 节点主题页
     */
    @Route(value = "/go/:slug", method = HttpMethod.GET)
    public ModelAndView go(@PathParam("slug") String slug,
                           Request request, Response response) {

        Take np = new Take(Node.class);
        np.eq("status", 1).eq("slug", slug);
        Node node = nodeService.getNodeByTake(np);
        if (null == node) {
            // 不存在的节点
            response.go("/");
            return null;
        }

        // 查询是否收藏
        boolean is_favorite = favoriteService.isFavorite(Favorite.builder().uid(getUid()).event_id(node.getNid().toString()).event_type("node").favorite_type(Actions.FAVORITE).build());
        request.attribute("is_favorite", is_favorite);

        Integer page = request.queryAsInt("page");

        Paginator<HomeTopic> topicPage = topicService.getRecentTopics(node.getNid(), page, 15);
        request.attribute("topicPage", topicPage);

        Map<String, Object> nodeMap = nodeService.getNodeDetail(null, node.getNid());
        request.attribute("node", nodeMap);

        return this.getView("node_detail");
    }

    /**
     * markdown页面
     */
    @Route(value = "/markdown", method = HttpMethod.GET)
    public String markdown() {
        return "markdown";
    }

    /**
     * about页面
     */
    @Route(value = "/about", method = HttpMethod.GET)
    public String about() {
        return "about";
    }

    /**
     * faq页面
     */
    @Route(value = "/faq", method = HttpMethod.GET)
    public String faq() {
        return "faq";
    }

    /**
     * donate页面
     */
    @Route(value = "/donate", method = HttpMethod.GET)
    public String donate() {
        return "donate";
    }

}
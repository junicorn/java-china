package com.javachina.controller.admin;

import com.blade.Blade;
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
import com.javachina.constants.Constant;
import com.javachina.controller.BaseController;
import com.javachina.model.Node;
import com.javachina.model.User;
import com.javachina.service.*;
import lombok.extern.slf4j.Slf4j;

import java.io.File;
import java.util.List;
import java.util.Map;

@Controller("/admin/")
@Slf4j
public class IndexController extends BaseController {

    @Inject
    private TopicService topicService;

    @Inject
    private NodeService nodeService;

    @Inject
    private UserService userService;

    @Inject
    private OptionsService optionsService;

    @Inject
    private CodesService codesService;

    private MapCache mapCache = MapCache.single();

    /**
     * 首页
     */
    @Route(value = "/")
    public ModelAndView show_home(Request request, Response response) {
        return this.getAdminView("home");
    }

    /**
     * 节点列表页面
     */
    @Route(value = "nodes")
    public ModelAndView show_nodes(Request request, Response response) {
        Integer page = request.queryAsInt("p");
        if (null == page || page < 1) {
            page = 1;
        }
        Take np = new Take(Node.class);
        np.eq("status", 1).page(page, 10, "topics desc");
        Paginator<Map<String, Object>> nodePage = nodeService.getPageList(np);
        request.attribute("nodePage", nodePage);
        return this.getAdminView("nodes");
    }

    /**
     * 添加节点页面
     */
    @Route(value = "nodes/add", method = HttpMethod.GET)
    public ModelAndView show_add_node(Request request, Response response) {
        putData(request);
        return this.getAdminView("add_node");
    }

    public void putData(Request request) {
        Take np = new Take(Node.class);
        np.eq("status", 1).eq("pid", 0).desc("topics");
        List<Node> nodes = nodeService.getNodeList(np);
        request.attribute("nodes", nodes);
    }

    /**
     * 添加新节点
     *
     * @return
     */
    @Route(value = "nodes/add", method = HttpMethod.POST)
    public ModelAndView add_node(Request request, Response response) {

        String title = request.query("node_name");
        String description = request.query("description");
        String node_slug = request.query("node_slug");
        Integer pid = request.queryAsInt("pid");
        String node_pic = request.query("node_pic");

        if (StringKit.isBlank(title) || StringKit.isBlank(node_slug) || null == pid) {
            request.attribute(this.ERROR, "骚年，有些东西木有填哎！！");
            request.attribute("node_name", title);
            request.attribute("node_slug", node_slug);
            return this.getAdminView("add_node");
        }

        Node node = new Node();
        node.setTitle(title);
        node.setDescription(description);
        node.setSlug(node_slug);
        node.setPid(pid);
        node.setThumb_img(node_pic);

        try {
            nodeService.save(node);
            response.go("/admin/nodes");
        } catch (Exception e) {
            log.error("添加节点失败", e);
            request.attribute(this.ERROR, "节点添加失败");
            request.attribute("node_name", title);
            request.attribute("node_slug", node_slug);
        }
        return this.getAdminView("add_node");
    }

    /**
     * 编辑节点页面
     */
    @Route(value = "nodes/:nid", method = HttpMethod.GET)
    public ModelAndView show_edit_node(@PathParam("nid") Integer nid, Request request, Response response) {

        Map<String, Object> nodeMap = nodeService.getNodeDetail(null, nid);
        request.attribute("node", nodeMap);
        putData(request);
        return this.getAdminView("edit_node");
    }

    /**
     * 编辑节点
     */
    @Route(value = "nodes/edit", method = HttpMethod.POST)
    public void edit_node(Request request, Response response) {

        Integer nid = request.queryAsInt("nid");
        String title = request.query("node_name");
        String description = request.query("description");
        String node_slug = request.query("node_slug");
        Integer pid = request.queryAsInt("pid");
        String node_pic = request.query("node_pic");

        if (StringKit.isNotBlank(node_pic)) {
            node_pic = Blade.$().webRoot() + File.separator + node_pic;
        }

        try {
            Node node = new Node();
            node.setNid(nid);
            node.setPid(pid);
            node.setTitle(title);
            node.setDescription(description);
            node.setSlug(node_slug);
            node.setThumb_img(node_pic);
            nodeService.update(node);
            this.success(response, "");
        } catch (Exception e) {
            log.error("节点修改失败", e);
            this.error(response, "节点修改失败");
        }
    }

    /**
     * 用户列表页面
     */
    @Route(value = "users")
    public ModelAndView show_users(Request request, Response response) {
        Integer page = request.queryAsInt("p");
        String email = request.query("email");
        if (null == page || page < 1) {
            page = 1;
        }
        Take up = new Take(User.class);
        if (StringKit.isNotBlank(email)) {
            up.eq("email", email);
            request.attribute("email", email);
        }
        up.orderby("updated desc").page(page, 15);
        Paginator<User> userPage = userService.getPageList(up);
        request.attribute("userPage", userPage);
        return this.getAdminView("users");
    }

    /**
     * 系统设置页面
     */
    @Route(value = "settings")
    public ModelAndView show_settings(Request request, Response response) {
        Map<String, Object> options = optionsService.getSystemInfo();
        request.attribute("options", options);
        return this.getAdminView("settings");
    }

    /**
     * 保存系统设置
     */
    @Route(value = "settings", method = HttpMethod.POST)
    public void save_settings(Request request, Response response) {
        String site_title = request.query("site_title");
        String site_keywords = request.query("site_keywords");
        String site_description = request.query("site_description");
        String allow_signup = request.query("allow_signup");
        optionsService.update(site_title, site_keywords, site_description, allow_signup);
        Constant.SYS_INFO = optionsService.getSystemInfo();
        Constant.VIEW_CONTEXT.set("sys_info", Constant.SYS_INFO);
        this.success(response, "");
    }

    /**
     * 修改用户状态
     */
    @Route(value = "status", method = HttpMethod.POST)
    public void updateStatus(Request request, Response response) {
        String type = request.query("type");
        Integer uid = request.queryAsInt("uid");
        Integer status = request.queryAsInt("status");
        Integer role_id = request.queryAsInt("role_id");

        if (StringKit.isBlank(type) || null == uid) {
            this.error(response, "缺少参数");
            return;
        }
        try {
            // 重新发送激活邮件
//            if (type.equals(Types.resend.toString())) {
//                codesService.resend(uid);
//            }
            if (null != status) {
                userService.update(User.builder().uid(uid).status(status).build());
            }

            if (null != role_id) {
                userService.update(User.builder().uid(uid).role_id(role_id).build());
            }

            this.success(response, "");
        } catch (Exception e) {
            log.error("", e);
        }

    }

    /**
     * 系统工具
     */
    @Route(value = "tools")
    public ModelAndView show_tools(Request request, Response response) {
        return this.getAdminView("tools");
    }

    /**
     * 执行系统工具
     */
    @Route(value = "tools", method = HttpMethod.POST)
    public ModelAndView save_tools(Request request, Response response) {
        String type = request.query("type");
        if (StringKit.isBlank(type)) {
            request.attribute(this.ERROR, "请选择执行的操作");
            return this.getAdminView("tools");
        }

        if (type.equals("clean_cache")) {
            mapCache.clean();
            request.attribute(this.INFO, "执行成功");
            return this.getAdminView("tools");
        }

        // 刷新帖子权重，慎用会扫描全表
        if (type.equals("refresh_weight")) {
            try {
                topicService.refreshWeight();
                request.attribute(this.INFO, "权重刷新成功，请在首页进行查看。");
            } catch (Exception e) {
                e.printStackTrace();
                request.attribute(this.ERROR, "刷新失败");
            }
            return this.getAdminView("tools");
        }

        return this.getAdminView("tools");
    }

}

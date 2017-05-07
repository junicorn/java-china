package com.javachina.service.impl;

import com.blade.ioc.annotation.Inject;
import com.blade.ioc.annotation.Service;
import com.blade.jdbc.ActiveRecord;
import com.blade.jdbc.core.Take;
import com.blade.jdbc.model.Paginator;
import com.blade.kit.DateKit;
import com.blade.kit.StringKit;
import com.javachina.dto.NodeTree;
import com.javachina.exception.TipException;
import com.javachina.ext.Funcs;
import com.javachina.model.Node;
import com.javachina.service.NodeService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class NodeServiceImpl implements NodeService {

    @Inject
    private ActiveRecord activeRecord;

    public Node getNodeById(Integer nid) {
        Node node = activeRecord.byId(Node.class, nid);
        if (null != node && node.getStatus() == 1) {
            return node;
        }
        return null;
    }

    @Override
    public Node getNodeByTake(Take take) {
        return activeRecord.one(take);
    }

    @Override
    public List<Node> getNodeList(Take take) {
        if (null != take) {
            if (null != take.getPageRow()) {
                Paginator<Node> nodePaginator = activeRecord.page(take);
                return null != nodePaginator ? nodePaginator.getList() : null;
            }
            return activeRecord.list(take);
        }
        return null;
    }

    @Override
    public List<NodeTree> getTree() {

        // 查找所有父节点
        Take take = new Take(Node.class);
        take.eq("status", 1).eq("pid", 0).orderby("topics desc");

        List<NodeTree> nodeTrees = new ArrayList<>();

        List<Node> parents = activeRecord.list(take);
        if (parents != null) {
            for (Node parent : parents) {
                NodeTree nodeTree = new NodeTree();
                nodeTree.setNid(parent.getNid());
                nodeTree.setPid(parent.getPid());
                nodeTree.setTitle(parent.getTitle());
                nodeTree.setSlug(parent.getSlug());

                Take temp = new Take(Node.class);
                temp.and("status", 1).and("pid", parent.getNid()).orderby("topics desc");

                List<Node> items = activeRecord.list(temp);
                nodeTree.setItems(items);
                nodeTree.setChilds(null != items ? items.size() : 0);
                nodeTrees.add(nodeTree);
            }
        }
        return nodeTrees;
    }

    @Override
    public Paginator<Map<String, Object>> getPageList(Take take) {
        if (null != take) {
            Paginator<Node> nodePage = activeRecord.page(take);
            return this.getNodePageMap(nodePage);
        }
        return null;
    }

    private Paginator<Map<String, Object>> getNodePageMap(Paginator<Node> nodePage) {

        long totalCount = nodePage.getTotal();
        int page = nodePage.getPageNum();
        int pageSize = nodePage.getLimit();
        Paginator<Map<String, Object>> result = new Paginator<Map<String, Object>>(totalCount, page, pageSize);

        List<Node> nodes = nodePage.getList();

        List<Map<String, Object>> nodeMaps = new ArrayList<>();
        if (null != nodes && nodes.size() > 0) {
            for (Node node : nodes) {
                Map<String, Object> map = this.getNodeDetail(node, null);
                if (null != map && !map.isEmpty()) {
                    nodeMaps.add(map);
                }
            }
        }

        result.setList(nodeMaps);

        return result;
    }

    @Override
    public void save(Node node) {
        if (null == node) {
            throw new TipException("节点信息为空");
        }
        try {
            Integer time = DateKit.getCurrentUnixTime();
            node.setCreated(time);
            node.setUpdated(time);
            activeRecord.insert(node);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public void delete(Integer nid) {
        if (null == nid) {
            throw new TipException("节点id为空");
        }
        try {
            Node temp = new Node();
            temp.setNid(nid);
            temp.setStatus(0);
            activeRecord.update(temp);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public Map<String, Object> getNodeDetail(Node node, Integer nid) {
        Map<String, Object> map = new HashMap<>();
        if (null == node) {
            node = this.getNodeById(nid);
        }
        if (null != node) {
            map.put("nid", node.getNid());
            map.put("node_name", node.getTitle());
            map.put("node_slug", node.getSlug());
            map.put("topics", node.getTopics());
            map.put("pid", node.getPid());

            if (node.getPid() != null) {
                Node parent = this.getNodeById(node.getPid());
                if (null != parent) {
                    map.put("parent_name", parent.getTitle());
                }
            }

            // 查询子节点数
            Integer childs = getNodeCount(node.getNid());
            map.put("childs", childs);
            map.put("description", node.getDescription());
            if (StringKit.isNotBlank(node.getThumb_img())) {
                String pic = Funcs.avatar_url(node.getThumb_img());
                map.put("pic", pic);
            }
        }
        return map;
    }

    private Integer getNodeCount(Integer nid) {
        Node node = new Node();
        node.setPid(nid);
        node.setStatus(1);
        return activeRecord.count(node);
    }

    @Override
    public void updateCount(Integer nid, String type, int count) {
        if (null == nid) {
            throw new TipException("节点id为空");
        }
        if (StringKit.isBlank(type)) {
            throw new TipException("节点类型为空");
        }
        try {
            String sql = "update t_node set %s = (%s + " + count + ") where nid = " + nid;
            activeRecord.execute(String.format(sql, type, type));
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public void update(Node node) {
        try {
            if (null == node) {
                throw new TipException("节点信息为空");
            }

			/*String node_pic = node.getPic();
            if(StringKit.isNotBlank(node_pic)){
				File file = new File(node_pic);
				if(file.exists()){
					String ext = FileKit.getExtension(file.getName());
					if(StringKit.isBlank(ext)){
						ext = "png";
					}
					String key = "node/" + node.getSlug() + "/" + StringKit.getRandomChar(4) + "/" + StringKit.getRandomNumber(4) + "." + ext;

					Tools.copyFileUsingFileChannels(file, file);
					f.file().delete();

					Utils.upload(file, key);
					node.setPic(key);
				}
			}*/
            activeRecord.update(node);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public List<Node> getHotNodes(int page, int limit) {
        if (page <= 0) {
            page = 1;
        }

        if (limit <= 0 || limit > 50) {
            limit = 10;
        }

        Take np = new Take(Node.class);
        np.eq("status", 1).notEq("pid", 0).page(page, limit, "topics desc");

        Paginator<Node> nodePaginator = activeRecord.page(np);
        if (null != nodePaginator) {
            return nodePaginator.getList();
        }
        return null;
    }
}

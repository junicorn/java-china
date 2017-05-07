package com.javachina.service;

import com.blade.jdbc.core.Take;
import com.blade.jdbc.model.Paginator;
import com.javachina.model.Node;
import com.javachina.dto.NodeTree;

import java.util.List;
import java.util.Map;

public interface NodeService {

    Node getNodeById(Integer nid);

    Node getNodeByTake(Take take);

    Map<String, Object> getNodeDetail(Node node, Integer nid);

    List<Node> getNodeList(Take take);

    List<NodeTree> getTree();

    Paginator<Map<String, Object>> getPageList(Take take);

    void save(Node node);

    void delete(Integer nid);

    void updateCount(Integer nid, String type, int count);

    void update(Node node);

    List<Node> getHotNodes(int page, int limit);
}
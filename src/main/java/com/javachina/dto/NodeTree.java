package com.javachina.dto;

import com.javachina.model.Node;

import java.io.Serializable;
import java.util.List;

/**
 * Created by biezhi on 2016/12/29.
 */
public class NodeTree extends Node implements Serializable {

    private List<Node> items;
    private int childs;

    public List<Node> getItems() {
        return items;
    }

    public NodeTree setItems(List<Node> items) {
        this.items = items;
        return this;
    }

    public int getChilds() {
        return childs;
    }

    public NodeTree setChilds(int childs) {
        this.childs = childs;
        return this;
    }
}

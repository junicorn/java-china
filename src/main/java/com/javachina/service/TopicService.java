package com.javachina.service;

import com.blade.jdbc.core.Take;
import com.blade.jdbc.model.Paginator;
import com.blade.kit.StringKit;
import com.javachina.dto.HomeTopic;
import com.javachina.model.Comment;
import com.javachina.model.Topic;

import java.util.List;
import java.util.Map;

public interface TopicService {

    /**
     * 根据帖子id获取帖子
     *
     * @param tid
     * @return
     */
    Topic getTopicById(String tid);

    Map<String, Object> getTopicMap(Topic topic, boolean isDetail);

    /**
     * 分页获取帖子
     *
     * @param take
     * @return
     */
    Paginator<Map<String, Object>> getPageList(Take take);

    /**
     * 发布帖子病返回帖子id
     *
     * @param topic
     * @return
     */
    String publish(Topic topic);

    /**
     * 更新帖子
     *
     * @param tid
     * @param nid
     * @param title
     * @param content
     * @return
     */
    String update(String tid, Integer nid, String title, String content);

    /**
     * 评论帖子
     *
     * @param uid
     * @param to_uid
     * @param tid
     * @param content
     * @param ua
     * @return
     */
    boolean comment(Comment comment, String title);

    void delete(String tid);

    void refreshWeight();

    /**
     * 更新帖子权重
     *
     * @param tid
     */
    void updateWeight(String tid);

    /**
     * 刷新帖子权重
     *
     * @param tid
     * @param loves
     * @param favorites
     * @param comment
     * @param sinks
     * @param created
     */
    void updateWeight(String tid, Integer loves, Integer favorites, Integer comment, Integer sinks, Integer created);

    /**
     * 获取用户发布的帖子数
     *
     * @param uid
     * @return
     */
    Integer getTopics(String username);

    /**
     * 获取用户最后一次发布帖子时间
     *
     * @param uid
     * @return
     */
    Integer getLastCreateTime(String username);

    /**
     * 获取用户最后一次更新帖子时间
     *
     * @param uid
     * @return
     */
    Integer getLastUpdateTime(String username);

    /**
     * 设置精华帖
     *
     * @param tid
     * @param count
     */
    void essence(String tid, Integer count);

    /**
     * 获取首页帖
     *
     * @param nid
     * @param page
     * @param limit
     * @return
     */
    Paginator<HomeTopic> getHomeTopics(Integer nid, int page, int limit);

    /**
     * 获取最新帖
     *
     * @param nid
     * @param page
     * @param limit
     * @return
     */
    Paginator<HomeTopic> getRecentTopics(Integer nid, int page, int limit);

    /**
     * 获取精华贴
     *
     * @param page
     * @param limit
     * @return
     */
    Paginator<HomeTopic> getEssenceTopics(int page, int limit);

    /**
     * 获取热门贴
     *
     * @param page
     * @param limie
     * @return
     */
    List<HomeTopic> getHotTopics(int page, int limie);

    /**
     * 帖子流量数加1
     *
     * @param tid
     */
    void addViews(String tid);
}

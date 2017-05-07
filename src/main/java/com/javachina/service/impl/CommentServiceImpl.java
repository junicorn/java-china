package com.javachina.service.impl;

import com.blade.ioc.annotation.Inject;
import com.blade.ioc.annotation.Service;
import com.blade.jdbc.ActiveRecord;
import com.blade.jdbc.core.Take;
import com.blade.jdbc.model.Paginator;
import com.blade.kit.BeanKit;
import com.blade.kit.DateKit;
import com.javachina.model.Comment;
import com.javachina.model.User;
import com.javachina.service.CommentService;
import com.javachina.service.UserService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class CommentServiceImpl implements CommentService {

    @Inject
    private ActiveRecord activeRecord;

    @Inject
    private UserService userService;

    @Override
    public Integer save(Comment comment) {
        if (null != comment) {
            comment.setStatus(1);
            comment.setCreated(DateKit.getCurrentUnixTime());
            Long cid = activeRecord.insert(comment);
            return cid.intValue();
        }
        return null;
    }

    @Override
    public Paginator<Map<String, Object>> getPages(Take cp) {
        Paginator<Comment> commentPaginator = activeRecord.page(cp);
        Paginator<Map<String, Object>> paginator = new Paginator<>(commentPaginator.getTotal(), commentPaginator.getPageNum(), commentPaginator.getLimit());
        List<Comment> comments = commentPaginator.getList();
        List<Map<String, Object>> list = new ArrayList<>();
        if (null != comments) {
            comments.forEach(comment -> list.add(getCommentMap(comment)));
        }
        paginator.setList(list);
        return paginator;
    }

    private Map<String, Object> getCommentMap(Comment comment) {
        Map<String, Object> map = BeanKit.beanToMap(comment);
        User user = userService.getByUserName(comment.getAuthor());
        map.put("reply_avatar", user.getAvatar());
        map.put("role_id", user.getRole_id());
        return map;
    }
}

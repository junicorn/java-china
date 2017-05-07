package com.javachina.service.impl;

import com.blade.ioc.annotation.Inject;
import com.blade.ioc.annotation.Service;
import com.blade.jdbc.ActiveRecord;
import com.blade.kit.DateKit;
import com.javachina.model.Comment;
import com.javachina.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {

    @Inject
    private ActiveRecord activeRecord;


    @Override
    public void save(Comment comment) {
        if (null != comment) {
            comment.setStatus(1);
            comment.setCreated(DateKit.getCurrentUnixTime());
            activeRecord.save(comment);
        }
    }
}

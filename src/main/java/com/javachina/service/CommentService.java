package com.javachina.service;

import com.blade.jdbc.core.Take;
import com.blade.jdbc.model.Paginator;
import com.javachina.model.Comment;

import java.util.Map;

public interface CommentService {

    Integer save(Comment comment);

    Paginator<Map<String, Object>> getPages(Take cp);
}

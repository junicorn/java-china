package com.javachina.service;

import com.javachina.model.Openid;

public interface OpenIdService {

    Openid getOpenid(String type, Integer open_id);

    boolean save(String type, Integer open_id, Integer uid);

    boolean delete(String type, Integer uid);

}

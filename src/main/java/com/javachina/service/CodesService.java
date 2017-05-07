package com.javachina.service;

import com.javachina.model.Codes;
import com.javachina.model.User;

public interface CodesService {

    Codes getActivecode(String code);

    String save(User user, String type);

    boolean useCode(String code);

    boolean resend(Integer uid);

}

package com.javachina.service;

import java.util.Map;

public interface OptionsService {

    Map<String, Object> getSystemInfo();

    boolean save(String svalue);

    boolean updateCount(String skey, int count);

    boolean refreshCount();

    boolean update(String site_title, String site_keywords, String site_description, String allow_signup);

}

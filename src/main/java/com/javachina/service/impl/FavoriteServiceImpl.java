package com.javachina.service.impl;

import com.blade.ioc.annotation.Inject;
import com.blade.ioc.annotation.Service;
import com.blade.jdbc.ActiveRecord;
import com.javachina.model.Favorite;
import com.javachina.service.FavoriteService;

/**
 * @author biezhi
 *         2017/5/2
 */
@Service
public class FavoriteServiceImpl implements FavoriteService {

    @Inject
    private ActiveRecord activeRecord;

    @Override
    public boolean isFavorite(Favorite favorite) {
        return false;
    }
}

package com.yb.service;

import com.yb.domain.Menu;
import com.yb.domain.PageListRes;
import com.yb.domain.QueryVo;

import java.util.List;

public interface MenuService {
    PageListRes menuList(QueryVo vo);
}

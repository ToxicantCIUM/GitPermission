package com.yb.service;

import com.yb.domain.PageListRes;
import com.yb.domain.QueryVo;

public interface MenuService {
    PageListRes menuList(QueryVo vo);
}

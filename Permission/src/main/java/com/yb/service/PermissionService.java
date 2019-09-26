package com.yb.service;

import com.yb.domain.Promission;
import com.yb.domain.QueryVo;

import java.util.List;

public interface PermissionService {
    public List<Promission> getPermissionList();

    List<Promission> getPermission(QueryVo vo);
}

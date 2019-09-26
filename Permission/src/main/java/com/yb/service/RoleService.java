package com.yb.service;

import com.yb.domain.PageListRes;
import com.yb.domain.QueryVo;
import com.yb.domain.Role;

import java.util.List;

public interface RoleService {
    public PageListRes getRole(QueryVo vo);

    void saveRole(Role role);

    void updateRole(Role role);

    void deleteRole(long rid);

    List<Role> getRoleList();

    List<Integer> getRoleListById(int id);
}

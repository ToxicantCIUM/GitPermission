package com.yb.service.impl;

import com.yb.domain.Promission;
import com.yb.domain.QueryVo;
import com.yb.mapper.PromissionMapper;
import com.yb.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class PermissionServiceImpl implements PermissionService {

    @Autowired
    private PromissionMapper promissionMapper;

    @Override
    public List<Promission> getPermissionList() {
        List<Promission> permission = promissionMapper.selectAll();
        return permission;
    }

    @Override
    public  List<Promission> getPermission(QueryVo vo) {

        List<Promission> permisssion = promissionMapper.getPermisssion(vo.getRid());
        return permisssion;
    }
}

package com.yb.web;

import com.yb.domain.Promission;
import com.yb.domain.QueryVo;
import com.yb.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class PermissionController {
    @Autowired
    private PermissionService permissionService;

    @RequestMapping("permissionList")
    @ResponseBody
    public List<Promission> getPermissionList(){
        List<Promission> permissionList = permissionService.getPermissionList();
        return permissionList;
    }

    @RequestMapping("/getPermission")
    @ResponseBody
    public List<Promission> getPermission(QueryVo vo){
        System.out.println("Controller---------"+vo);
        List<Promission> permission = permissionService.getPermission(vo);
        System.out.println(permission);
        return permission;
    }
}

package com.yb.web;

import com.yb.domain.PageListRes;
import com.yb.domain.QueryVo;
import com.yb.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MenuController {
    @Autowired
    private MenuService menuService;

    @RequestMapping("/menu")
    public String menu(){
        return "/menu";
    }

    @RequestMapping("/menuList")
    @ResponseBody
    public PageListRes menuList(QueryVo vo){
       PageListRes pageListRes= menuService.menuList(vo);
        System.out.println("------------------------"+pageListRes);
       return pageListRes;
    }
}

package com.yb.web;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yb.domain.AjaxRes;
import com.yb.domain.PageListRes;
import com.yb.domain.QueryVo;
import com.yb.domain.Role;
import com.yb.service.RoleService;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class RoleController {

    @Autowired
    private RoleService roleService;
    @Autowired
    private AjaxRes ajaxRes;

    @RequestMapping("/role")
    @RequiresPermissions("role:index")
    public String role(){
        return "/role";
    }

    /*获取角色*/
    @RequestMapping("/getRole")
    @ResponseBody
    @RequiresPermissions("role:index")
    public PageListRes getRole(QueryVo vo){
        PageListRes pageListRes = roleService.getRole(vo);
        return pageListRes;
    }
    /*保存角色*/
    @RequestMapping("/saveRole")
    @ResponseBody
    @RequiresPermissions("role:save")
    public AjaxRes saveRole(Role role){
        try {
            roleService.saveRole(role);
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("保存成功");
        }catch (Exception e){
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("保存失败");
        }
        return ajaxRes;
    }
    /*更新角色*/
    @RequestMapping("/updateRole")
    @ResponseBody
    @RequiresPermissions("role:edit")
    public AjaxRes updateRole(Role role){
        System.out.println("updata------------role=="+role);
        try {
            roleService.updateRole(role);
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("修改成功");
        }catch (Exception e){
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("修改失败");
        }
        return ajaxRes;
    }
    /*删除角色*/
    @RequestMapping("/deleteRole")
    @ResponseBody
    @RequiresPermissions("role:delete")
    public AjaxRes deleteRole(long rid){
        try {
            roleService.deleteRole(rid);
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("删除成功");
        }catch (Exception e){
            e.printStackTrace();
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("删除失败");
        }
        return ajaxRes;
    }
    /*获取所有角色*/
    @RequestMapping("/getRoleList")
    @ResponseBody
    @RequiresPermissions("role:index")
    public List<Role> getRoleList(){
        return roleService.getRoleList();
    }

    @RequestMapping("/getRoleListById")
    @ResponseBody
    @RequiresPermissions("role:index")
    public List<Integer> getRoleListById(int id){
        List<Integer> roleListById = roleService.getRoleListById(id);
        return roleListById;
    }

    /*没有权限操作返回页面*/
    @ExceptionHandler(AuthorizationException.class)
    public void noPermissionRole(HandlerMethod method, HttpServletResponse response) throws Exception{
        /*判断是ajax请求还是普通的请求*/
        ResponseBody methodAnnotation = method.getMethodAnnotation(ResponseBody.class);
        if (methodAnnotation != null){
            response.setCharacterEncoding("utf-8");
            /*是ajax请求------返回响应不能直接跳转页面*/
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("没有权限访问");
            String s = new ObjectMapper().writeValueAsString(ajaxRes);
            response.getWriter().print(s);
        }else{
            /*不是ajax请求可以直接跳转页面*/
            response.sendRedirect("noPermission.jsp");
        }
    }
}

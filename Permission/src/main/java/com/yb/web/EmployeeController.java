package com.yb.web;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yb.domain.AjaxRes;
import com.yb.domain.Employee;
import com.yb.domain.PageListRes;
import com.yb.domain.QueryVo;
import com.yb.service.EmployeeService;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;

import javax.servlet.http.HttpServletResponse;

@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private AjaxRes ajaxRes;

    @RequestMapping("/employeeList")
    @ResponseBody
    public PageListRes employeeList(QueryVo vo){
        PageListRes pageListRes = employeeService.employeeList(vo);
        return pageListRes;
    }

    @RequestMapping("/employee")
    @RequiresPermissions("employee:index")
    public String employee(){
        return "/employee";
    }

    /*保存员工*/
    @RequestMapping("/saveEmployee")
    @ResponseBody
    @RequiresPermissions("employee:add")
    public AjaxRes saveEmployee(Employee employee){
        try {
            employeeService.saveEmployee(employee);
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("保存成功");
        }catch (Exception e){
            e.printStackTrace();
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("保存失败");
        }
        return ajaxRes;

    }

    /*编辑员工*/
    @RequestMapping("/editEmployee")
    @ResponseBody
    @RequiresPermissions("employee:edit")
    public AjaxRes editEmployee(Employee employee){
        System.out.println("--------------editEmployee-----------------");
        System.out.println(employee);
        try {
            employeeService.editEmployee(employee);
            ajaxRes.setMsg("修改成功");
            ajaxRes.setSuccess(true);
        }catch (Exception e){
            e.printStackTrace();
            ajaxRes.setMsg("修改失败");
            ajaxRes.setSuccess(false);
        }
        return ajaxRes;
    }

    /*修改离职状态*/
    @RequestMapping("/editState")
    @ResponseBody
    @RequiresPermissions("employee:edit")
    public AjaxRes editState(long id){
        try {
            employeeService.editState(id);
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("离职成功");
        }catch (Exception e){
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("离职失败");
        }
        return ajaxRes;
    }

    /*删除员工*/
    @RequestMapping("/deleteEmployeeById")
    @ResponseBody
    @RequiresPermissions("employee:delete")
    public AjaxRes deleteEmployeeById(Integer id){
        System.out.println(id);
        try {
            employeeService.deleteEmployeeById(id);
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("删除成功");
        }catch (Exception e){
            e.printStackTrace();
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("删除失败");
        }
        return ajaxRes;
    }


    /*没有权限操作返回页面*/
    @ExceptionHandler(AuthorizationException.class)
    public void noPermissionEmployee(HandlerMethod method, HttpServletResponse response) throws Exception{
        System.out.println("999999999999999999999999999999999999999999999");
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

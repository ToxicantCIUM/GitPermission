package com.yb.web;

import com.yb.domain.AjaxRes;
import com.yb.domain.Department;
import com.yb.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;
    @Autowired
    private AjaxRes ajaxRes;

    @RequestMapping("/departmentList")
    @ResponseBody
    public List<Department> departmentList(){
        List<Department> departments = departmentService.departmentList();
        return departments;
    }

    @RequestMapping("/department")
    public String department(){
        return "/department";
    }

    @RequestMapping("/saveDepartment")
    @ResponseBody
    public AjaxRes saveDepartment(Department department){
        try {
            departmentService.saveDepartment(department);
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("保存成功");
        }catch (Exception e){
            e.printStackTrace();
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("保存失败");
        }
        return ajaxRes;
    }

    @RequestMapping("/editDepartment")
    @ResponseBody
    public AjaxRes editDepartment(Department department){
        System.out.println("++++++++++++++++++++++");
        System.out.println(department);
        try {
            departmentService.editDepartment(department);
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("编辑成功");
        }catch (Exception e){
            e.printStackTrace();
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("编辑失败");
        }
        return ajaxRes;
    }

    @RequestMapping("/deleteDepartmentById")
    @ResponseBody
    public AjaxRes deleteDepartmentById(Long id){
        try {
            departmentService.deleteDepartmentById(id);
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("保存成功");
        }catch (Exception e){
            e.printStackTrace();
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("保存失败");
        }
        return ajaxRes;
    }
}

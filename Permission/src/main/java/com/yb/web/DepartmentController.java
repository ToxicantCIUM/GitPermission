package com.yb.web;

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

    @RequestMapping("/departmentList")
    @ResponseBody
    public List<Department> departmentList(){
        List<Department> departments = departmentService.departmentList();
        return departments;
    }
}

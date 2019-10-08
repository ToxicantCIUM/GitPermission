package com.yb.web;

import com.yb.domain.Department;
import com.yb.domain.Employee;
import com.yb.domain.Role;
import com.yb.service.DepartmentService;
import com.yb.service.EmployeeService;
import com.yb.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class TableController {
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private DepartmentService departmentService;
    @Autowired
    private RoleService roleService;

    @RequestMapping("/tablesAll")
    public String tablesAll() {
        return "/tables";
    }

    @RequestMapping("/getEmpList")
    @ResponseBody
    public List<Employee> getEmpList(){
        List<Employee> employees=employeeService.getEmpList();
        System.out.println(employees);
        return employees;
    }

    @RequestMapping("/getDepList")
    @ResponseBody
    public List<Department> getDepList(){
        List<Department> departments = departmentService.departmentList();
        return departments;
    }

    @RequestMapping("/getRoleTabList")
    @ResponseBody
    public List<Role> getRoleList(){
        List<Role> roleList = roleService.getRoleList();
        System.out.println("---------------------------------------------");
        System.out.println(roleList);
        return roleList;
    }

}

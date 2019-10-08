package com.yb.service;

import com.yb.domain.Employee;
import com.yb.domain.PageListRes;
import com.yb.domain.QueryVo;

import java.util.List;

public interface EmployeeService {

    /*定义employeeList方法接口*/
    public PageListRes employeeList(QueryVo vo);

    void saveEmployee(Employee employee);

    void editEmployee(Employee employee);

    void editState(long id);

    void deleteEmployeeById(Integer id);

    Employee getEmployeeByName(String username);

    List<String> getRoleByEmpId(Integer id);

    List<String> getPermissionByEmpId(Integer id);

    List<Employee> getEmpList();
}

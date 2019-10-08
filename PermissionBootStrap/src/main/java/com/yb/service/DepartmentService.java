package com.yb.service;

import com.yb.domain.Department;

import java.util.List;

public interface DepartmentService {
    public List<Department> departmentList();

    void saveDepartment(Department department);

    void editDepartment(Department department);

    void deleteDepartmentById(Long id);
}

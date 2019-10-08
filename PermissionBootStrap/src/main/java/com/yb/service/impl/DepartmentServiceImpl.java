package com.yb.service.impl;

import com.yb.domain.Department;
import com.yb.mapper.DepartmentMapper;
import com.yb.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;

    @Override
    public List<Department> departmentList() {
        List<Department> departments = departmentMapper.selectAll();
        return departments;
    }

    @Override
    public void saveDepartment(Department department) {
        departmentMapper.insert(department);
    }

    @Override
    public void editDepartment(Department department) {
        departmentMapper.updateDepartment(department);
    }

    @Override
    public void deleteDepartmentById(Long id) {
        departmentMapper.deleteDepartmentById(id);
    }
}

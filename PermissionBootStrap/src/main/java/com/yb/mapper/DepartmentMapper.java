package com.yb.mapper;

import com.yb.domain.Department;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DepartmentMapper {
    int insert(Department record);

    List<Department> selectAll();

    void updateDepartment(Department department);

    void deleteDepartmentById(@Param("id") Long id);
}
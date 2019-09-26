package com.yb.mapper;

import com.yb.domain.Department;
import java.util.List;

public interface DepartmentMapper {
    int insert(Department record);

    List<Department> selectAll();
}
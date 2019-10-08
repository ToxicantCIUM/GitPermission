package com.yb.mapper;

import com.yb.domain.Employee;
import com.yb.domain.QueryVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Employee record);

    Employee selectByPrimaryKey(Integer id);

    List<Employee> selectAll(QueryVo vo);

    int updateByPrimaryKey(Employee record);

    void editState(@Param("id") long id);

    void saveEmployeeAndRole(@Param("id") int id, @Param("rid") Long rid);

    void deleteEmployeeAndRole(@Param("id") Integer id);

    Employee getEmployeeByName(@Param("username") String username);

    List<String> getRoleByEmpId(@Param("id") Integer id);

    List<String> getPermissionByEmpId(@Param("id") Integer id);

    List<Employee> getEmpList();

}
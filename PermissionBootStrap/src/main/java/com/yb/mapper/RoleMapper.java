package com.yb.mapper;

import com.yb.domain.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleMapper {
    int deleteByPrimaryKey(Long rid);

    int insert(Role record);

    Role selectByPrimaryKey(Long rid);

    List<Role> selectAll();

    int updateByPrimaryKey(Role record);

    void insertRoleAndPromission(@Param("rid") Long rid, @Param("pid") Long pid);

    void deleteRoleAndPermission(@Param("rid") long rid);

    List<Integer> getRoleListById(@Param("id") int id);
}
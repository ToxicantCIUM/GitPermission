package com.yb.mapper;

import com.yb.domain.Promission;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PromissionMapper {
    int deleteByPrimaryKey(Long pid);

    int insert(Promission record);

    Promission selectByPrimaryKey(Long pid);

    List<Promission> selectAll();

    int updateByPrimaryKey(Promission record);

    List<Promission> getPermisssion(@Param("rid") long rid);
}
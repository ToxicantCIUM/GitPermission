package com.yb.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Setter@Getter@ToString
public class Employee {
    private Integer id;

    private String username;

    private String password;

    /*从数据库中返回格式化的日期*/
    @JsonFormat(pattern = "yyyy-MM-dd" ,timezone="GMT+8")
    /*提交表单时提供的日期*/
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date inputtime;

    private String tel;

    private String email;

    private Boolean state;

    private Boolean admin;

    private Long depId;

    private Department department;

    private List<Role> roles = new ArrayList<>();
}
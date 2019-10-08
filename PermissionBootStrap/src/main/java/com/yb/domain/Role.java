package com.yb.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;

@Setter@Getter@ToString
public class Role {
    private Long rid;

    private String rname;

    private String rnum;

    private List<Promission> permissions = new ArrayList<>();
}
package com.yb.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter@Getter@ToString
public class QueryVo {
    private int page;
    private int rows;
    private String keyWord;
    private long pid;
    private long rid;
}

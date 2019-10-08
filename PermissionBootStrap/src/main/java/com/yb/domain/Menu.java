package com.yb.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter@Getter@ToString
public class Menu {
    private Long id;

    private String text;

    private String url;

    private Menu parent;

}
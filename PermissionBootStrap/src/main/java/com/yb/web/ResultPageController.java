package com.yb.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ResultPageController {

    @RequestMapping("/resultIndex")
    public String resultIndex(){
        return "redirect:/index.jsp";
    }
}

package com.yb.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {


    @RequestMapping("/login")
    public String login(){

        System.out.println("来到了login");
        return "redirect:/login.jsp";
    }

/*    @RequestMapping("/logout")
    public String logout(){
        return "redirect:/login.jsp";
    }*/
}

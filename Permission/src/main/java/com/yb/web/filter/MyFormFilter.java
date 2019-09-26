package com.yb.web.filter;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yb.domain.AjaxRes;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * 这个过滤器是专门用来处理认证成功还是失败的
 */
public class MyFormFilter extends FormAuthenticationFilter {

    @Autowired
    private AjaxRes ajaxRes;
    /*需要向过滤器交给spring管理*/
    protected boolean onLoginSuccess(AuthenticationToken token, Subject subject, ServletRequest request, ServletResponse response) throws Exception {
        System.out.println("认证成功");

        response.setCharacterEncoding("utf-8");
        ajaxRes.setSuccess(true);
        ajaxRes.setMsg("认证成功");
        String jsonString = new ObjectMapper().writeValueAsString(this.ajaxRes);
        response.getWriter().write(jsonString);
        return false;
    }

    protected boolean onLoginFailure(AuthenticationToken token, AuthenticationException e, ServletRequest request, ServletResponse response) {
        System.out.println("认证失败");
        response.setCharacterEncoding("utf-8");
        ajaxRes.setSuccess(false);

        String name = e.getClass().getName();
        if (name.equals(UnknownAccountException.class.getName())){
            ajaxRes.setMsg("没有此账号");
        }else if (name.equals(IncorrectCredentialsException.class.getName())){
            ajaxRes.setMsg("密码错误");
        }else {
            ajaxRes.setMsg("其他错误");
        }

        String jsonString = "";
        try {
            jsonString = new ObjectMapper().writeValueAsString(this.ajaxRes);
            response.getWriter().write(jsonString);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }
}

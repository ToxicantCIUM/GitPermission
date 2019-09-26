package com.yb.web.realms;

import com.sun.media.sound.SoftTuning;
import com.yb.domain.Employee;
import com.yb.domain.Promission;
import com.yb.domain.Role;
import com.yb.service.EmployeeService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

public class EmployeeReamls extends AuthorizingRealm {
    @Autowired
    private EmployeeService employeeService;
    /*认证*/
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        /*获取身份信息*/
        String username = (String)token.getPrincipal();
        System.out.println(username);
        /*从数据库中查找*/
        Employee employee = employeeService.getEmployeeByName(username);
        System.out.println(employee);
        /*如果用户名为空就代表没找到直接返回null*/
        if (employee==null){
            return null;
        }
        ArrayList<Object> employeeList = new ArrayList<>();
        employeeList.add(employee.getUsername());
        employeeList.add(employee);
        /*否者就验证验证*/
        /*主体，正确的密码，盐，当前的realms名*/
        /*在这里加入密码处理*/
        SimpleAuthenticationInfo info =
                new SimpleAuthenticationInfo(
                        employee,
                        employee.getPassword(),
                        ByteSource.Util.bytes(employee.getUsername()),/*加入密码处理（盐）然后要在xml中添加凭证匹配器*/
                        this.getName());
        /*通过配置一个过滤器来监听认证成功还是失败，然后响应给流浪器*/
        return info;
    }
    /*授权*/
    /*
    * 1.当在控制器中扫描到有@RequiresPermissions("employee:index")注解时执行
    * 2.当遇到hasPermissions标签时执行
    * */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        System.out.println("授权-----------------");
        /*获取认证信息*/
        Employee employee = (Employee)principalCollection.getPrimaryPrincipal();
        /*查出该用户对应的角色和权限*/
        List<String> roles = new ArrayList<>();
        List<String> permissions = new ArrayList<>();
        /*查询角色*/
        roles = employeeService.getRoleByEmpId(employee.getId());
        /*查询权限*/
        permissions = employeeService.getPermissionByEmpId(employee.getId());
        /*判断是否是管理员----是管理员就拥有所有权限*/
        if (employee.getAdmin()){
            permissions.add("*:*");
        }
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.addRoles(roles);
        info.addStringPermissions(permissions);
        return info;
    }


}

package com.yb.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.yb.domain.*;
import com.yb.mapper.EmployeeMapper;
import com.yb.service.EmployeeService;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    private EmployeeMapper employeeMapper;

    @Resource(name = "pageListRes")
    private PageListRes pageListRes;

    @Override
    public PageListRes employeeList(QueryVo vo) {
        /*添加分页条件*/
        Page<Object> page = PageHelper.startPage(vo.getPage(), vo.getRows());
        /*调用mapper 查询所有的员工*/
        List<Employee> employees = employeeMapper.selectAll(vo);
        pageListRes.setTotal(page.getTotal());
        pageListRes.setRows(employees);
        return pageListRes;
    }

    @Override
    public void saveEmployee(Employee employee) {
        /*1.要散列的密码
        * 2.要加的盐
        * 3.散列次数
        *
        * 然后在认证中加入密码处理
        * */
        employee.setPassword(new Md5Hash(employee.getPassword(),employee.getUsername(),2).toString());
        employeeMapper.insert(employee);
        /*保存员工与角色之间的关系*/
        for (Role role : employee.getRoles()) {
            employeeMapper.saveEmployeeAndRole(employee.getId(),role.getRid());
        }

    }

    @Override
    public void editEmployee(Employee employee) {
        /*删除员工和角色之间的关系*/
        employeeMapper.deleteEmployeeAndRole(employee.getId());
        employeeMapper.updateByPrimaryKey(employee);
        for (Role role : employee.getRoles()) {
            employeeMapper.saveEmployeeAndRole(employee.getId(),role.getRid());
        }
    }

    @Override
    public void editState(long id) {
        employeeMapper.editState(id);
    }

    @Override
    public void deleteEmployeeById(Integer id) {

        /*删除员工的角色关系*/
        employeeMapper.deleteEmployeeAndRole(id);
        /*删除员工*/
        employeeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Employee getEmployeeByName(String username) {
        return employeeMapper.getEmployeeByName(username);
    }

    @Override
    public List<String> getRoleByEmpId(Integer id) {
        return  employeeMapper.getRoleByEmpId(id);
    }

    @Override
    public List<String> getPermissionByEmpId(Integer id) {
        return employeeMapper.getPermissionByEmpId(id);
    }
}

package com.yb.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.yb.domain.PageListRes;
import com.yb.domain.Promission;
import com.yb.domain.QueryVo;
import com.yb.domain.Role;
import com.yb.mapper.RoleMapper;
import com.yb.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public  class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private PageListRes pageListRes;

    @Override
    public PageListRes getRole(QueryVo vo) {
        Page<Object> page = PageHelper.startPage(vo.getPage(), vo.getRows());
        List<Role> roleList = roleMapper.selectAll();
        pageListRes.setTotal(page.getTotal());
        pageListRes.setRows(roleList);

        return pageListRes;

    }

    @Override
    public void saveRole(Role role) {
        /*保存角色*/
        roleMapper.insert(role);
        /*保存角色和权限之间的关系*/
        for (Promission permission : role.getPermissions()) {
            roleMapper.insertRoleAndPromission(role.getRid(),permission.getPid());
        }
    }

    @Override
    public void updateRole(Role role) {
        /*先把所有关系删除*/
        roleMapper.deleteRoleAndPermission(role.getRid());
        /*在添加新的关系*/
        for (Promission permission : role.getPermissions()) {
            roleMapper.insertRoleAndPromission(role.getRid(),permission.getPid());
        }
        roleMapper.updateByPrimaryKey(role);
    }

    @Override
    public void deleteRole(long rid) {
        /*删除role---permission关系*/
        roleMapper.deleteRoleAndPermission(rid);
        roleMapper.deleteByPrimaryKey(rid);
    }

    @Override
    public List<Role> getRoleList() {
        return roleMapper.selectAll();
    }

    @Override
    public List<Integer> getRoleListById(int id) {
        List<Integer> roleListById = roleMapper.getRoleListById(id);
        return roleListById;
    }

}

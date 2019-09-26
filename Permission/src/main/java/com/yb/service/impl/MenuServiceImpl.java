package com.yb.service.impl;

        import com.github.pagehelper.Page;
        import com.github.pagehelper.PageHelper;
        import com.yb.domain.Menu;
        import com.yb.domain.PageListRes;
        import com.yb.domain.QueryVo;
        import com.yb.mapper.MenuMapper;
        import com.yb.service.MenuService;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.stereotype.Service;

        import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuMapper menuMapper;
    @Autowired
    private PageListRes pageListRes;
    @Override
    public PageListRes menuList(QueryVo vo) {
        Page<Object> page = PageHelper.startPage(vo.getPage(), vo.getRows());

        List<Menu> menuList = menuMapper.selectAll();

        /*分支成pageList*/
        pageListRes.setTotal(page.getTotal());
        pageListRes.setRows(menuList);

        return pageListRes;
    }
}

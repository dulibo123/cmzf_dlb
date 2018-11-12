package com.baizhi.service;

import com.baizhi.dao.MenuDAO;
import com.baizhi.entity.Admin;
import com.baizhi.entity.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional
public class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuDAO menuDAO;

    @Override
    public void add(Menu menu) {

    }

    @Override
    public void remove(String id) {

    }

    @Override
    public void removeAll(String[] ids) {

    }

    @Override
    public void motify(Menu menu) {

    }

    @Override
    public Menu find(Menu menu) {
        return null;
    }

    @Override
    public List<Menu> findAll() {
        return menuDAO.queryAll();
    }

    @Override
    public List<Menu> findByPage(Integer page, Integer rows) {
        return null;
    }

    @Override
    public long findTotal() {
        return 0;
    }
}

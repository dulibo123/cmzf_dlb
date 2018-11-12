package com.baizhi.service;

import com.baizhi.dao.AdminDAO;
import com.baizhi.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDAO adminDAO;

    @Override
    public void add(Admin admin) {

    }

    @Override
    public void remove(String id) {

    }

    @Override
    public void removeAll(String[] ids) {

    }

    @Override
    public void motify(Admin admin) {
        adminDAO.update(admin);
    }

    @Override
    public Admin find(Admin admin) {
        return adminDAO.query(admin);
    }

    @Override
    public List<Admin> findAll() {
        return null;
    }

    @Override
    public List<Admin> findByPage(Integer page, Integer rows) {
        return null;
    }

    @Override
    public long findTotal() {
        return 0;
    }


}

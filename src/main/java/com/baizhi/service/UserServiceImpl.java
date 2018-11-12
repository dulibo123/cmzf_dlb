package com.baizhi.service;

import com.baizhi.dao.UserDAO;
import com.baizhi.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDAO userDAO;
    @Override
    public void add(User user) {
        user.setId(UUID.randomUUID().toString());
        userDAO.insert(user);
    }

    @Override
    public void remove(String id) {

    }

    @Override
    public void removeAll(String[] ids) {

    }

    @Override
    public void motify(User user) {
        userDAO.update(user);
    }

    @Override
    public User find(User user) {
        return userDAO.query(user);
    }

    @Override
    public List<User> findAll() {
        return null;
    }

    @Override
    public List<User> findByPage(Integer page, Integer rows) {
        int start=(page-1)*rows;
        return userDAO.queryByPage(start,rows);
    }

    @Override
    public long findTotal() {
        return userDAO.queryTotals();
    }
}

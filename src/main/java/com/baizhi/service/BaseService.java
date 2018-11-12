package com.baizhi.service;

import java.util.List;

public interface BaseService<T> {
    void add(T t);
    void remove(String id);
    void removeAll(String[] ids);
    //修改
    void motify(T t);
    T find(T t);
    List<T> findAll();
    //分页
    List<T> findByPage(Integer page,Integer rows);

    long findTotal();
}

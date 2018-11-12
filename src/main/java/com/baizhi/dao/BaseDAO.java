package com.baizhi.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface  BaseDAO<T> {
    void insert(T t);
    void update(T t);
    void delete(String id);
    T query(T t);
    List<T> queryAll();
    //T queryMenu();
    List<T> queryByPage(@Param("start") Integer start,@Param("rows") Integer rows);
    long queryTotals();
    //菜单表

}

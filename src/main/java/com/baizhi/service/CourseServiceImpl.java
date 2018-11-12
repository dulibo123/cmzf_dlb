package com.baizhi.service;

import com.baizhi.dao.CourseDAO;
import com.baizhi.entity.Chapter;
import com.baizhi.entity.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class CourseServiceImpl implements CourseService {
    @Autowired
    private CourseDAO courseDAO;
    @Override
    public void add(Course course) {
        course.setId(UUID.randomUUID().toString());
        courseDAO.insert(course);
    }

    @Override
    public void remove(String id) {

    }

    @Override
    public void removeAll(String[] ids) {
        for (String id : ids) {
            courseDAO.delete(id);
        }
    }

    @Override
    public void motify(Course course) {
        courseDAO.update(course);
    }

    @Override
    public Course find(Course course) {
        return courseDAO.query(course);
    }

    @Override
    public List<Course> findAll() {
        return null;
    }

    @Override
    public List<Course> findByPage(Integer page, Integer rows) {
        int start=(page-1)*rows;
        return courseDAO.queryByPage(start,rows);
    }

    @Override
    public long findTotal() {
        return courseDAO.queryTotals();
    }
}

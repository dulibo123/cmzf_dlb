package com.baizhi.controller;

import com.baizhi.entity.Course;
import com.baizhi.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/course")
public class CourseController {
    @Autowired
    private CourseService courseService;
    @RequestMapping("/findCourse")
    public @ResponseBody Map<String,Object> findCourse(Integer page, Integer rows){
        Map<String, Object> map = new HashMap<>();
        List<Course> byPage = courseService.findByPage(page, rows);
        long total = courseService.findTotal();
        map.put("total",total);
        map.put("rows",byPage);
        return map;
    }

    @RequestMapping("/addCourse")
    public @ResponseBody Map<String,Object> addCourse(Course course){
        Map<String, Object> map = new HashMap<>();
        try {
            courseService.add(course);
            map.put("success","增加成功");
            return map;
        } catch (Exception e) {
            e.printStackTrace();
            map.put("message",e.getMessage());
            map.put("error","增加失败");
        }
        return map;
    }

    @RequestMapping("/deleteCourse")
    public @ResponseBody Map<String,Object> deleteCourse(String[] ids){
        Map<String, Object> map = new HashMap<>();
        try {
            courseService.removeAll(ids);
            map.put("success",true);
            return map;
        } catch (Exception e) {
            e.printStackTrace();
            map.put("message",e.getMessage());
            map.put("success",false);
        }
        return map;
    }


    @RequestMapping("/updateCourse")
    public @ResponseBody Map<String,Object> updateCourse(Course course){
        Map<String, Object> map = new HashMap<>();
        try {
            courseService.motify(course);
            map.put("success",true);
            return map;
        } catch (Exception e) {
            e.printStackTrace();
            map.put("message",e.getMessage());
            map.put("success",false);
        }
        return map;
    }


    @RequestMapping("/findOneCourse")
    public @ResponseBody Course findOneCourse(Course course){
        Course course1 = courseService.find(course);
        System.out.println(course1);
        return course1;
    }
}

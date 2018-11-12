package com.baizhi.controller;


import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping("/login")
    public  String login(User user){
        User user1 = userService.find(user);
        if(user1!=null){
            return "redirect:/index.jsp";
        }
        return "redirect:/login.jsp";
    }

    @RequestMapping("/register")
    public  String register(User user){

         userService.add(user);
        return "redirect:/index.jsp";
    }

    @RequestMapping("/update")
    public  String update(User user){
        userService.motify(user);
        return "redirect:/index.jsp";
    }

    @RequestMapping("/showUser")
    public @ResponseBody Map<String,Object> showUser(Integer page, Integer rows){
        Map<String, Object> map = new HashMap<>();
        List<User> byPage = userService.findByPage(page, rows);
        long total = userService.findTotal();
        map.put("total",total);
        map.put("rows",byPage);
        return map;
    }
}

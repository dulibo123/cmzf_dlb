package com.baizhi.controller;

import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping("/login")
    public String login(Admin admin, HttpServletRequest request,String code){
          HttpSession session = request.getSession();
        String validationCode = (String)session.getAttribute("validationCode");
        if (validationCode.equals(code)) {
            Admin admin1 = adminService.find(admin);
            if (admin1 != null) {
                session.setAttribute("admin", admin1);
                return "redirect:/back/main/main.jsp";
            } else {
                return "redirect:/back/login.jsp";
            }
        }
        else return "redirect:/back/login.jsp";
 }
    @RequestMapping("/logOut")
    public String logOut(HttpServletRequest request){
        request.getSession().invalidate();
        return "redirect:/back/login.jsp";
    }
    @RequestMapping("/updatePassword")
    public @ResponseBody Map<String,Object> updatePassword(HttpServletRequest request, Admin admin,String oldPassword){
        Map<String, Object> map = new HashMap<String,Object>();
       Admin  admin1 =(Admin)request.getSession().getAttribute("admin");
        String id = admin1.getId();
      if(oldPassword.equals(admin1.getPassword())){
        try {
                admin.setId(id);
                adminService.motify(admin);
                map.put("success","密码修改成功");
              return map;
        } catch (Exception e) {
            e.printStackTrace();
            map.put("error","密码修改失败");
            map.put("message",e.getMessage());
        }
        }else{
            map.put("error","密码错误");
        }
        return map;
    }
}

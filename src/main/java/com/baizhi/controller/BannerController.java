package com.baizhi.controller;

import com.baizhi.entity.Banner;
import com.baizhi.service.BannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/banner")
public class BannerController {
    @Autowired
    private BannerService bannerService;
    @RequestMapping("/findBanner")
    //展示轮播图页面
    public @ResponseBody Map<String,Object> findBanner(Integer page, Integer rows){
        Map<String, Object> map = new HashMap<>();
        List<Banner> byPage = bannerService.findByPage(page, rows);
        long total = bannerService.findTotal();
        map.put("total",total);
        map.put("rows",byPage);
        return map;
    }

    @RequestMapping("/addBanner")
    public @ResponseBody Map<String,Object> addBanner(Banner banner, MultipartFile img, HttpServletRequest request){
        Map<String, Object> map = new HashMap<String, Object>();
        String originalFilename = img.getOriginalFilename();
        //获取相对路径
      String realPath = request.getSession().getServletContext().getRealPath("/back/banner/files");

         try {
             //上传
             img.transferTo(new File(realPath,originalFilename));
            banner.setImgPath("/back/banner/files/"+originalFilename);
            bannerService.add(banner);
            map.put("success","保存成功");
            return map;
        } catch (Exception e) {
            e.printStackTrace();
            map.put("message",e.getMessage());
            map.put("error","保存失败");

        }
        return map;
 }
@RequestMapping("/remove")
 public @ResponseBody Map<String,Object> remove(String[] ids){
     Map<String, Object> map = new HashMap<String, Object>();

     try {
         bannerService.removeAll(ids);
         map.put("success","删除成功");
         return map;
     } catch (Exception e) {
         e.printStackTrace();
         map.put("message",e.getMessage());
         map.put("error","删除失败");
     }
     return map;
 }
    @RequestMapping("/findOne")
    public @ResponseBody Banner findOne(Banner banner){
        Banner banner1 = bannerService.find(banner);
        return banner1;
    }
    @RequestMapping("/updateBanner")
    public @ResponseBody Map<String,Object>  updateBanner(Banner banner){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            bannerService.motify(banner);
            map.put("success","修改成功");
            return map;
        } catch (Exception e) {
            e.printStackTrace();
            map.put("message",e.getMessage());
            map.put("error","修改失败");
        }
        return map;
    }
}

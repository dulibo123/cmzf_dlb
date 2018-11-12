package com.baizhi.controller;

import com.baizhi.dao.GuruDAO;
import com.baizhi.entity.Banner;
import com.baizhi.entity.Guru;
import com.baizhi.service.GuruService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/guru")
public class GuruController {
    @Autowired
    private GuruService guruService;
    @RequestMapping("/findGuru")
    public @ResponseBody Map<String,Object>  findGuru(Integer page,Integer rows){
        HashMap<String, Object> map = new HashMap<>();
        List<Guru> gurus = guruService.findByPage(page,rows);
        long count = guruService.findTotal();
        map.put("total",count);
        map.put("rows",gurus);
        return map;
    }
    @RequestMapping("/addGuru")
        public @ResponseBody Map<String,Object> addGuru(Guru guru, MultipartFile pic, HttpServletRequest request){
        Map<String, Object> map = new HashMap<String, Object>();
        String originalFilename = pic.getOriginalFilename();
        String realPath = request.getSession().getServletContext().getRealPath("/back/guru/files");
        try {

            pic.transferTo(new File(realPath,originalFilename));
            guru.setHeadPic("/back/guru/files/"+originalFilename);
            System.out.println(guru+"-------++++++++++++++-------------");
            guruService.add(guru);
            map.put("success","保存成功");
            return map;
        } catch (IOException e) {
            e.printStackTrace();
            map.put("message",e.getMessage());
            map.put("error","保存失败");
        }
        return map;
    }


    @RequestMapping("/deleteGuru")
    public @ResponseBody Map<String,Object> addGuru(String[] ids, HttpServletRequest request){
        Map<String, Object> map = new HashMap<String, Object>();
      try {
            guruService.removeAll(ids);
            map.put("success", "删除成功");
            return map;
        }catch (Exception e) {
            e.printStackTrace();
            map.put("message",e.getMessage());
            map.put("error","删除失败了！");
        }
        return map;
    }
    //查找所有上师，添加专辑用
    @RequestMapping("/findAllGuru")
    public @ResponseBody List<Guru> findAllGuru(){
        List<Guru> all = guruService.findAll();
        return all;
    }

    //修改
    @RequestMapping("/updateGuru")
    public @ResponseBody Map<String,Object>  updateGuru(Guru guru,MultipartFile headPic, HttpServletRequest request){
        Map<String, Object> map = new HashMap<String, Object>();
        String originalFilename = headPic.getOriginalFilename();
        String realPath = request.getSession().getServletContext().getRealPath("/back/guru/files");
        try {
            headPic.transferTo(new File(realPath,originalFilename));
            guru.setHeadPic("/back/guru/files/"+UUID.randomUUID().toString() +originalFilename);
            System.out.println(guru+"------43534543---------");
            guruService.motify(guru);
            map.put("success","修改成功");
            return map;
        } catch (Exception e) {
            e.printStackTrace();
            map.put("message",e.getMessage());
            map.put("error","修改失败！！！");
        }
        return map;
    }

    //根据id查找上师信息，修改时自动获取该上师的信息
    @RequestMapping("/findOne")
    public @ResponseBody Guru findOne(Guru guru){
        System.out.println(guru+"----------------");
        Guru guru1 = guruService.find(guru);
        return guru1;
    }
}

package com.baizhi.controller;

import com.baizhi.entity.Album;
import com.baizhi.service.AlbumService;
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
import java.util.UUID;

@Controller
@RequestMapping("/album")
public class AlbumController {
    @Autowired
    private AlbumService albumService;
    @RequestMapping("/findAlbum")
    public @ResponseBody Map<String,Object> findAlbum(Integer page, Integer rows){
        HashMap<String, Object> map = new HashMap<String,Object>();
        long total = albumService.findTotal();
        List<Album> byPage = albumService.findByPage(page, rows);
        map.put("total",total);
        map.put("rows",byPage);
       return map;
    }
    @RequestMapping("/addAlbum")
    public @ResponseBody Map<String,Object> addAlbum(HttpServletRequest request, MultipartFile pic, Album album){
        Map<String, Object> map = new HashMap<String,Object>();
        String originalFilename = pic.getOriginalFilename();
        String realPath = request.getSession().getServletContext().getRealPath("/back/album/files");
        try {
            //上传
            System.out.println(pic+"上传路径");
            System.out.println(album+"上传路径");
            pic.transferTo(new File(realPath,originalFilename));
            album.setCoverImg("/back/album/files/"+originalFilename);
            albumService.add(album);
            map.put("success","添加成功");
            return map;
        } catch (Exception e) {
            e.printStackTrace();
            map.put("message",e.getMessage());
            map.put("error","添加失败");
            }
        return map;
    }

    @RequestMapping("/findOneAlbum")
    public @ResponseBody Album findOneAlbum(Album album) {
        Map<String, Object> map = new HashMap<String, Object>();
        Album album1 = albumService.find(album);
        return album1;
    }
}

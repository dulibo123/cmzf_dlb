package com.baizhi.service;

import com.baizhi.dao.AlbumDAO;
import com.baizhi.entity.Album;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class AlbumServiceImpl implements AlbumService {
    @Autowired
    private AlbumDAO albumDAO;
    @Override
    public void add(Album album) {
        album.setId(UUID.randomUUID().toString());
        albumDAO.insert(album);
    }

    @Override
    public void remove(String id) {

    }

    @Override
    public void removeAll(String[] ids) {

    }

    @Override
    public void motify(Album album) {

    }

    @Override
    public Album find(Album album) {
        return albumDAO.query(album);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Album> findAll() {
        return albumDAO.queryAll();
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)

    public List<Album> findByPage(Integer page, Integer rows) {
        int start=(page-1)*rows;
        return albumDAO.queryByPage(start,rows);
    }

    @Override
    public long findTotal() {
        return albumDAO.queryTotals();
    }
}

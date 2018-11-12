package com.baizhi.service;

import com.baizhi.dao.GuruDAO;
import com.baizhi.entity.Guru;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class GuruServiceImpl implements GuruService {
    @Autowired
    private GuruDAO guruDAO;
    @Override
    public void add(Guru guru) {
        guru.setId(UUID.randomUUID().toString());
        guruDAO.insert(guru);
    }

    @Override
    public void remove(String id) {

    }

    @Override
    public void removeAll(String[] ids) {
        for (String id : ids) {
            guruDAO.delete(id);
        }
    }

    @Override
    public void motify(Guru guru) {
        guruDAO.update(guru);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Guru find(Guru guru) {
        return guruDAO.query(guru);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Guru> findAll() {
        return guruDAO.queryAll();
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Guru> findByPage(Integer page, Integer rows) {
        int start=(page-1)*rows;
        return guruDAO.queryByPage(start,rows);
    }

    @Override
     @Transactional(propagation = Propagation.SUPPORTS)
    public long findTotal() {
        return guruDAO.queryTotals();
    }
}

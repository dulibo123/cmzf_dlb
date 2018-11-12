package com.baizhi.service;

import com.baizhi.dao.BannerDAO;
import com.baizhi.entity.Banner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class BannerServiceImpl implements BannerService {
    @Autowired
    private BannerDAO bannerDAO;
    @Override
    public void add(Banner banner) {
        banner.setId(UUID.randomUUID().toString());
        bannerDAO.insert(banner);
    }

    @Override
    public void remove(String id) {

    }

    @Override
    public void removeAll(String[] ids) {
        for (String id : ids) {
            bannerDAO.delete(id);
        }

    }

    @Override
    public void motify(Banner banner) {
        bannerDAO.update(banner);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Banner find(Banner banner) {
        return bannerDAO.query(banner);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)

    public List<Banner> findAll() {
        return null;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)

    public List<Banner> findByPage(Integer page, Integer rows) {
        int start=(page-1)*rows;

        return bannerDAO.queryByPage(start,rows);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public long findTotal() {
        return bannerDAO.queryTotals();
    }
}

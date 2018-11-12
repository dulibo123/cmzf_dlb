package com.baizhi.service;

import com.baizhi.dao.ChapterDAO;
import com.baizhi.entity.Chapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class ChapterServiceImpl implements ChapterService {
    @Autowired
    private ChapterDAO chapterDAO;

    @Override
    public void add(Chapter chapter) {
        chapter.setId(UUID.randomUUID().toString());
        chapterDAO.insert(chapter);
    }

    @Override
    public void remove(String id) {

    }

    @Override
    public void removeAll(String[] ids) {

    }

    @Override
    public void motify(Chapter chapter) {

    }

    @Override
    public Chapter find(Chapter chapter) {
        return null;
    }

    @Override
    public List<Chapter> findAll() {
        return null;
    }

    @Override
    public List<Chapter> findByPage(Integer page, Integer rows) {
        return null;
    }

    @Override
    public long findTotal() {
        return 0;
    }
}

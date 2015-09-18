package com.fh.taolijie.service.quest.impl;

import com.fh.taolijie.component.ListResult;
import com.fh.taolijie.dao.mapper.QuestCategoryModelMapper;
import com.fh.taolijie.domain.QuestCategoryModel;
import com.fh.taolijie.service.quest.QuestCateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by whf on 9/18/15.
 */
@Service
public class DefaultQuestCateService implements QuestCateService {
    @Autowired
    private QuestCategoryModelMapper cateMapper;

    @Override
    @Transactional(readOnly = true)
    public QuestCategoryModel find(Integer cateId) {
        return cateMapper.selectByPrimaryKey(cateId);
    }

    @Override
    @Transactional(readOnly = true)
    public QuestCategoryModel find(String name) {
        QuestCategoryModel example = new QuestCategoryModel();
        example.setName(name);

        List<QuestCategoryModel> list = cateMapper.findBy(example);
        if (list.isEmpty()) {
            return null;
        }

        return list.get(0);
    }

    @Override
    @Transactional(readOnly = true)
    public ListResult<QuestCategoryModel> findAll(int pn, int ps) {
        QuestCategoryModel example = new QuestCategoryModel(pn, ps);
        List<QuestCategoryModel> list = cateMapper.findBy(example);
        long tot = cateMapper.countFindBy(example);

        return new ListResult<>(list, tot);
    }

    @Override
    @Transactional(readOnly = false)
    public void add(QuestCategoryModel model) {
        cateMapper.insertSelective(model);
    }

    @Override
    @Transactional(readOnly = false)
    public void update(QuestCategoryModel model) {
        cateMapper.updateByPrimaryKeySelective(model);
    }

    @Override
    @Transactional(readOnly = false)
    public void delete(Integer id) {
        cateMapper.deleteByPrimaryKey(id);
    }
}

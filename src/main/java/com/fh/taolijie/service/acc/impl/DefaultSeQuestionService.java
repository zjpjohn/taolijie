package com.fh.taolijie.service.acc.impl;

import com.fh.taolijie.component.ListResult;
import com.fh.taolijie.dao.mapper.CashAccModelMapper;
import com.fh.taolijie.dao.mapper.SeQuestionModelMapper;
import com.fh.taolijie.domain.AnRecordModel;
import com.fh.taolijie.domain.QuestionModel;
import com.fh.taolijie.domain.QuestionOptModel;
import com.fh.taolijie.domain.SeQuestionModel;
import com.fh.taolijie.domain.quest.QuestModel;
import com.fh.taolijie.dto.QuestionAnalyzeDto;
import com.fh.taolijie.exception.checked.HackException;
import com.fh.taolijie.exception.checked.acc.BalanceNotEnoughException;
import com.fh.taolijie.exception.checked.acc.CashAccNotExistsException;
import com.fh.taolijie.exception.checked.acc.SecretQuestionExistException;
import com.fh.taolijie.exception.checked.acc.SecretQuestionNotExistException;
import com.fh.taolijie.exception.checked.quest.NotQuestionQuestException;
import com.fh.taolijie.exception.checked.quest.QuestNotFoundException;
import com.fh.taolijie.exception.checked.quest.QuestionNotFoundException;
import com.fh.taolijie.exception.checked.quest.RequestRepeatedException;
import com.fh.taolijie.service.acc.SeQuestionService;
import com.fh.taolijie.service.quest.QuestionService;
import com.fh.taolijie.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * Created by whf on 10/25/15.
 */
@Service
public class DefaultSeQuestionService implements SeQuestionService {
    @Autowired
    private SeQuestionModelMapper seMapper;

    @Autowired
    private CashAccModelMapper accMapper;

    @Override
    @Transactional(readOnly = true)
    public SeQuestionModel findByMember(Integer memId, boolean answer) {
        SeQuestionModel model = null;
        if (answer) {
            model = seMapper.selectByMemberId(memId);
        } else {
            model = seMapper.selectByMemberIdWithoutAnswer(memId);
        }

        return model;
    }

    @Override
    @Transactional(readOnly = false, rollbackFor = Throwable.class)
    public int add(SeQuestionModel model) throws SecretQuestionExistException {
        // 先检查是否已经设置了问题
        boolean exist = seMapper.checkExistByMemberId(model.getMemberId());
        if (exist) {
            throw new SecretQuestionExistException();
        }

        model.setCreatedTime(new Date());
        // 设置accId
        Integer accId = accMapper.findIdByMemberId(model.getMemberId());
        model.setAccId(accId);

        return seMapper.insertSelective(model);
    }

    @Override
    @Transactional(readOnly = false, rollbackFor = Throwable.class)
    public int deleteByMember(Integer memId) {
        return seMapper.deleteByMemberId(memId);
    }

    @Override
    @Transactional(readOnly = true)
    public boolean checkAnswer(Integer memId, String answer) throws SecretQuestionNotExistException {
        if (false == StringUtils.checkNotEmpty(answer)) {
            return false;
        }

        SeQuestionModel question = seMapper.selectByMemberId(memId);
        if (null == question) {
            throw new SecretQuestionNotExistException();
        }

        if ( false == question.getAnswer().equals(answer) ) {
            return false;
        }

        return true;
    }
}
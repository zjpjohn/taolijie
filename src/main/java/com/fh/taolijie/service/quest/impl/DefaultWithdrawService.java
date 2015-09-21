package com.fh.taolijie.service.quest.impl;

import com.fh.taolijie.component.ListResult;
import com.fh.taolijie.constant.quest.WithdrawStatus;
import com.fh.taolijie.dao.mapper.CashAccModelMapper;
import com.fh.taolijie.dao.mapper.MemberModelMapper;
import com.fh.taolijie.dao.mapper.WithdrawApplyModelMapper;
import com.fh.taolijie.domain.CashAccModel;
import com.fh.taolijie.domain.MemberModel;
import com.fh.taolijie.domain.WithdrawApplyModel;
import com.fh.taolijie.exception.checked.UserNotExistsException;
import com.fh.taolijie.exception.checked.quest.BalanceNotEnoughException;
import com.fh.taolijie.exception.checked.quest.CashAccNotExistsException;
import com.fh.taolijie.service.quest.WithdrawService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 提现申请业务实现
 * Created by whf on 9/21/15.
 */
@Service
public class DefaultWithdrawService implements WithdrawService {
    @Autowired
    private WithdrawApplyModelMapper drawMapper;

    @Autowired
    private MemberModelMapper memMapper;

    @Autowired
    private CashAccModelMapper accMapper;

    /**
     * 创建提现申请.
     * 0. 检查账户余额
     * 1. 设置冗余字段
     * 2. 设置状态为等待审核
     * 3. 插入记录
     *
     * @param model
     */
    @Override
    @Transactional(readOnly = false)
    public void addWithdraw(WithdrawApplyModel model)
            throws CashAccNotExistsException, BalanceNotEnoughException {

        CashAccModel acc = accMapper.selectByPrimaryKey(model.getAccId());
        if (null == acc) {
            throw new CashAccNotExistsException("");
        }

        // 检查账户余额
        BigDecimal balance = acc.getAvailableBalance();
        if (balance.compareTo(model.getAmount()) < 0) {
            // 余额不足
            throw new BalanceNotEnoughException("");
        }

        // 设置冗余字段
        Date now = new Date();
        model.setUsername(acc.getUsername());
        model.setApplyTime(now);
        model.setUpdateTime(now);
        model.setStatus(WithdrawStatus.WAIT_AUDIT.code());

        // 插入记录
        drawMapper.insertSelective(model);
    }

    /**
     * 更新审核状态.
     *
     * @param withId
     * @param status 新状态
     * @param memo 审核备注
     */
    @Override
    @Transactional(readOnly = false)
    public boolean updateStatus(Integer withId, WithdrawStatus status, String memo) {
        WithdrawApplyModel example = new WithdrawApplyModel();
        example.setId(withId);

        example.setMemo(memo);
        example.setStatus(status.code());
        example.setUpdateTime(new Date());

        return drawMapper.updateByPrimaryKeySelective(example) > 0 ? true : false;
    }

    @Override
    public ListResult<WithdrawApplyModel> findAll(int pn, int ps) {
        return null;
    }

    @Override
    public ListResult<WithdrawApplyModel> findAllByStatus(WithdrawStatus status, int pn, int ps) {
        return null;
    }

    @Override
    public ListResult<WithdrawApplyModel> findByMember(Integer memId, int pn, int ps) {
        return null;
    }

    @Override
    public ListResult<WithdrawApplyModel> findByMember(Integer memId, WithdrawStatus status, int pn, int ps) {
        return null;
    }
}

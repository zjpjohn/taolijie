package com.fh.taolijie.dao.mapper;

import com.fh.taolijie.domain.acc.WithdrawApplyModel;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface WithdrawApplyModelMapper {

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table withdraw_apply
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table withdraw_apply
     *
     * @mbggenerated
     */
    int insert(WithdrawApplyModel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table withdraw_apply
     *
     * @mbggenerated
     */
    int insertSelective(WithdrawApplyModel record);


    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table withdraw_apply
     *
     * @mbggenerated
     */
    WithdrawApplyModel selectByPrimaryKey(Integer id);


    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table withdraw_apply
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(WithdrawApplyModel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table withdraw_apply
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(WithdrawApplyModel record);

    List<WithdrawApplyModel> findBy(WithdrawApplyModel example);
    long countFindBy(WithdrawApplyModel example);
}
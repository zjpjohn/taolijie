package com.fh.taolijie.dao.mapper;

import com.fh.taolijie.domain.BannerPicModel;
import org.springframework.stereotype.Repository;


@Repository
public interface BannerPicModelMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table banner_pic
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table banner_pic
     *
     * @mbggenerated
     */
    int insert(BannerPicModel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table banner_pic
     *
     * @mbggenerated
     */
    int insertSelective(BannerPicModel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table banner_pic
     *
     * @mbggenerated
     */
    BannerPicModel selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table banner_pic
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(BannerPicModel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table banner_pic
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(BannerPicModel record);
}
package com.fh.taolijie.dao.mapper.v2;

import com.fh.taolijie.domain.v2.IvyActImgModel;

public interface IvyActImgModelMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ivy_activity_image_resource
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ivy_activity_image_resource
     *
     * @mbggenerated
     */
    int insert(IvyActImgModel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ivy_activity_image_resource
     *
     * @mbggenerated
     */
    int insertSelective(IvyActImgModel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ivy_activity_image_resource
     *
     * @mbggenerated
     */
    IvyActImgModel selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ivy_activity_image_resource
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(IvyActImgModel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ivy_activity_image_resource
     *
     * @mbggenerated
     */
    int updateByPrimaryKeyWithBLOBs(IvyActImgModel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ivy_activity_image_resource
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(IvyActImgModel record);
}
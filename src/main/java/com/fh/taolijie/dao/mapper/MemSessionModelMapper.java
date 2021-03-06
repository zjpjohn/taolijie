package com.fh.taolijie.dao.mapper;

import com.fh.taolijie.domain.MemSessionModel;
import com.fh.taolijie.service.impl.IntervalCheckService;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MemSessionModelMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table mem_session
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table mem_session
     *
     * @mbggenerated
     */
    int insert(MemSessionModel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table mem_session
     *
     * @mbggenerated
     */
    int insertSelective(MemSessionModel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table mem_session
     *
     * @mbggenerated
     */
    MemSessionModel selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table mem_session
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(MemSessionModel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table mem_session
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(MemSessionModel record);


    int deleteBySid(String sid);

    int deleteBySidInBatch(List<String> sidList);

    int deleteByMember(Integer memId);

    List<MemSessionModel> findBy(MemSessionModel cmd);
}
package com.fh.taolijie.dao.mapper;

import com.fh.taolijie.cache.annotation.RedisCache;
import com.fh.taolijie.cache.annotation.RedisEvict;
import com.fh.taolijie.domain.job.JobPostModel;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JobPostModelMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table job_post
     *
     * @mbggenerated
     */
    @RedisEvict(JobPostModel.class)
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table job_post
     *
     * @mbggenerated
     */
    @RedisEvict(JobPostModel.class)
    int insert(JobPostModel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table job_post
     *
     * @mbggenerated
     */
    @RedisEvict(JobPostModel.class)
    int insertSelective(JobPostModel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table job_post
     *
     * @mbggenerated
     */
    @RedisCache(JobPostModel.class)
    JobPostModel selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table job_post
     *
     * @mbggenerated
     */
    @RedisEvict(JobPostModel.class)
    int updateByPrimaryKeySelective(JobPostModel record);


    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table job_post
     *
     * @mbggenerated
     */
    @RedisEvict(JobPostModel.class)
    int updateByPrimaryKey(JobPostModel record);

    @RedisCache(JobPostModel.class)
    List<JobPostModel> getAll(@Param("pageNumber") int pageNumber, @Param("pageSize") int pageSize);
    @RedisCache(JobPostModel.class)
    long countGetAll();

    @RedisCache(JobPostModel.class)
    List<JobPostModel> getInBatch(List<Integer> idList);

    @RedisCache(JobPostModel.class)
    List<JobPostModel> getByComplaint(@Param("pageNumber") int pageNumber, @Param("pageSize") int pageSize);
    @RedisCache(JobPostModel.class)
    long countGetByComplaint();


    @RedisCache(JobPostModel.class)
    List<JobPostModel> findBy(JobPostModel model);
    @RedisCache(JobPostModel.class)
    long countFindBy(JobPostModel model);

    @RedisCache(JobPostModel.class)
    List<JobPostModel> searchBy(JobPostModel model);
    @RedisCache(JobPostModel.class)
    long countSearchBy(JobPostModel model);

    @RedisEvict(JobPostModel.class)
    void complaint(Integer postId);


    @RedisEvict(JobPostModel.class)
    void increasePageView(Integer postId);

    @RedisEvict(JobPostModel.class)
    void increaseLike(Integer postId);
    @RedisEvict(JobPostModel.class)
    void decreaseLike(Integer postId);

    void postResume(@Param("resumeId") Integer resumeId, @Param("jobPostId") Integer jobPostId, @Param("memberId") Integer memberId);

    /**
     * set deleted = true
     * @param postId
     */
    @RedisEvict(JobPostModel.class)
    int setDeleted(@Param("postId") Integer postId, @Param("deleted") boolean deleted);
}
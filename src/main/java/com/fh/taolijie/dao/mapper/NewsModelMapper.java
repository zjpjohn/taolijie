package com.fh.taolijie.dao.mapper;

import com.fh.taolijie.domain.NewsModel;
import org.apache.ibatis.annotations.Param;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.Caching;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface NewsModelMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table news
     *
     * @mbggenerated
     */
    @Caching(
            evict = {
                    @CacheEvict(value = "newsListCache", key = "'News:id:'.concat(#p0)"),
                    @CacheEvict(value = "newsListCache", allEntries = true)
            }
    )
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table news
     *
     * @mbggenerated
     */
    @CacheEvict(value = "newsListCache", allEntries = true)
    int insert(NewsModel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table news
     *
     * @mbggenerated
     */
    @CacheEvict(value = "newsListCache", allEntries = true)
    int insertSelective(NewsModel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table news
     *
     * @mbggenerated
     */
    @Cacheable(value = "newsCache", key = "'News:id:'.concat(#p0)")
    NewsModel selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table news
     *
     * @mbggenerated
     */
    @Caching(
            evict = {
                    @CacheEvict(value = "newsListCache", key = "'News:id:'.concat(#p0.id)"),
                    @CacheEvict(value = "newsListCache", allEntries = true)
            }
    )
    int updateByPrimaryKeySelective(NewsModel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table news
     *
     * @mbggenerated
     */
    @Caching(
            evict = {
                    @CacheEvict(value = "newsListCache", key = "'News:id:'.concat(#p0.id)"),
                    @CacheEvict(value = "newsListCache", allEntries = true)
            }
    )
    int updateByPrimaryKey(NewsModel record);

    @Cacheable(value = "newsListCache", key = "'News:'.concat(#root.methodName).concat(':').concat(#p0).concat(':').concat(#p1)")
    List<NewsModel> getAll(@Param("pageNumber") int pageNumber, @Param("pageSize") int pageSize);

    @Cacheable(value = "newsListCache", key = "'News:'.concat(#root.methodName).concat(':').concat(#p0.getTime()).concat(':').concat(#p1.getTime()).concat(':').concat(#p2).concat(':').concat(#p3)")
    List<NewsModel> getByInterval(@Param("startTime") Date startTime, @Param("endTime") Date endTime, @Param("pageNumber") int pageNumber, @Param("pageSize") int pageSize);
}
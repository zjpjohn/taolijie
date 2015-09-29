package com.fh.taolijie.domain;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fh.taolijie.domain.acc.MemberModel;
import com.fh.taolijie.domain.job.JobPostModel;
import com.fh.taolijie.domain.resume.ResumeModel;
import com.fh.taolijie.domain.sh.SHPostModel;

import java.util.Date;

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class RecommendedPostModel extends Pageable {
    /**
     * 帖子推荐的id
     */
    private Integer id;

    /**
     * 兼职的id
     * <p>如果这是一条兼职推荐，该字段必填</p>
     */
    private Integer jobId;
    private JobPostModel jobPost;

    /**
     * 二手的id
     * <p>如果这是二手推荐，该字段必填</p>
     */
    private Integer shId;
    private SHPostModel shPost;

    /**
     * 简历的id
     * <p>如果这是简历推荐，该字段必填</p>
     */
    private Integer resumeId;
    private ResumeModel resume;

    private Date applyTime;

    private Boolean validation = false;

    /**
     * 冗余字段，与sh_post, job_post表的title相同
     */
    private String postTitle;

    /**
     * 推荐申请人的用户id
     */
    private Integer memberId;
    private MemberModel member;

    /**
     * 备注信息
     */
    private String memo;

    private Integer orderIndex;

    /**
     * 审核通过的日期
     */
    private Date passTime;

    /**
     * 被删除的日期
     */
    private Date removeTime;



    // 以下参数仅仅查询使用
    private Boolean isJob = false;
    private Boolean isSh = false;
    private Boolean isResume = false;

    /**
     * 帖子的大类。如兼职、简历、二手.
     * 可直接调用对应的get方法，方法会自动判断大类
     */
    private String generalCategory;

    public RecommendedPostModel() {}
    public RecommendedPostModel(int pageNumber, int pageSize) {
        super(pageNumber, pageSize);
    }

    public Boolean getIsJob() {
        return isJob;
    }

    public void setIsJob(Boolean isJob) {
        this.isJob = isJob;
    }

    public Boolean getIsSh() {
        return isSh;
    }

    public void setIsSh(Boolean isSh) {
        this.isSh = isSh;
    }

    public Boolean getIsResume() {
        return isResume;
    }

    public void setIsResume(Boolean isResume) {
        this.isResume = isResume;
    }

    public String getGeneralCategory() {
        if (null == generalCategory) {
            if (null != this.shId) {
                this.generalCategory = "二手";
            } else if (null != this.resumeId) {
                this.generalCategory = "简历";
            } else if (null != this.jobId) {
                this.generalCategory = "兼职";
            } else {
                // impossible
                throw new IllegalStateException("大类错误");
            }
        }

        return generalCategory;
    }

    public void setGeneralCategory(String generalCategory) {
        this.generalCategory = generalCategory;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column recommended_post.id
     *
     * @return the value of recommended_post.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column recommended_post.id
     *
     * @param id the value for recommended_post.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column recommended_post.job_id
     *
     * @return the value of recommended_post.job_id
     *
     * @mbggenerated
     */
    public Integer getJobId() {
        return jobId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column recommended_post.job_id
     *
     * @param jobId the value for recommended_post.job_id
     *
     * @mbggenerated
     */
    public void setJobId(Integer jobId) {
        this.jobId = jobId;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public JobPostModel getJobPost() {
        return jobPost;
    }

    public void setJobPost(JobPostModel jobPost) {
        this.jobPost = jobPost;
    }

    public SHPostModel getShPost() {
        return shPost;
    }

    public void setShPost(SHPostModel shPost) {
        this.shPost = shPost;
    }

    public ResumeModel getResume() {
        return resume;
    }

    public void setResume(ResumeModel resume) {
        this.resume = resume;
    }

    public MemberModel getMember() {
        return member;
    }

    public void setMember(MemberModel member) {
        this.member = member;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column recommended_post.sh_id
     *
     * @return the value of recommended_post.sh_id
     *
     * @mbggenerated
     */
    public Integer getShId() {
        return shId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column recommended_post.sh_id
     *
     * @param shId the value for recommended_post.sh_id
     *
     * @mbggenerated
     */
    public void setShId(Integer shId) {
        this.shId = shId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column recommended_post.resume_id
     *
     * @return the value of recommended_post.resume_id
     *
     * @mbggenerated
     */
    public Integer getResumeId() {
        return resumeId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column recommended_post.resume_id
     *
     * @param resumeId the value for recommended_post.resume_id
     *
     * @mbggenerated
     */
    public void setResumeId(Integer resumeId) {
        this.resumeId = resumeId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column recommended_post.apply_time
     *
     * @return the value of recommended_post.apply_time
     *
     * @mbggenerated
     */
    public Date getApplyTime() {
        return applyTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column recommended_post.apply_time
     *
     * @param applyTime the value for recommended_post.apply_time
     *
     * @mbggenerated
     */
    public void setApplyTime(Date applyTime) {
        this.applyTime = applyTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column recommended_post.validation
     *
     * @return the value of recommended_post.validation
     *
     * @mbggenerated
     */
    public Boolean getValidation() {
        return validation;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column recommended_post.validation
     *
     * @param validation the value for recommended_post.validation
     *
     * @mbggenerated
     */
    public void setValidation(Boolean validation) {
        this.validation = validation;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column recommended_post.member_id
     *
     * @return the value of recommended_post.member_id
     *
     * @mbggenerated
     */
    public Integer getMemberId() {
        return memberId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column recommended_post.member_id
     *
     * @param memberId the value for recommended_post.member_id
     *
     * @mbggenerated
     */
    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column recommended_post.memo
     *
     * @return the value of recommended_post.memo
     *
     * @mbggenerated
     */
    public String getMemo() {
        return memo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column recommended_post.memo
     *
     * @param memo the value for recommended_post.memo
     *
     * @mbggenerated
     */
    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column recommended_post.order_index
     *
     * @return the value of recommended_post.order_index
     *
     * @mbggenerated
     */
    public Integer getOrderIndex() {
        return orderIndex;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column recommended_post.order_index
     *
     * @param orderIndex the value for recommended_post.order_index
     *
     * @mbggenerated
     */
    public void setOrderIndex(Integer orderIndex) {
        this.orderIndex = orderIndex;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column recommended_post.pass_time
     *
     * @return the value of recommended_post.pass_time
     *
     * @mbggenerated
     */
    public Date getPassTime() {
        return passTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column recommended_post.pass_time
     *
     * @param passTime the value for recommended_post.pass_time
     *
     * @mbggenerated
     */
    public void setPassTime(Date passTime) {
        this.passTime = passTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column recommended_post.remove_time
     *
     * @return the value of recommended_post.remove_time
     *
     * @mbggenerated
     */
    public Date getRemoveTime() {
        return removeTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column recommended_post.remove_time
     *
     * @param removeTime the value for recommended_post.remove_time
     *
     * @mbggenerated
     */
    public void setRemoveTime(Date removeTime) {
        this.removeTime = removeTime;
    }
}
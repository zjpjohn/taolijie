package com.fh.taolijie.domain;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.Date;

//@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class SHPostModel extends Pageable {
    private Integer id;
    private String picturePath;

    @NotNull
    @Length(min = 15, max = 500)
    private String description;


    @NotNull
    @Length(min = 1, max = 20)
    private String title;

    private boolean deleted = false;


    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date expiredTime;

    private Date postTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column second_hand_post.depreciation_rate
     *
     * @mbggenerated
     */
    private String depreciationRate;

    /**
     * 售价
     */
    private BigDecimal originalPrice;

    @NotNull
    @Min(0) @Max(9999)
    private BigDecimal sellPrice;

    private Integer likes;

    private Integer dislikes;

    private Integer memberId;

    private Integer secondHandPostCategoryId;

    private Integer complaint;

    private Integer pageView;

    /**
     * 是否下架
     */
    private Boolean expired;

    private String verified;

    @NotNull
    @Length(max = 36)
    private String tradePlace;

    @NotNull
    @Length(max = 10)
    private String contactName;

    //@NotNull
    //@Length(max = 20)
    private String contactQq;

    @NotNull
    @Length(max = 20)
    private String contactPhone;


    private MemberModel member;
    private SHPostCategoryModel category;


    // 以下参数仅查询用
    private Integer rangeQuery = 0; //是否根据价格范围查询. 0:否, 1:是
    private Integer minPrice;
    private Integer maxPrice;



    public SHPostCategoryModel getCategory() {
        return category;
    }

    public void setCategory(SHPostCategoryModel category) {
        this.category = category;
    }

    public MemberModel getMember() {
        return member;
    }

    public void setMember(MemberModel member) {
        this.member = member;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column second_hand_post.id
     *
     * @return the value of second_hand_post.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column second_hand_post.id
     *
     * @param id the value for second_hand_post.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRangeQuery() {
        return rangeQuery;
    }

    public void setRangeQuery(Integer rangeQuery) {
        this.rangeQuery = rangeQuery;
    }

    public Integer getMinPrice() {
        return minPrice;
    }

    public void setMinPrice(Integer minPrice) {
        this.minPrice = minPrice;
    }

    public Integer getMaxPrice() {
        return maxPrice;
    }

    public void setMaxPrice(Integer maxPrice) {
        this.maxPrice = maxPrice;
    }

    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    public String getContactQq() {
        return contactQq;
    }

    public void setContactQq(String contactQq) {
        this.contactQq = contactQq;
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column second_hand_post.title
     *
     * @return the value of second_hand_post.title
     *
     * @mbggenerated
     */
    public String getTitle() {
        return title;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column second_hand_post.title
     *
     * @param title the value for second_hand_post.title
     *
     * @mbggenerated
     */
    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column second_hand_post.expired_time
     *
     * @return the value of second_hand_post.expired_time
     *
     * @mbggenerated
     */
    public Date getExpiredTime() {
        return expiredTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column second_hand_post.expired_time
     *
     * @param expiredTime the value for second_hand_post.expired_time
     *
     * @mbggenerated
     */
    public void setExpiredTime(Date expiredTime) {
        this.expiredTime = expiredTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column second_hand_post.post_time
     *
     * @return the value of second_hand_post.post_time
     *
     * @mbggenerated
     */
    public Date getPostTime() {
        return postTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column second_hand_post.post_time
     *
     * @param postTime the value for second_hand_post.post_time
     *
     * @mbggenerated
     */
    public void setPostTime(Date postTime) {
        this.postTime = postTime;
    }

    public Boolean getExpired() {
        return expired;
    }

    public void setExpired(Boolean expired) {
        this.expired = expired;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column second_hand_post.depreciation_rate
     *
     * @return the value of second_hand_post.depreciation_rate
     *
     * @mbggenerated
     */
    public String getDepreciationRate() {
        return depreciationRate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column second_hand_post.depreciation_rate
     *
     * @param depreciationRate the value for second_hand_post.depreciation_rate
     *
     * @mbggenerated
     */
    public void setDepreciationRate(String depreciationRate) {
        this.depreciationRate = depreciationRate == null ? null : depreciationRate.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column second_hand_post.original_price
     *
     * @return the value of second_hand_post.original_price
     *
     * @mbggenerated
     */
    public BigDecimal getOriginalPrice() {
        return originalPrice;
    }

    public String getPicturePath() {
        return picturePath;
    }

    public void setPicturePath(String picturePath) {
        this.picturePath = picturePath;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column second_hand_post.original_price
     *
     * @param originalPrice the value for second_hand_post.original_price
     *
     * @mbggenerated
     */
    public void setOriginalPrice(BigDecimal originalPrice) {
        this.originalPrice = originalPrice;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column second_hand_post.sell_price
     *
     * @return the value of second_hand_post.sell_price
     *
     * @mbggenerated
     */
    public BigDecimal getSellPrice() {
        return sellPrice;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column second_hand_post.sell_price
     *
     * @param sellPrice the value for second_hand_post.sell_price
     *
     * @mbggenerated
     */
    public void setSellPrice(BigDecimal sellPrice) {
        this.sellPrice = sellPrice;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column second_hand_post.likes
     *
     * @return the value of second_hand_post.likes
     *
     * @mbggenerated
     */
    public Integer getLikes() {
        return likes;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column second_hand_post.likes
     *
     * @param likes the value for second_hand_post.likes
     *
     * @mbggenerated
     */
    public void setLikes(Integer likes) {
        this.likes = likes;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column second_hand_post.dislikes
     *
     * @return the value of second_hand_post.dislikes
     *
     * @mbggenerated
     */
    public Integer getDislikes() {
        return dislikes;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column second_hand_post.dislikes
     *
     * @param dislikes the value for second_hand_post.dislikes
     *
     * @mbggenerated
     */
    public void setDislikes(Integer dislikes) {
        this.dislikes = dislikes;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column second_hand_post.member_id
     *
     * @return the value of second_hand_post.member_id
     *
     * @mbggenerated
     */
    public Integer getMemberId() {
        return memberId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column second_hand_post.member_id
     *
     * @param memberId the value for second_hand_post.member_id
     *
     * @mbggenerated
     */
    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column second_hand_post.second_hand_post_category_id
     *
     * @return the value of second_hand_post.second_hand_post_category_id
     *
     * @mbggenerated
     */
    public Integer getSecondHandPostCategoryId() {
        return secondHandPostCategoryId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column second_hand_post.second_hand_post_category_id
     *
     * @param secondHandPostCategoryId the value for second_hand_post.second_hand_post_category_id
     *
     * @mbggenerated
     */
    public void setSecondHandPostCategoryId(Integer secondHandPostCategoryId) {
        this.secondHandPostCategoryId = secondHandPostCategoryId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column second_hand_post.complaint
     *
     * @return the value of second_hand_post.complaint
     *
     * @mbggenerated
     */
    public Integer getComplaint() {
        return complaint;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column second_hand_post.complaint
     *
     * @param complaint the value for second_hand_post.complaint
     *
     * @mbggenerated
     */
    public void setComplaint(Integer complaint) {
        this.complaint = complaint;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column second_hand_post.page_view
     *
     * @return the value of second_hand_post.page_view
     *
     * @mbggenerated
     */
    public Integer getPageView() {
        return pageView;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column second_hand_post.page_view
     *
     * @param pageView the value for second_hand_post.page_view
     *
     * @mbggenerated
     */
    public void setPageView(Integer pageView) {
        this.pageView = pageView;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column second_hand_post.verified
     *
     * @return the value of second_hand_post.verified
     *
     * @mbggenerated
     */
    public String getVerified() {
        return verified;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column second_hand_post.verified
     *
     * @param verified the value for second_hand_post.verified
     *
     * @mbggenerated
     */
    public void setVerified(String verified) {
        this.verified = verified == null ? null : verified.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column second_hand_post.trade_place
     *
     * @return the value of second_hand_post.trade_place
     *
     * @mbggenerated
     */
    public String getTradePlace() {
        return tradePlace;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("SHPostModel{");
        sb.append("id=").append(id);
        sb.append(", picturePath='").append(picturePath).append('\'');
        sb.append(", description='").append(description).append('\'');
        sb.append(", title='").append(title).append('\'');
        sb.append(", deleted=").append(deleted);
        sb.append(", expiredTime=").append(expiredTime);
        sb.append(", postTime=").append(postTime);
        sb.append(", depreciationRate='").append(depreciationRate).append('\'');
        sb.append(", originalPrice=").append(originalPrice);
        sb.append(", sellPrice=").append(sellPrice);
        sb.append(", likes=").append(likes);
        sb.append(", dislikes=").append(dislikes);
        sb.append(", memberId=").append(memberId);
        sb.append(", secondHandPostCategoryId=").append(secondHandPostCategoryId);
        sb.append(", complaint=").append(complaint);
        sb.append(", pageView=").append(pageView);
        sb.append(", expired=").append(expired);
        sb.append(", verified='").append(verified).append('\'');
        sb.append(", tradePlace='").append(tradePlace).append('\'');
        sb.append(", contactName='").append(contactName).append('\'');
        sb.append(", contactQq='").append(contactQq).append('\'');
        sb.append(", contactPhone='").append(contactPhone).append('\'');
        sb.append(", member=").append(member);
        sb.append(", category=").append(category);
        sb.append('}');
        sb.append(pageNumber);
        sb.append(pageSize);
        return sb.toString();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column second_hand_post.trade_place
     *
     * @param tradePlace the value for second_hand_post.trade_place
     *
     * @mbggenerated
     */
    public void setTradePlace(String tradePlace) {
        this.tradePlace = tradePlace == null ? null : tradePlace.trim();
    }
}
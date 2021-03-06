package com.fh.taolijie.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class IdCertiModel extends Pageable {
    private Integer id;

    private String name;

    private Integer memId;

    private String username;

    private String status;

    private String idNum;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createdTime;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    private String picIds;

    private String memo;

    public IdCertiModel() {}
    public IdCertiModel(int pn, int ps) {
        super(pn, ps);
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column id_certi.name
     *
     * @return the value of id_certi.name
     *
     * @mbggenerated
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column id_certi.name
     *
     * @param name the value for id_certi.name
     *
     * @mbggenerated
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column id_certi.mem_id
     *
     * @return the value of id_certi.mem_id
     *
     * @mbggenerated
     */
    public Integer getMemId() {
        return memId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column id_certi.mem_id
     *
     * @param memId the value for id_certi.mem_id
     *
     * @mbggenerated
     */
    public void setMemId(Integer memId) {
        this.memId = memId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column id_certi.username
     *
     * @return the value of id_certi.username
     *
     * @mbggenerated
     */
    public String getUsername() {
        return username;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column id_certi.username
     *
     * @param username the value for id_certi.username
     *
     * @mbggenerated
     */
    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column id_certi.id_num
     *
     * @return the value of id_certi.id_num
     *
     * @mbggenerated
     */
    public String getIdNum() {
        return idNum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column id_certi.id_num
     *
     * @param idNum the value for id_certi.id_num
     *
     * @mbggenerated
     */
    public void setIdNum(String idNum) {
        this.idNum = idNum == null ? null : idNum.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column id_certi.created_time
     *
     * @return the value of id_certi.created_time
     *
     * @mbggenerated
     */
    public Date getCreatedTime() {
        return createdTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column id_certi.created_time
     *
     * @param createdTime the value for id_certi.created_time
     *
     * @mbggenerated
     */
    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column id_certi.update_time
     *
     * @return the value of id_certi.update_time
     *
     * @mbggenerated
     */
    public Date getUpdateTime() {
        return updateTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column id_certi.update_time
     *
     * @param updateTime the value for id_certi.update_time
     *
     * @mbggenerated
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column id_certi.pic_ids
     *
     * @return the value of id_certi.pic_ids
     *
     * @mbggenerated
     */
    public String getPicIds() {
        return picIds;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column id_certi.pic_ids
     *
     * @param picIds the value for id_certi.pic_ids
     *
     * @mbggenerated
     */
    public void setPicIds(String picIds) {
        this.picIds = picIds == null ? null : picIds.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column id_certi.memo
     *
     * @return the value of id_certi.memo
     *
     * @mbggenerated
     */
    public String getMemo() {
        return memo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column id_certi.memo
     *
     * @param memo the value for id_certi.memo
     *
     * @mbggenerated
     */
    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }
}
package com.fh.taolijie.domain.quest;

public class QuestSchRelModel {
    private Integer id;

    private Integer questId;

    private Integer schoolId;
    private String schoolName;

    public QuestSchRelModel() {}

    public QuestSchRelModel(Integer questId, Integer schoolId) {
        this.questId = questId;
        this.schoolId = schoolId;
    }

    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column quest_school_rel.id
     *
     * @param id the value for quest_school_rel.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column quest_school_rel.quest_id
     *
     * @return the value of quest_school_rel.quest_id
     *
     * @mbggenerated
     */
    public Integer getQuestId() {
        return questId;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column quest_school_rel.quest_id
     *
     * @param questId the value for quest_school_rel.quest_id
     *
     * @mbggenerated
     */
    public void setQuestId(Integer questId) {
        this.questId = questId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column quest_school_rel.school_id
     *
     * @return the value of quest_school_rel.school_id
     *
     * @mbggenerated
     */
    public Integer getSchoolId() {
        return schoolId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column quest_school_rel.school_id
     *
     * @param schoolId the value for quest_school_rel.school_id
     *
     * @mbggenerated
     */
    public void setSchoolId(Integer schoolId) {
        this.schoolId = schoolId;
    }
}
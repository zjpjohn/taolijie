package com.fh.taolijie.domain;

public class DictProvinceModel {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dict_province.id
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dict_province.name
     *
     * @mbggenerated
     */
    private String name;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dict_province.id
     *
     * @return the value of dict_province.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dict_province.id
     *
     * @param id the value for dict_province.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dict_province.name
     *
     * @return the value of dict_province.name
     *
     * @mbggenerated
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dict_province.name
     *
     * @param name the value for dict_province.name
     *
     * @mbggenerated
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}
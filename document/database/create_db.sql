-- MySQL Script generated by MySQL Workbench
-- Sat Aug 22 11:40:25 2015
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema taolijie
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema taolijie
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `taolijie` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `taolijie` ;

-- -----------------------------------------------------
-- Table `taolijie`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`role` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`role` (
  `rid` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `rolename` VARCHAR(45) NULL COMMENT '',
  `memo` TEXT NULL COMMENT '',
  PRIMARY KEY (`rid`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taolijie`.`member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`member` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`member` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `username` VARCHAR(45) NOT NULL COMMENT '登陆名',
  `password` VARCHAR(90) NOT NULL COMMENT '',
  `email` VARCHAR(45) NULL COMMENT '',
  `name` VARCHAR(45) NULL COMMENT '真人人名',
  `student_id` TEXT NULL COMMENT '学号',
  `qq` VARCHAR(20) NULL COMMENT '',
  `age` INT NULL COMMENT '',
  `gender` VARCHAR(10) NULL COMMENT '',
  `credits` INT NULL DEFAULT 0 COMMENT '积分',
  `auto_login_identifier` VARCHAR(60) NULL COMMENT '',
  `app_token` VARCHAR(25) NULL COMMENT '移动端的登陆标识',
  `last_post_time` DATETIME NULL COMMENT '最近一次发布信息的时间',
  `reset_password_token` VARCHAR(45) NULL COMMENT '',
  `created_time` DATETIME NULL COMMENT '',
  `verified` VARCHAR(50) NULL COMMENT '审核状态：NONE, INPROCESS, VERIFIED',
  `profile_photo_path` VARCHAR(256) NULL COMMENT '头像路径',
  `phone` VARCHAR(20) NULL COMMENT '',
  `company_name` VARCHAR(128) NULL COMMENT '',
  `block_list` TEXT NULL COMMENT '要屏蔽的商家。保存id号，以;分隔。如1;2;3;4;5',
  `valid` TINYINT(1) NULL DEFAULT 1 COMMENT '是否封号',
  `complaint` INT NULL DEFAULT 0 COMMENT '被投诉数',
  `applied_job_ids` TEXT NULL COMMENT '已申请的工作id',
  `profile_photo_id` INT NULL COMMENT '',
  `last_token_date` DATETIME NULL COMMENT '',
  `school_organization` VARCHAR(15) NULL COMMENT '校园组织验证状态. NONE, IN_PROCESS, REJECTED, PASSED',
  `liked_job_ids` TEXT NULL COMMENT '',
  `liked_sh_ids` TEXT NULL COMMENT '',
  `favorite_job_ids` TEXT NULL COMMENT '',
  `favorite_sh_ids` TEXT NULL COMMENT '',
  `favorite_resume_ids` TEXT NULL COMMENT '',
  `read_global_noti_ids` TEXT NULL COMMENT '已经读过的全局通知',
  `last_job_date` DATETIME NULL COMMENT '最近一次发布兼职信息的时间',
  `last_sh_date` DATETIME NULL COMMENT '最近一次发布二手信息的时间',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `idx_member_app_token` (`app_token` ASC)  COMMENT '',
  INDEX `idx_member_username` (`username` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taolijie`.`job_post_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`job_post_category` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`job_post_category` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(45) NULL COMMENT '',
  `memo` TEXT NULL COMMENT '',
  `level` INT NULL COMMENT '分类层次：一级分类(1)、二级分类(2)',
  `theme_color` VARCHAR(45) NULL COMMENT '#FFFFFF值',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB
COMMENT = '兼职信息分类';


-- -----------------------------------------------------
-- Table `taolijie`.`job_post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`job_post` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`job_post` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `title` VARCHAR(45) NULL COMMENT '',
  `expired_time` DATETIME NULL COMMENT '',
  `post_time` DATETIME NULL COMMENT '',
  `work_place` VARCHAR(256) NULL COMMENT '',
  `wage` DECIMAL(6,1) NULL COMMENT '',
  `time_to_pay` VARCHAR(45) NULL COMMENT '结算方式',
  `job_description` VARCHAR(1000) NULL COMMENT '工作简介',
  `contact` VARCHAR(45) NULL COMMENT '联系人名',
  `contact_phone` VARCHAR(45) NULL COMMENT '联系人手机号',
  `contact_email` VARCHAR(45) NULL COMMENT '联系人mail\n',
  `contact_qq` VARCHAR(45) NULL COMMENT '',
  `job_detail` VARCHAR(1000) NULL COMMENT '工作详细描述',
  `introduce` TEXT NULL COMMENT '商家介绍',
  `likes` INT NULL DEFAULT 0 COMMENT '',
  `dislikes` INT NULL DEFAULT 0 COMMENT '',
  `job_post_category_id` INT NULL COMMENT '',
  `member_id` INT NULL COMMENT '',
  `education_level` VARCHAR(45) NULL COMMENT '学历要求信息',
  `complaint` INT NULL DEFAULT 0 COMMENT '',
  `work_time` VARCHAR(128) NULL COMMENT '工作时间',
  `salary_unit` VARCHAR(45) NULL COMMENT '工资单位：天、周、月',
  `page_view` INT NULL DEFAULT 0 COMMENT '',
  `verified` VARCHAR(45) NULL COMMENT '',
  `job_postcol` VARCHAR(45) NULL COMMENT '',
  `application_resume_ids` TEXT NULL COMMENT '收到的简历id',
  `applicant_amount` INT NULL DEFAULT 0 COMMENT '申请者数量',
  `deleted` TINYINT(1) NULL DEFAULT 0 COMMENT '',
  `work_region` VARCHAR(45) NULL COMMENT '工作的地域，如博山、张店等等',
  `expired` TINYINT(1) NULL DEFAULT 0 COMMENT '是否过期',
  `province` VARCHAR(15) NULL COMMENT '工作所在省',
  `city` VARCHAR(15) NULL COMMENT '工作所在市',
  `region` VARCHAR(15) NULL COMMENT '工作所在区',
  `is_indexed` TINYINT(1) NULL DEFAULT 0 COMMENT '是否已经完成了inverted index的创建',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_job_post_job_post_category1_idx` (`job_post_category_id` ASC)  COMMENT '',
  INDEX `fk_job_post_member1_idx` (`member_id` ASC)  COMMENT '',
  INDEX `idx_is_indexed` (`is_indexed` ASC)  COMMENT '',
  CONSTRAINT `fk_job_post_job_post_category1`
    FOREIGN KEY (`job_post_category_id`)
    REFERENCES `taolijie`.`job_post_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_job_post_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `taolijie`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taolijie`.`resume`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`resume` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`resume` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(45) NULL COMMENT '',
  `gender` VARCHAR(10) NULL COMMENT '',
  `age` INT NULL COMMENT '',
  `height` INT NULL COMMENT '',
  `photo_path` VARCHAR(256) NULL COMMENT '用户头像图片路径',
  `email` VARCHAR(45) NULL COMMENT '',
  `qq` VARCHAR(45) NULL COMMENT '',
  `experience` TEXT NULL COMMENT '',
  `introduce` TEXT NULL COMMENT '自我介绍',
  `member_id` INT NULL COMMENT '',
  `access_authority` VARCHAR(45) NULL COMMENT '访问权限: ME_ONLY, ALL',
  `page_view` INT NULL DEFAULT 0 COMMENT '访问量',
  `verified` VARCHAR(45) NULL COMMENT '审核状态',
  `photo_id` INT NULL COMMENT '',
  `phone_number` VARCHAR(45) NULL COMMENT '',
  `wechat_account` VARCHAR(45) NULL COMMENT '',
  `created_time` DATETIME NULL COMMENT '',
  `spare_time` VARCHAR(45) NULL COMMENT '空闲时间描述',
  `major` VARCHAR(30) NULL COMMENT '专业',
  `school` VARCHAR(30) NULL COMMENT '学校名',
  `preferred_province` VARCHAR(30) NULL COMMENT '',
  `preferred_city` VARCHAR(30) NULL COMMENT '',
  `preferred_region` VARCHAR(30) NULL COMMENT '',
  `birthday` DATETIME NULL COMMENT 'ß',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_Resume_User1_idx` (`member_id` ASC)  COMMENT '',
  CONSTRAINT `fk_Resume_User1`
    FOREIGN KEY (`member_id`)
    REFERENCES `taolijie`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taolijie`.`review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`review` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`review` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `content` TEXT NULL COMMENT '',
  `job_post_id` INT NULL COMMENT '如果被评论者是兼职，该字段为兼职id',
  `member_id` INT NULL COMMENT '',
  `time` DATETIME NULL COMMENT '',
  `replied_review_id` INT NULL COMMENT '此field有值表示这是一条评论回复',
  `sh_post_id` INT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_Review_User1_idx` (`member_id` ASC)  COMMENT '',
  INDEX `fk_review_review1_idx` (`replied_review_id` ASC)  COMMENT '',
  CONSTRAINT `fk_Review_User1`
    FOREIGN KEY (`member_id`)
    REFERENCES `taolijie`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_review1`
    FOREIGN KEY (`replied_review_id`)
    REFERENCES `taolijie`.`review` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taolijie`.`school`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`school` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`school` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `short_name` VARCHAR(20) NULL COMMENT '',
  `full_name` VARCHAR(128) NULL COMMENT '',
  `province` VARCHAR(45) NULL COMMENT '大学所在省份',
  `type` VARCHAR(45) NULL COMMENT 'e.g., HIGH_SCHOOL, UNDERGRADUATE, INSTITUTE(专科)',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taolijie`.`academy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`academy` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`academy` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `short_name` VARCHAR(20) NULL COMMENT '',
  `full_name` VARCHAR(128) NULL COMMENT '',
  `college_id` INT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_School_College1_idx` (`college_id` ASC)  COMMENT '',
  CONSTRAINT `fk_School_College1`
    FOREIGN KEY (`college_id`)
    REFERENCES `taolijie`.`school` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '学院';


-- -----------------------------------------------------
-- Table `taolijie`.`banner_pic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`banner_pic` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`banner_pic` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `created_time` DATETIME NULL COMMENT '',
  `picture_id` INT NULL COMMENT 'image_resource表的主键',
  `url` VARCHAR(256) NULL COMMENT '',
  `memo` VARCHAR(256) NULL COMMENT '',
  `order_index` INT NULL COMMENT '排序,值越小越靠前',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taolijie`.`second_hand_post_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`second_hand_post_category` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`second_hand_post_category` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(45) NULL COMMENT '',
  `memo` TEXT NULL COMMENT '',
  `level` INT NULL COMMENT '',
  `theme_color` VARCHAR(45) NULL COMMENT '#FFAABB值',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB
COMMENT = '二手信息帖子分类';


-- -----------------------------------------------------
-- Table `taolijie`.`second_hand_post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`second_hand_post` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`second_hand_post` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `title` VARCHAR(45) NULL COMMENT '',
  `expired_time` DATETIME NULL COMMENT '过期时间',
  `post_time` DATETIME NULL COMMENT '',
  `depreciation_rate` VARCHAR(10) NULL COMMENT '9成，95成\n',
  `original_price` DECIMAL(6,1) NULL COMMENT '原价格',
  `sell_price` DECIMAL(6,1) NULL COMMENT '现价',
  `picture_path` TEXT NULL COMMENT '物品图片路径，以;分号分隔。如: /home/a.jpg;/home/b.jpg',
  `description` TEXT NULL COMMENT '物品描述',
  `likes` INT NULL DEFAULT 0 COMMENT '',
  `dislikes` INT NULL DEFAULT 0 COMMENT '',
  `member_id` INT NULL COMMENT '',
  `second_hand_post_category_id` INT NULL COMMENT '',
  `complaint` INT NULL DEFAULT 0 COMMENT '',
  `page_view` INT NULL DEFAULT 0 COMMENT '',
  `verified` VARCHAR(45) NULL COMMENT '',
  `trade_place` VARCHAR(45) NULL COMMENT '',
  `deleted` TINYINT(1) NULL DEFAULT 0 COMMENT '',
  `contact_name` VARCHAR(20) NULL COMMENT '',
  `contact_qq` VARCHAR(20) NULL COMMENT '',
  `contact_phone` VARCHAR(20) NULL COMMENT '',
  `expired` TINYINT(1) NULL DEFAULT 0 COMMENT '是否下架',
  `is_indexed` TINYINT(1) NULL DEFAULT 0 COMMENT '是否已经完成了inverted index的创建',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_second_hand_post_member1_idx` (`member_id` ASC)  COMMENT '',
  INDEX `fk_second_hand_post_second_hand_post_category1_idx` (`second_hand_post_category_id` ASC)  COMMENT '',
  INDEX `idx_is_indexed` (`is_indexed` ASC)  COMMENT '',
  CONSTRAINT `fk_second_hand_post_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `taolijie`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_second_hand_post_second_hand_post_category1`
    FOREIGN KEY (`second_hand_post_category_id`)
    REFERENCES `taolijie`.`second_hand_post_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taolijie`.`private_notification`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`private_notification` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`private_notification` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `member_id` INT NULL COMMENT '',
  `title` VARCHAR(45) NULL COMMENT '',
  `content` TEXT NULL COMMENT '',
  `is_read` TINYINT(1) NULL DEFAULT 0 COMMENT '',
  `time` DATETIME NULL COMMENT '',
  `access_range` VARCHAR(45) NULL COMMENT 'GLOBAL, (与role_type相同)',
  `to_member_id` INT NULL COMMENT '',
  `noti_type` VARCHAR(2) NULL COMMENT '	⁃	通知的类型。0为管理员发送的通知, 1为程序自动生成的通知(如被评论), 2为普通用户发送的通知\n',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_notification_member1_idx` (`member_id` ASC)  COMMENT '',
  CONSTRAINT `fk_notification_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `taolijie`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taolijie`.`job_post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`job_post` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`job_post` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `title` VARCHAR(45) NULL COMMENT '',
  `expired_time` DATETIME NULL COMMENT '',
  `post_time` DATETIME NULL COMMENT '',
  `work_place` VARCHAR(256) NULL COMMENT '',
  `wage` DECIMAL(6,1) NULL COMMENT '',
  `time_to_pay` VARCHAR(45) NULL COMMENT '结算方式',
  `job_description` VARCHAR(1000) NULL COMMENT '工作简介',
  `contact` VARCHAR(45) NULL COMMENT '联系人名',
  `contact_phone` VARCHAR(45) NULL COMMENT '联系人手机号',
  `contact_email` VARCHAR(45) NULL COMMENT '联系人mail\n',
  `contact_qq` VARCHAR(45) NULL COMMENT '',
  `job_detail` VARCHAR(1000) NULL COMMENT '工作详细描述',
  `introduce` TEXT NULL COMMENT '商家介绍',
  `likes` INT NULL DEFAULT 0 COMMENT '',
  `dislikes` INT NULL DEFAULT 0 COMMENT '',
  `job_post_category_id` INT NULL COMMENT '',
  `member_id` INT NULL COMMENT '',
  `education_level` VARCHAR(45) NULL COMMENT '学历要求信息',
  `complaint` INT NULL DEFAULT 0 COMMENT '',
  `work_time` VARCHAR(128) NULL COMMENT '工作时间',
  `salary_unit` VARCHAR(45) NULL COMMENT '工资单位：天、周、月',
  `page_view` INT NULL DEFAULT 0 COMMENT '',
  `verified` VARCHAR(45) NULL COMMENT '',
  `job_postcol` VARCHAR(45) NULL COMMENT '',
  `application_resume_ids` TEXT NULL COMMENT '收到的简历id',
  `applicant_amount` INT NULL DEFAULT 0 COMMENT '申请者数量',
  `deleted` TINYINT(1) NULL DEFAULT 0 COMMENT '',
  `work_region` VARCHAR(45) NULL COMMENT '工作的地域，如博山、张店等等',
  `expired` TINYINT(1) NULL DEFAULT 0 COMMENT '是否过期',
  `province` VARCHAR(15) NULL COMMENT '工作所在省',
  `city` VARCHAR(15) NULL COMMENT '工作所在市',
  `region` VARCHAR(15) NULL COMMENT '工作所在区',
  `is_indexed` TINYINT(1) NULL DEFAULT 0 COMMENT '是否已经完成了inverted index的创建',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_job_post_job_post_category1_idx` (`job_post_category_id` ASC)  COMMENT '',
  INDEX `fk_job_post_member1_idx` (`member_id` ASC)  COMMENT '',
  INDEX `idx_is_indexed` (`is_indexed` ASC)  COMMENT '',
  CONSTRAINT `fk_job_post_job_post_category1`
    FOREIGN KEY (`job_post_category_id`)
    REFERENCES `taolijie`.`job_post_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_job_post_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `taolijie`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taolijie`.`news`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`news` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`news` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `title` VARCHAR(45) NULL COMMENT '',
  `content` TEXT NULL COMMENT '',
  `place` VARCHAR(45) NULL COMMENT '活动地点',
  `picture_path` TEXT NULL COMMENT '文章引用的图片路径，以;分隔',
  `time` DATETIME NULL COMMENT '',
  `member_id` INT NULL COMMENT '',
  `head_picture_path` VARCHAR(256) NULL COMMENT '文章标题旁边显示的图片',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_news_member1_idx` (`member_id` ASC)  COMMENT '',
  CONSTRAINT `fk_news_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `taolijie`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '首页显示的新闻信息';


-- -----------------------------------------------------
-- Table `taolijie`.`education_experience`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`education_experience` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`education_experience` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `member_id` INT NULL COMMENT '',
  `admission_time` DATE NULL COMMENT '入学时间',
  `length_of_schooling` INT NULL COMMENT '学制(年)',
  `major` VARCHAR(45) NULL COMMENT '专业',
  `academy_id` INT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_education_experience_member1_idx` (`member_id` ASC)  COMMENT '',
  INDEX `fk_education_experience_academy1_idx` (`academy_id` ASC)  COMMENT '',
  CONSTRAINT `fk_education_experience_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `taolijie`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_education_experience_academy1`
    FOREIGN KEY (`academy_id`)
    REFERENCES `taolijie`.`academy` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '教育经历';


-- -----------------------------------------------------
-- Table `taolijie`.`member_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`member_role` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`member_role` (
  `member_id` INT NULL COMMENT '',
  `role_rid` INT NULL COMMENT '',
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  INDEX `fk_member_has_role_role1_idx` (`role_rid` ASC)  COMMENT '',
  INDEX `fk_member_has_role_member1_idx` (`member_id` ASC)  COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  CONSTRAINT `fk_member_has_role_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `taolijie`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_has_role_role1`
    FOREIGN KEY (`role_rid`)
    REFERENCES `taolijie`.`role` (`rid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taolijie`.`image_resource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`image_resource` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`image_resource` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `file_name` VARCHAR(256) NULL COMMENT '',
  `extension` VARCHAR(10) NULL COMMENT '.jpeg, .gif',
  `bin_data` MEDIUMBLOB NULL COMMENT '',
  `type` VARCHAR(45) NULL COMMENT '图片的作用. 如:身份证图片, 证件图片等',
  `member_id` INT NULL COMMENT '如果是用户上传的证件照, 则这里为用户表的id',
  `job_post_id` INT NULL COMMENT '',
  `sh_post_id` INT NULL COMMENT '',
  `news_id` INT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taolijie`.`bulletin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`bulletin` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`bulletin` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `content` TEXT NULL COMMENT '',
  `created_time` DATE NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB
COMMENT = '系统公告';


-- -----------------------------------------------------
-- Table `taolijie`.`resume_job_post_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`resume_job_post_category` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`resume_job_post_category` (
  `resume_id` INT NULL COMMENT '',
  `job_post_category_id` INT NULL COMMENT '',
  INDEX `fk_resume_has_job_post_category_job_post_category1_idx` (`job_post_category_id` ASC)  COMMENT '',
  INDEX `fk_resume_has_job_post_category_resume1_idx` (`resume_id` ASC)  COMMENT '',
  CONSTRAINT `fk_resume_has_job_post_category_resume1`
    FOREIGN KEY (`resume_id`)
    REFERENCES `taolijie`.`resume` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resume_has_job_post_category_job_post_category1`
    FOREIGN KEY (`job_post_category_id`)
    REFERENCES `taolijie`.`job_post_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taolijie`.`taoli_ivy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`taoli_ivy` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`taoli_ivy` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `title` VARCHAR(45) NULL COMMENT '',
  `content` TEXT NULL COMMENT '',
  `created_time` DATE NULL COMMENT '',
  `likes` INT NULL COMMENT '',
  `expired_time` DATE NULL COMMENT '过期时间',
  `taoli_ivy_category_id` INT NULL COMMENT '',
  `member_id` INT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB
COMMENT = '桃李青藤';


-- -----------------------------------------------------
-- Table `taolijie`.`taoli_ivy_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`taoli_ivy_category` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`taoli_ivy_category` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(45) NULL COMMENT '',
  `memo` TEXT NULL COMMENT '',
  `level` INT NULL COMMENT '',
  `theme_color` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB
COMMENT = '桃李青藤分类表';


-- -----------------------------------------------------
-- Table `taolijie`.`school_organization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`school_organization` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`school_organization` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `title` VARCHAR(45) NULL COMMENT '',
  `description` VARCHAR(100) NULL COMMENT '简介',
  `member_names` TEXT NULL COMMENT '成员列表',
  `slogan` VARCHAR(100) NULL COMMENT '口号',
  `bulletin` TEXT NULL COMMENT '公告',
  `location` VARCHAR(45) NULL COMMENT '地点',
  `qq` VARCHAR(45) NULL COMMENT '',
  `phone` VARCHAR(45) NULL COMMENT '',
  `wechat` VARCHAR(45) NULL COMMENT '',
  `member_id` INT NULL COMMENT '',
  `school_organization_category_id` INT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB
COMMENT = '校内组织';


-- -----------------------------------------------------
-- Table `taolijie`.`school_activity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`school_activity` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`school_activity` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `member_id` INT NULL COMMENT '如果是个人发布的, 该字段存放用户id',
  `school_organization_id` INT NULL COMMENT '',
  `title` VARCHAR(45) NULL COMMENT '',
  `content` TEXT NULL COMMENT '',
  `created_time` DATE NULL COMMENT '',
  `expired_time` DATE NULL COMMENT '',
  `likes` INT NULL COMMENT '',
  `school_activity_category_id` INT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB
COMMENT = '校园活动';


-- -----------------------------------------------------
-- Table `taolijie`.`ivy_activity_image_resource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`ivy_activity_image_resource` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`ivy_activity_image_resource` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `file_name` VARCHAR(256) NULL COMMENT '',
  `extension` VARCHAR(10) NULL COMMENT '',
  `bin_data` MEDIUMBLOB NULL COMMENT '',
  `ivy_id` INT NULL COMMENT '',
  `activity_id` INT NULL COMMENT '',
  `type` VARCHAR(45) NULL COMMENT 'MAIN: 主要图片',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB
COMMENT = '桃李青藤, 校园活动中使用到的图片信息';


-- -----------------------------------------------------
-- Table `taolijie`.`member_verification_rel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`member_verification_rel` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`member_verification_rel` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `member_id` INT NULL COMMENT '',
  `image_id` INT NULL COMMENT '',
  `image_type` VARCHAR(45) NULL COMMENT 'ID_FRONT, ID_BACK, ORG_FRONT, ORG_BACK, STU_ID_FRONT, STU_ID_BACK',
  `created_time` DATE NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB
COMMENT = '与image_resource表关联, 保存用户上传的证件照片';


-- -----------------------------------------------------
-- Table `taolijie`.`school_organization_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`school_organization_category` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`school_organization_category` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(45) NULL COMMENT '',
  `memo` TEXT NULL COMMENT '',
  `level` INT NULL COMMENT '',
  `theme_color` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB
COMMENT = '校园组织分类表';


-- -----------------------------------------------------
-- Table `taolijie`.`participant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`participant` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`participant` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `member_id` INT NULL COMMENT '',
  `ivy_id` INT NULL COMMENT '',
  `activity_id` INT NULL COMMENT '',
  `name` VARCHAR(45) NULL COMMENT '',
  `academy` VARCHAR(45) NULL COMMENT '学院',
  `className` VARCHAR(45) NULL COMMENT '班级',
  `qq` VARCHAR(45) NULL COMMENT '',
  `phone` VARCHAR(45) NULL COMMENT '',
  `weichat` VARCHAR(45) NULL COMMENT '',
  `email` VARCHAR(45) NULL COMMENT '',
  `gender` VARCHAR(10) NULL COMMENT '',
  `created_time` DATE NULL COMMENT '报名时间',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB
COMMENT = '\"想去\"功能对应的数据表';


-- -----------------------------------------------------
-- Table `taolijie`.`credits_level`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`credits_level` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`credits_level` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `min_credits` INT NULL COMMENT '',
  `max_credits` INT NULL COMMENT '',
  `name` VARCHAR(45) NULL COMMENT '',
  `memo` TEXT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB
COMMENT = '积分阶梯';


-- -----------------------------------------------------
-- Table `taolijie`.`school_activity_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`school_activity_category` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`school_activity_category` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(45) NULL COMMENT '',
  `memo` TEXT NULL COMMENT '',
  `level` INT NULL COMMENT '',
  `theme_color` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taolijie`.`resume_post_rel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`resume_post_rel` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`resume_post_rel` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `resume_id` INT NULL COMMENT '',
  `job_post_id` INT NULL COMMENT '',
  `created_time` DATETIME NULL COMMENT '投递时间',
  `member_id` INT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB
COMMENT = '简历投递表';


-- -----------------------------------------------------
-- Table `taolijie`.`system_notification`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`system_notification` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`system_notification` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `title` VARCHAR(45) NULL COMMENT '',
  `content` TEXT NULL COMMENT '',
  `is_read` TINYINT(1) NULL DEFAULT 0 COMMENT '',
  `time` DATETIME NULL COMMENT '',
  `access_range` VARCHAR(45) NULL COMMENT 'GLOBAL, (与role_type相同)',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taolijie`.`recommended_post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`recommended_post` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`recommended_post` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `job_id` INT NULL COMMENT '',
  `sh_id` INT NULL COMMENT '',
  `resume_id` INT NULL COMMENT '',
  `apply_time` DATETIME NULL COMMENT '申请时间',
  `validation` TINYINT(1) NULL DEFAULT 0 COMMENT '是否显示在首页',
  `member_id` INT NULL COMMENT '申请人',
  `memo` VARCHAR(300) NULL COMMENT '',
  `order_index` INT NULL COMMENT '排序指数，值越小越靠前，从0开始',
  `pass_time` DATETIME NULL COMMENT '通过审核的时间',
  `remove_time` DATETIME NULL COMMENT '下架时间',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taolijie`.`feedback`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`feedback` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`feedback` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '反馈表',
  `phone` VARCHAR(20) NULL COMMENT '',
  `email` VARCHAR(45) NULL COMMENT '',
  `created_time` TIMESTAMP NULL COMMENT '',
  `title` VARCHAR(30) NULL COMMENT '',
  `content` VARCHAR(500) NULL COMMENT '',
  `member_id` INT NULL COMMENT '反馈者的用户id. 如果没有则留空',
  `username` VARCHAR(45) NULL COMMENT '冗余字段，保存member表的用户名',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taolijie`.`my_collection`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taolijie`.`my_collection` ;

CREATE TABLE IF NOT EXISTS `taolijie`.`my_collection` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `created_time` DATETIME NULL COMMENT '收藏时间',
  `member_id` INT NULL COMMENT '收藏者用户id',
  `job_post_id` INT NULL COMMENT '',
  `sh_post_id` INT NULL COMMENT '',
  `resume_id` INT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `idx_collection_job_post` (`job_post_id` ASC)  COMMENT '',
  INDEX `idx_collection_sh_post` (`sh_post_id` ASC)  COMMENT '',
  INDEX `idx_collection_resume` (`resume_id` ASC)  COMMENT '')
ENGINE = InnoDB
COMMENT = '我的收藏关联表';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

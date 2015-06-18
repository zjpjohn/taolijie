-- MySQL Script generated by MySQL Workbench
-- 2015年06月18日 星期四 23时41分01秒
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema taolijie
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `taolijie` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `taolijie` ;

-- -----------------------------------------------------
-- Table `taolijie`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taolijie`.`role` (
  `rid` INT NOT NULL AUTO_INCREMENT,
  `rolename` VARCHAR(45) NULL,
  `memo` TEXT NULL,
  PRIMARY KEY (`rid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taolijie`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taolijie`.`member` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL COMMENT '登陆名',
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL COMMENT '真人人名',
  `student_id` TEXT NULL COMMENT '学号',
  `gender` VARCHAR(10) NULL,
  `verified` VARCHAR(50) NULL COMMENT '审核状态：NONE, INPROCESS, VERIFIED',
  `profile_photo_path` VARCHAR(256) NULL COMMENT '头像路径',
  `phone` VARCHAR(20) NULL,
  `qq` VARCHAR(2) NULL,
  `age` INT NULL,
  `company_name` VARCHAR(128) NULL,
  `block_list` TEXT NULL COMMENT '要屏蔽的商家。保存id号，以;分隔。如1;2;3;4;5',
  `created_time` DATE NULL,
  `valid` TINYINT(1) NULL DEFAULT 1 COMMENT '是否封号',
  `complaint` INT NULL DEFAULT 0 COMMENT '被投诉数',
  `applied_job_ids` TEXT NULL COMMENT '已申请的工作id',
  `profile_photo_id` INT NULL,
  `liked_job_ids` TEXT NULL,
  `liked_sh_ids` TEXT NULL,
  `auto_login_identifier` VARCHAR(60) NULL,
  `last_post_time` DATE NULL COMMENT '最近一次发布信息的时间',
  `reset_password_token` VARCHAR(45) NULL,
  `last_token_date` DATE NULL,
  `school_organization` VARCHAR(15) NULL COMMENT '校园组织验证状态. NONE, IN_PROCESS, REJECTED, PASSED',
  `creadits` INT ZEROFILL NULL DEFAULT 0 COMMENT '积分',
  `favorite_job_ids` TEXT NULL,
  `favorite_sh_ids` TEXT NULL,
  `favorite_resume_ids` TEXT NULL,
  `read_global_noti_ids` TEXT NULL COMMENT '已经读过的全局通知',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taolijie`.`job_post_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taolijie`.`job_post_category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `memo` TEXT NULL,
  `level` INT NULL COMMENT '分类层次：一级分类(1)、二级分类(2)',
  `theme_color` VARCHAR(45) NULL COMMENT '#FFFFFF值',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = '兼职信息分类';


-- -----------------------------------------------------
-- Table `taolijie`.`job_post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taolijie`.`job_post` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `expired_time` DATE NULL,
  `post_time` DATE NULL,
  `work_place` VARCHAR(45) NULL,
  `wage` DECIMAL(6,1) NULL,
  `time_to_pay` VARCHAR(45) NULL COMMENT '结算方式',
  `job_description` VARCHAR(45) NULL COMMENT '工作简介',
  `contact` VARCHAR(45) NULL COMMENT '联系人名',
  `contact_phone` VARCHAR(45) NULL COMMENT '联系人手机号',
  `contact_email` VARCHAR(45) NULL COMMENT '联系�' /* comment truncated */ /*�mail
*/,
  `contact_qq` VARCHAR(45) NULL,
  `job_detail` VARCHAR(45) NULL COMMENT '工作详细描述',
  `introduce` TEXT NULL COMMENT '商家介绍',
  `likes` INT NULL DEFAULT 0,
  `dislikes` INT NULL DEFAULT 0,
  `job_post_category_id` INT NULL,
  `member_id` INT NULL,
  `education_level` VARCHAR(45) NULL COMMENT '学历要求信息',
  `complaint` INT NULL DEFAULT 0,
  `work_time` VARCHAR(128) NULL COMMENT '工作时间',
  `salary_unit` VARCHAR(45) NULL COMMENT '工资单位：天、周、月',
  `page_view` INT NULL DEFAULT 0,
  `verified` VARCHAR(45) NULL,
  `job_postcol` VARCHAR(45) NULL,
  `application_resume_ids` TEXT NULL COMMENT '收到的简历id',
  `applicant_amount` INT NULL DEFAULT 0 COMMENT '申请者数量',
  `deleted` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_job_post_job_post_category1_idx` (`job_post_category_id` ASC),
  INDEX `fk_job_post_member1_idx` (`member_id` ASC),
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
CREATE TABLE IF NOT EXISTS `taolijie`.`resume` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `gender` VARCHAR(10) NULL,
  `age` INT NULL,
  `height` INT NULL,
  `photo_path` VARCHAR(256) NULL COMMENT '用户头像图片路径',
  `email` VARCHAR(45) NULL,
  `qq` VARCHAR(45) NULL,
  `experience` TEXT NULL,
  `introduce` TEXT NULL COMMENT '自我介绍',
  `member_id` INT NULL,
  `access_authority` VARCHAR(45) NULL COMMENT '访问权限: ME_ONLY, ALL',
  `page_view` INT NULL DEFAULT 0 COMMENT '访问量',
  `verified` VARCHAR(45) NULL COMMENT '审核状态',
  `photo_id` INT NULL,
  `phone_number` VARCHAR(45) NULL,
  `wechat_account` VARCHAR(45) NULL,
  `created_time` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Resume_User1_idx` (`member_id` ASC),
  CONSTRAINT `fk_Resume_User1`
    FOREIGN KEY (`member_id`)
    REFERENCES `taolijie`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taolijie`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taolijie`.`review` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NULL,
  `post_id` INT NULL,
  `member_id` INT NULL,
  `time` DATE NULL,
  `replied_review_id` INT NULL COMMENT '此field有值表示这是一条评论回复',
  PRIMARY KEY (`id`),
  INDEX `fk_Review_Info1_idx` (`post_id` ASC),
  INDEX `fk_Review_User1_idx` (`member_id` ASC),
  INDEX `fk_review_review1_idx` (`replied_review_id` ASC),
  CONSTRAINT `fk_Review_Info1`
    FOREIGN KEY (`post_id`)
    REFERENCES `taolijie`.`job_post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
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
CREATE TABLE IF NOT EXISTS `taolijie`.`school` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `short_name` VARCHAR(20) NULL,
  `full_name` VARCHAR(128) NULL,
  `province` VARCHAR(45) NULL COMMENT '大学所在省份',
  `type` VARCHAR(45) NULL COMMENT 'e.g., HIGH_SCHOOL, UNDERGRADUATE, INSTITUTE(专科)',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taolijie`.`academy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taolijie`.`academy` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `short_name` VARCHAR(20) NULL,
  `full_name` VARCHAR(128) NULL,
  `college_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_School_College1_idx` (`college_id` ASC),
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
CREATE TABLE IF NOT EXISTS `taolijie`.`banner_pic` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `picture_path` VARCHAR(45) NULL,
  `time` DATE NULL,
  `picture_id` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taolijie`.`second_hand_post_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taolijie`.`second_hand_post_category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `memo` TEXT NULL,
  `level` INT NULL,
  `theme_color` VARCHAR(45) NULL COMMENT '#FFAABB值',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = '二手信息帖子分类';


-- -----------------------------------------------------
-- Table `taolijie`.`second_hand_post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taolijie`.`second_hand_post` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `expired_time` DATE NULL COMMENT '过期时间',
  `post_time` DATE NULL,
  `depreciation_rate` VARCHAR(10) NULL COMMENT '9成�' /* comment truncated */ /*95成
*/,
  `original_price` DECIMAL(6,1) NULL COMMENT '原价格',
  `sell_price` DECIMAL(6,1) NULL COMMENT '现价',
  `picture_path` TEXT NULL COMMENT '物品图片路径，以;分号分隔。如: /home/a.jpg;/home/b.jpg',
  `description` TEXT NULL COMMENT '物品描述',
  `likes` INT NULL DEFAULT 0,
  `dislikes` INT NULL DEFAULT 0,
  `member_id` INT NULL,
  `second_hand_post_category_id` INT NULL,
  `complaint` INT NULL DEFAULT 0,
  `page_view` INT NULL DEFAULT 0,
  `verified` VARCHAR(45) NULL,
  `trade_place` VARCHAR(45) NULL,
  `deleted` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_second_hand_post_member1_idx` (`member_id` ASC),
  INDEX `fk_second_hand_post_second_hand_post_category1_idx` (`second_hand_post_category_id` ASC),
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
CREATE TABLE IF NOT EXISTS `taolijie`.`private_notification` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `member_id` INT NULL,
  `title` VARCHAR(45) NULL,
  `content` TEXT NULL,
  `is_read` TINYINT(1) NULL DEFAULT 0,
  `time` DATE NULL,
  `access_range` VARCHAR(45) NULL COMMENT 'GLOBAL, (与role_type相同)',
  `to_member_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_notification_member1_idx` (`member_id` ASC),
  CONSTRAINT `fk_notification_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `taolijie`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taolijie`.`job_post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taolijie`.`job_post` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `expired_time` DATE NULL,
  `post_time` DATE NULL,
  `work_place` VARCHAR(45) NULL,
  `wage` DECIMAL(6,1) NULL,
  `time_to_pay` VARCHAR(45) NULL COMMENT '结算方式',
  `job_description` VARCHAR(45) NULL COMMENT '工作简介',
  `contact` VARCHAR(45) NULL COMMENT '联系人名',
  `contact_phone` VARCHAR(45) NULL COMMENT '联系人手机号',
  `contact_email` VARCHAR(45) NULL COMMENT '联系�' /* comment truncated */ /*�mail
*/,
  `contact_qq` VARCHAR(45) NULL,
  `job_detail` VARCHAR(45) NULL COMMENT '工作详细描述',
  `introduce` TEXT NULL COMMENT '商家介绍',
  `likes` INT NULL DEFAULT 0,
  `dislikes` INT NULL DEFAULT 0,
  `job_post_category_id` INT NULL,
  `member_id` INT NULL,
  `education_level` VARCHAR(45) NULL COMMENT '学历要求信息',
  `complaint` INT NULL DEFAULT 0,
  `work_time` VARCHAR(128) NULL COMMENT '工作时间',
  `salary_unit` VARCHAR(45) NULL COMMENT '工资单位：天、周、月',
  `page_view` INT NULL DEFAULT 0,
  `verified` VARCHAR(45) NULL,
  `job_postcol` VARCHAR(45) NULL,
  `application_resume_ids` TEXT NULL COMMENT '收到的简历id',
  `applicant_amount` INT NULL DEFAULT 0 COMMENT '申请者数量',
  `deleted` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_job_post_job_post_category1_idx` (`job_post_category_id` ASC),
  INDEX `fk_job_post_member1_idx` (`member_id` ASC),
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
CREATE TABLE IF NOT EXISTS `taolijie`.`news` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `content` TEXT NULL,
  `picture_path` TEXT NULL COMMENT '文章引用的图片路径，以;分隔',
  `time` DATE NULL,
  `member_id` INT NULL,
  `head_picture_path` VARCHAR(256) NULL COMMENT '文章标题旁边显示的图片',
  PRIMARY KEY (`id`),
  INDEX `fk_news_member1_idx` (`member_id` ASC),
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
CREATE TABLE IF NOT EXISTS `taolijie`.`education_experience` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `member_id` INT NULL,
  `admission_time` DATE NULL COMMENT '入学时间',
  `length_of_schooling` INT NULL COMMENT '学制(年)',
  `major` VARCHAR(45) NULL COMMENT '专业',
  `academy_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_education_experience_member1_idx` (`member_id` ASC),
  INDEX `fk_education_experience_academy1_idx` (`academy_id` ASC),
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
CREATE TABLE IF NOT EXISTS `taolijie`.`member_role` (
  `member_id` INT NULL,
  `role_rid` INT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  INDEX `fk_member_has_role_role1_idx` (`role_rid` ASC),
  INDEX `fk_member_has_role_member1_idx` (`member_id` ASC),
  PRIMARY KEY (`id`),
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
CREATE TABLE IF NOT EXISTS `taolijie`.`image_resource` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `file_name` VARCHAR(256) NULL,
  `extension` VARCHAR(10) NULL COMMENT '.jpeg, .gif',
  `bin_data` MEDIUMBLOB NULL,
  `type` VARCHAR(45) NULL COMMENT '图片的作用. 如:身份证图片, 证件图片等',
  `member_id` INT NULL COMMENT '如果是用户上传的证件照, 则这里为用户表的id',
  `job_post_id` INT NULL,
  `sh_post_id` INT NULL,
  `news_id` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taolijie`.`bulletin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taolijie`.`bulletin` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NULL,
  `created_time` DATE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = '系统公告';


-- -----------------------------------------------------
-- Table `taolijie`.`resume_job_post_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taolijie`.`resume_job_post_category` (
  `resume_id` INT NULL,
  `job_post_category_id` INT NULL,
  INDEX `fk_resume_has_job_post_category_job_post_category1_idx` (`job_post_category_id` ASC),
  INDEX `fk_resume_has_job_post_category_resume1_idx` (`resume_id` ASC),
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
CREATE TABLE IF NOT EXISTS `taolijie`.`taoli_ivy` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `content` TEXT NULL,
  `created_time` DATE NULL,
  `likes` INT NULL,
  `expired_time` DATE NULL COMMENT '过期时间',
  `taoli_ivy_category_id` INT NULL,
  `member_id` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = '桃李青藤';


-- -----------------------------------------------------
-- Table `taolijie`.`taoli_ivy_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taolijie`.`taoli_ivy_category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `memo` TEXT NULL,
  `level` INT NULL,
  `theme_color` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = '桃李青藤分类表';


-- -----------------------------------------------------
-- Table `taolijie`.`school_organization`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taolijie`.`school_organization` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `description` VARCHAR(100) NULL COMMENT '简介',
  `member_names` TEXT NULL COMMENT '成员列表',
  `slogan` VARCHAR(100) NULL COMMENT '口号',
  `bulletin` TEXT NULL COMMENT '公告',
  `location` VARCHAR(45) NULL COMMENT '地点',
  `qq` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `wechat` VARCHAR(45) NULL,
  `member_id` INT NULL,
  `school_organization_category_id` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = '校内组织';


-- -----------------------------------------------------
-- Table `taolijie`.`school_activity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taolijie`.`school_activity` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `member_id` INT NULL COMMENT '如果是个人发布的, 该字段存放用户id',
  `school_organization_id` INT NULL,
  `title` VARCHAR(45) NULL,
  `content` TEXT NULL,
  `created_time` DATE NULL,
  `expired_time` DATE NULL,
  `likes` INT NULL,
  `school_activity_category_id` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = '校园活动';


-- -----------------------------------------------------
-- Table `taolijie`.`ivy_activity_image_resource`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taolijie`.`ivy_activity_image_resource` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `file_name` VARCHAR(256) NULL,
  `extension` VARCHAR(10) NULL,
  `bin_data` MEDIUMBLOB NULL,
  `ivy_id` INT NULL,
  `activity_id` INT NULL,
  `type` VARCHAR(45) NULL COMMENT 'MAIN: 主要图片',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = '桃李青藤, 校园活动中使用到的图片信息';


-- -----------------------------------------------------
-- Table `taolijie`.`member_verification_rel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taolijie`.`member_verification_rel` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `member_id` INT NULL,
  `image_id` INT NULL,
  `image_type` VARCHAR(45) NULL COMMENT 'ID_FRONT, ID_BACK, ORG_FRONT, ORG_BACK, STU_ID_FRONT, STU_ID_BACK',
  `created_time` DATE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = '与image_resource表关联, 保存用户上传的证件照片';


-- -----------------------------------------------------
-- Table `taolijie`.`school_organization_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taolijie`.`school_organization_category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `memo` TEXT NULL,
  `level` INT NULL,
  `theme_color` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = '校园组织分类表';


-- -----------------------------------------------------
-- Table `taolijie`.`participant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taolijie`.`participant` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `member_id` INT NULL,
  `ivy_id` INT NULL,
  `activity_id` INT NULL,
  `name` VARCHAR(45) NULL,
  `academy` VARCHAR(45) NULL COMMENT '学院',
  `className` VARCHAR(45) NULL COMMENT '班级',
  `qq` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `weichat` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `gender` VARCHAR(10) NULL,
  `created_time` DATE NULL COMMENT '报名时间',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = '\"想去\"功能对应的数据表';


-- -----------------------------------------------------
-- Table `taolijie`.`credits_level`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taolijie`.`credits_level` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `min_credits` INT NULL,
  `max_credits` INT NULL,
  `name` VARCHAR(45) NULL,
  `memo` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = '积分阶梯';


-- -----------------------------------------------------
-- Table `taolijie`.`school_activity_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taolijie`.`school_activity_category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `memo` TEXT NULL,
  `level` INT NULL,
  `theme_color` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taolijie`.`resume_post_rel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taolijie`.`resume_post_rel` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `resume_id` INT NOT NULL,
  `job_post_id` INT NOT NULL,
  `created_time` DATE NULL COMMENT '投递时间',
  `member_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_resume_post_rel_resume1_idx` (`resume_id` ASC),
  INDEX `fk_resume_post_rel_job_post1_idx` (`job_post_id` ASC),
  INDEX `fk_resume_post_rel_member1_idx` (`member_id` ASC),
  CONSTRAINT `fk_resume_post_rel_resume1`
    FOREIGN KEY (`resume_id`)
    REFERENCES `taolijie`.`resume` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resume_post_rel_job_post1`
    FOREIGN KEY (`job_post_id`)
    REFERENCES `taolijie`.`job_post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resume_post_rel_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `taolijie`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '简历投递表';


-- -----------------------------------------------------
-- Table `taolijie`.`system_notification`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taolijie`.`system_notification` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `content` TEXT NULL,
  `is_read` TINYINT(1) NULL DEFAULT 0,
  `time` DATE NULL,
  `access_range` VARCHAR(45) NULL COMMENT 'GLOBAL, (与role_type相同)',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema VideoGameInformation
-- -----------------------------------------------------
DROP DATABASE IF EXISTS VideoGameInformation;

CREATE DATABASE IF NOT EXISTS VideoGameInformation;

USE VideoGameInformation;
-- -----------------------------------------------------
-- Table `publisher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `publisher` ;

CREATE TABLE IF NOT EXISTS `publisher` (
  `publisher_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`publisher_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `game`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `game` ;

CREATE TABLE IF NOT EXISTS `game` (
  `game_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  `release_date` DATE NOT NULL,
  `description` TEXT(10000) NOT NULL,
  `crossplay` VARCHAR(45) BINARY NULL,
  `publisher_publisher_id` INT NOT NULL,
  PRIMARY KEY (`game_id`),
  INDEX `fk_game_publisher1_idx` (`publisher_publisher_id` ASC) VISIBLE,
  CONSTRAINT `fk_game_publisher1`
    FOREIGN KEY (`publisher_publisher_id`)
    REFERENCES `publisher` (`publisher_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gamePlatform`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gamePlatform` ;

CREATE TABLE IF NOT EXISTS `gamePlatform` (
  `platform_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `company` VARCHAR(45) NULL,
  PRIMARY KEY (`platform_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gameRegion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gameRegion` ;

CREATE TABLE IF NOT EXISTS `gameRegion` (
  `game_region_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `region_code` VARCHAR(6) NOT NULL,
  PRIMARY KEY (`game_region_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `developer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `developer` ;

CREATE TABLE IF NOT EXISTS `developer` (
  `developer_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `director` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`developer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `genre` ;

CREATE TABLE IF NOT EXISTS `genre` (
  `genre_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`genre_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `franchise`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `franchise` ;

CREATE TABLE IF NOT EXISTS `franchise` (
  `franchise_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`franchise_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supportedLanguage`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `supportedLanguage` ;

CREATE TABLE IF NOT EXISTS `supportedLanguage` (
  `supported_language_id` INT NOT NULL,
  `language` VARCHAR(45) NOT NULL,
  `interface` TINYINT(1) NOT NULL,
  `audio` TINYINT(1) NOT NULL,
  `subtitiles` TINYINT(1) NOT NULL,
  PRIMARY KEY (`supported_language_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `game_has_gamePlatform`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `game_has_gamePlatform` ;

CREATE TABLE IF NOT EXISTS `game_has_gamePlatform` (
  `game_game_id` INT NOT NULL,
  `gamePlatform_platform_id` INT NOT NULL,
  PRIMARY KEY (`game_game_id`, `gamePlatform_platform_id`),
  INDEX `fk_game_has_gamePlatform_gamePlatform1_idx` (`gamePlatform_platform_id` ASC) VISIBLE,
  INDEX `fk_game_has_gamePlatform_game1_idx` (`game_game_id` ASC) VISIBLE,
  CONSTRAINT `fk_game_has_gamePlatform_game1`
    FOREIGN KEY (`game_game_id`)
    REFERENCES `game` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_has_gamePlatform_gamePlatform1`
    FOREIGN KEY (`gamePlatform_platform_id`)
    REFERENCES `gamePlatform` (`platform_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `game_has_gameRegion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `game_has_gameRegion` ;

CREATE TABLE IF NOT EXISTS `game_has_gameRegion` (
  `game_game_id` INT NOT NULL,
  `gameRegion_game_region_id` INT NOT NULL,
  PRIMARY KEY (`game_game_id`, `gameRegion_game_region_id`),
  INDEX `fk_game_has_gameRegion_gameRegion1_idx` (`gameRegion_game_region_id` ASC) VISIBLE,
  INDEX `fk_game_has_gameRegion_game1_idx` (`game_game_id` ASC) VISIBLE,
  CONSTRAINT `fk_game_has_gameRegion_game1`
    FOREIGN KEY (`game_game_id`)
    REFERENCES `game` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_has_gameRegion_gameRegion1`
    FOREIGN KEY (`gameRegion_game_region_id`)
    REFERENCES `gameRegion` (`game_region_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `game_has_developer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `game_has_developer` ;

CREATE TABLE IF NOT EXISTS `game_has_developer` (
  `game_game_id` INT NOT NULL,
  `developer_developer_id` INT NOT NULL,
  PRIMARY KEY (`game_game_id`, `developer_developer_id`),
  INDEX `fk_game_has_developer_developer1_idx` (`developer_developer_id` ASC) VISIBLE,
  INDEX `fk_game_has_developer_game1_idx` (`game_game_id` ASC) VISIBLE,
  CONSTRAINT `fk_game_has_developer_game1`
    FOREIGN KEY (`game_game_id`)
    REFERENCES `game` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_has_developer_developer1`
    FOREIGN KEY (`developer_developer_id`)
    REFERENCES `developer` (`developer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `game_has_genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `game_has_genre` ;

CREATE TABLE IF NOT EXISTS `game_has_genre` (
  `game_game_id` INT NOT NULL,
  `genre_genre_id` INT NOT NULL,
  PRIMARY KEY (`game_game_id`, `genre_genre_id`),
  INDEX `fk_game_has_genre_genre1_idx` (`genre_genre_id` ASC) VISIBLE,
  INDEX `fk_game_has_genre_game1_idx` (`game_game_id` ASC) VISIBLE,
  CONSTRAINT `fk_game_has_genre_game1`
    FOREIGN KEY (`game_game_id`)
    REFERENCES `game` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_has_genre_genre1`
    FOREIGN KEY (`genre_genre_id`)
    REFERENCES `genre` (`genre_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `game_has_franchise`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `game_has_franchise` ;

CREATE TABLE IF NOT EXISTS `game_has_franchise` (
  `game_game_id` INT NOT NULL,
  `franchise_franchise_id` INT NOT NULL,
  PRIMARY KEY (`game_game_id`, `franchise_franchise_id`),
  INDEX `fk_game_has_franchise_franchise1_idx` (`franchise_franchise_id` ASC) VISIBLE,
  INDEX `fk_game_has_franchise_game1_idx` (`game_game_id` ASC) VISIBLE,
  CONSTRAINT `fk_game_has_franchise_game1`
    FOREIGN KEY (`game_game_id`)
    REFERENCES `game` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_has_franchise_franchise1`
    FOREIGN KEY (`franchise_franchise_id`)
    REFERENCES `franchise` (`franchise_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `game_has_supportedLanguage`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `game_has_supportedLanguage` ;

CREATE TABLE IF NOT EXISTS `game_has_supportedLanguage` (
  `game_game_id` INT NOT NULL,
  `supportedLanguage_supported_language_id` INT NOT NULL,
  PRIMARY KEY (`game_game_id`, `supportedLanguage_supported_language_id`),
  INDEX `fk_game_has_supportedLanguage_supportedLanguage1_idx` (`supportedLanguage_supported_language_id` ASC) VISIBLE,
  INDEX `fk_game_has_supportedLanguage_game1_idx` (`game_game_id` ASC) VISIBLE,
  CONSTRAINT `fk_game_has_supportedLanguage_game1`
    FOREIGN KEY (`game_game_id`)
    REFERENCES `game` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_has_supportedLanguage_supportedLanguage1`
    FOREIGN KEY (`supportedLanguage_supported_language_id`)
    REFERENCES `supportedLanguage` (`supported_language_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `awards`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `awards` ;

CREATE TABLE IF NOT EXISTS `awards` (
  `awards_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `date` DATE NULL,
  PRIMARY KEY (`awards_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `game_has_awards`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `game_has_awards` ;

CREATE TABLE IF NOT EXISTS `game_has_awards` (
  `game_game_id` INT NOT NULL,
  `awards_awards_id` INT NOT NULL,
  PRIMARY KEY (`game_game_id`, `awards_awards_id`),
  INDEX `fk_game_has_awards_awards1_idx` (`awards_awards_id` ASC) VISIBLE,
  INDEX `fk_game_has_awards_game1_idx` (`game_game_id` ASC) VISIBLE,
  CONSTRAINT `fk_game_has_awards_game1`
    FOREIGN KEY (`game_game_id`)
    REFERENCES `game` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_has_awards_awards1`
    FOREIGN KEY (`awards_awards_id`)
    REFERENCES `awards` (`awards_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `awardNominations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `awardNominations` ;

CREATE TABLE IF NOT EXISTS `awardNominations` (
  `awardNominations_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `date` DATE NULL,
  PRIMARY KEY (`awardNominations_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `game_has_awardNominations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `game_has_awardNominations` ;

CREATE TABLE IF NOT EXISTS `game_has_awardNominations` (
  `game_game_id` INT NOT NULL,
  `awardNominations_awardNominations_id` INT NOT NULL,
  PRIMARY KEY (`game_game_id`, `awardNominations_awardNominations_id`),
  INDEX `fk_game_has_awardNominations_awardNominations1_idx` (`awardNominations_awardNominations_id` ASC) VISIBLE,
  INDEX `fk_game_has_awardNominations_game1_idx` (`game_game_id` ASC) VISIBLE,
  CONSTRAINT `fk_game_has_awardNominations_game1`
    FOREIGN KEY (`game_game_id`)
    REFERENCES `game` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_has_awardNominations_awardNominations1`
    FOREIGN KEY (`awardNominations_awardNominations_id`)
    REFERENCES `awardNominations` (`awardNominations_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `composer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `composer` ;

CREATE TABLE IF NOT EXISTS `composer` (
  `composer_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`composer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `game_has_composer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `game_has_composer` ;

CREATE TABLE IF NOT EXISTS `game_has_composer` (
  `game_game_id` INT NOT NULL,
  `composer_composer_id` INT NOT NULL,
  PRIMARY KEY (`game_game_id`, `composer_composer_id`),
  INDEX `fk_game_has_composer_composer1_idx` (`composer_composer_id` ASC) VISIBLE,
  INDEX `fk_game_has_composer_game1_idx` (`game_game_id` ASC) VISIBLE,
  CONSTRAINT `fk_game_has_composer_game1`
    FOREIGN KEY (`game_game_id`)
    REFERENCES `game` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_has_composer_composer1`
    FOREIGN KEY (`composer_composer_id`)
    REFERENCES `composer` (`composer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `investor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `investor` ;

CREATE TABLE IF NOT EXISTS `investor` (
  `investor_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`investor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `publisher_has_investor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `publisher_has_investor` ;

CREATE TABLE IF NOT EXISTS `publisher_has_investor` (
  `publisher_publisher_id` INT NOT NULL,
  `investor_investor_id` INT NOT NULL,
  INDEX `fk_publisher_has_investor_investor1_idx` (`investor_investor_id` ASC) VISIBLE,
  INDEX `fk_publisher_has_investor_publisher1_idx` (`publisher_publisher_id` ASC) VISIBLE,
  CONSTRAINT `fk_publisher_has_investor_publisher1`
    FOREIGN KEY (`publisher_publisher_id`)
    REFERENCES `publisher` (`publisher_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_publisher_has_investor_investor1`
    FOREIGN KEY (`investor_investor_id`)
    REFERENCES `investor` (`investor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ESRB`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ESRB` ;

CREATE TABLE IF NOT EXISTS `ESRB` (
  `ESRB_id` INT NOT NULL,
  `ESRB_rating` VARCHAR(45) NULL,
  `reasons` TEXT NULL,
  `game_game_id` INT NOT NULL,
  `game_publisher_publisher_id` INT NOT NULL,
  PRIMARY KEY (`ESRB_id`, `game_game_id`, `game_publisher_publisher_id`),
  INDEX `fk_ESRB_game1_idx` (`game_game_id` ASC, `game_publisher_publisher_id` ASC) VISIBLE,
  CONSTRAINT `fk_ESRB_game1`
    FOREIGN KEY (`game_game_id`)
    REFERENCES `game` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `systemRequirements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `systemRequirements` ;

CREATE TABLE IF NOT EXISTS `systemRequirements` (
  `systemRequirements_id` INT NOT NULL,
  `os` VARCHAR(45) NOT NULL,
  `processor` VARCHAR(45) NOT NULL,
  `memory` VARCHAR(45) NOT NULL,
  `disk_space` VARCHAR(45) NOT NULL,
  `graphics_card` VARCHAR(45) NOT NULL,
  `sound_card` VARCHAR(45) NULL,
  `game_game_id` INT NOT NULL,
  `game_publisher_publisher_id` INT NOT NULL,
  PRIMARY KEY (`systemRequirements_id`, `game_game_id`, `game_publisher_publisher_id`),
  INDEX `fk_systemRequirements_game1_idx` (`game_game_id` ASC, `game_publisher_publisher_id` ASC) VISIBLE,
  CONSTRAINT `fk_systemRequirements_game1`
    FOREIGN KEY (`game_game_id`)
    REFERENCES `game` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `content`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `content` ;

CREATE TABLE IF NOT EXISTS `content` (
  `content_id` INT NOT NULL,
  `date` DATE NOT NULL,
  `game_game_id` INT NOT NULL,
  `game_publisher_publisher_id` INT NOT NULL,
  PRIMARY KEY (`content_id`, `game_game_id`, `game_publisher_publisher_id`),
  INDEX `fk_content_game1_idx` (`game_game_id` ASC, `game_publisher_publisher_id` ASC) VISIBLE,
  CONSTRAINT `fk_content_game1`
    FOREIGN KEY (`game_game_id`)
    REFERENCES `game` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `photo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `photo` ;

CREATE TABLE IF NOT EXISTS `photo` (
  `photo_id` INT NOT NULL,
  `date` DATE NOT NULL,
  `data` BLOB NOT NULL,
  `content_content_id` INT NOT NULL,
  `content_game_game_id` INT NOT NULL,
  `content_game_publisher_publisher_id` INT NOT NULL,
  PRIMARY KEY (`photo_id`, `content_content_id`, `content_game_game_id`, `content_game_publisher_publisher_id`),
  INDEX `fk_photo_content1_idx` (`content_content_id` ASC, `content_game_game_id` ASC, `content_game_publisher_publisher_id` ASC) VISIBLE,
  CONSTRAINT `fk_photo_content1`
    FOREIGN KEY (`content_content_id` , `content_game_game_id` , `content_game_publisher_publisher_id`)
    REFERENCES `content` (`content_id` , `game_game_id` , `game_publisher_publisher_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `video`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `video` ;

CREATE TABLE IF NOT EXISTS `video` (
  `video_id` INT NOT NULL,
  `date` DATE NOT NULL,
  `data` BLOB NOT NULL,
  `content_content_id` INT NOT NULL,
  `content_game_game_id` INT NOT NULL,
  `content_game_publisher_publisher_id` INT NOT NULL,
  PRIMARY KEY (`video_id`, `content_content_id`, `content_game_game_id`, `content_game_publisher_publisher_id`),
  INDEX `fk_video_content1_idx` (`content_content_id` ASC, `content_game_game_id` ASC, `content_game_publisher_publisher_id` ASC) VISIBLE,
  CONSTRAINT `fk_video_content1`
    FOREIGN KEY (`content_content_id` , `content_game_game_id` , `content_game_publisher_publisher_id`)
    REFERENCES `content` (`content_id` , `game_game_id` , `game_publisher_publisher_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `updateLog`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `updateLog` ;

CREATE TABLE IF NOT EXISTS `updateLog` (
  `updateLog_id` INT NOT NULL,
  `num_entries` VARCHAR(45) NOT NULL,
  `game_game_id` INT NOT NULL,
  `game_publisher_publisher_id` INT NOT NULL,
  PRIMARY KEY (`updateLog_id`, `game_game_id`, `game_publisher_publisher_id`),
  INDEX `fk_updateLog_game1_idx` (`game_game_id` ASC, `game_publisher_publisher_id` ASC) VISIBLE,
  CONSTRAINT `fk_updateLog_game1`
    FOREIGN KEY (`game_game_id`)
    REFERENCES `game` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `updateEntry`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `updateEntry` ;

CREATE TABLE IF NOT EXISTS `updateEntry` (
  `updateEntry_id` INT NOT NULL,
  `description` TEXT NOT NULL,
  `updateLog_updateLog_id` INT NOT NULL,
  `updateLog_game_game_id` INT NOT NULL,
  `updateLog_game_publisher_publisher_id` INT NOT NULL,
  PRIMARY KEY (`updateEntry_id`, `updateLog_updateLog_id`, `updateLog_game_game_id`, `updateLog_game_publisher_publisher_id`),
  INDEX `fk_updateEntry_updateLog1_idx` (`updateLog_updateLog_id` ASC, `updateLog_game_game_id` ASC, `updateLog_game_publisher_publisher_id` ASC) VISIBLE,
  CONSTRAINT `fk_updateEntry_updateLog1`
    FOREIGN KEY (`updateLog_updateLog_id` , `updateLog_game_game_id` , `updateLog_game_publisher_publisher_id`)
    REFERENCES `updateLog` (`updateLog_id` , `game_game_id` , `game_publisher_publisher_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reviewPlatform`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `reviewPlatform` ;

CREATE TABLE IF NOT EXISTS `reviewPlatform` (
  `reviewPlatform_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`reviewPlatform_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `site`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `site` ;

CREATE TABLE IF NOT EXISTS `site` (
  `site_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`site_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `review` ;

CREATE TABLE IF NOT EXISTS `review` (
  `review_id` INT NOT NULL,
  `date` VARCHAR(45) NOT NULL,
  `rating` VARCHAR(45) NOT NULL,
  `description` TEXT NOT NULL,
  `game_game_id` INT NOT NULL,
  `reviewPlatform_reviewPlatform_id` INT NOT NULL,
  `site_site_id` INT NOT NULL,
  PRIMARY KEY (`review_id`, `game_game_id`, `reviewPlatform_reviewPlatform_id`, `site_site_id`),
  INDEX `fk_review_game1_idx` (`game_game_id` ASC) VISIBLE,
  INDEX `fk_review_reviewPlatform1_idx` (`reviewPlatform_reviewPlatform_id` ASC) VISIBLE,
  INDEX `fk_review_site1_idx` (`site_site_id` ASC) VISIBLE,
  CONSTRAINT `fk_review_game1`
    FOREIGN KEY (`game_game_id`)
    REFERENCES `game` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_reviewPlatform1`
    FOREIGN KEY (`reviewPlatform_reviewPlatform_id`)
    REFERENCES `reviewPlatform` (`reviewPlatform_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_site1`
    FOREIGN KEY (`site_site_id`)
    REFERENCES `site` (`site_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `userRegion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `userRegion` ;

CREATE TABLE IF NOT EXISTS `userRegion` (
  `userRegion_id` INT NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`userRegion_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdn`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdn` ;

CREATE TABLE IF NOT EXISTS `cdn` (
  `cdn_id` INT NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `num_copies` VARCHAR(45) NOT NULL,
  `userRegion_userRegion_id` INT NOT NULL,
  PRIMARY KEY (`cdn_id`),
  INDEX `fk_cdn_userRegion1_idx` (`userRegion_userRegion_id` ASC) VISIBLE,
  CONSTRAINT `fk_cdn_userRegion1`
    FOREIGN KEY (`userRegion_userRegion_id`)
    REFERENCES `userRegion` (`userRegion_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdn_has_game`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdn_has_game` ;

CREATE TABLE IF NOT EXISTS `cdn_has_game` (
  `cdn_cdn_id` INT NOT NULL,
  `game_game_id` INT NOT NULL,
  PRIMARY KEY (`cdn_cdn_id`, `game_game_id`),
  INDEX `fk_cdn_has_game_game1_idx` (`game_game_id` ASC) VISIBLE,
  INDEX `fk_cdn_has_game_cdn1_idx` (`cdn_cdn_id` ASC) VISIBLE,
  CONSTRAINT `fk_cdn_has_game_cdn1`
    FOREIGN KEY (`cdn_cdn_id`)
    REFERENCES `cdn` (`cdn_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cdn_has_game_game1`
    FOREIGN KEY (`game_game_id`)
    REFERENCES `game` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `generalUser`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `generalUser` ;

CREATE TABLE IF NOT EXISTS `generalUser` (
  `generalUser_id` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`generalUser_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `account` ;

CREATE TABLE IF NOT EXISTS `account` (
  `account_id` INT NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `created` DATETIME NOT NULL,
  `userRegion_userRegion_id` INT NOT NULL,
  `generalUser_generalUser_id` INT NOT NULL,
  PRIMARY KEY (`account_id`),
  INDEX `fk_account_userRegion1_idx` (`userRegion_userRegion_id` ASC) VISIBLE,
  INDEX `fk_account_generalUser1_idx` (`generalUser_generalUser_id` ASC) VISIBLE,
  CONSTRAINT `fk_account_userRegion1`
    FOREIGN KEY (`userRegion_userRegion_id`)
    REFERENCES `userRegion` (`userRegion_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_account_generalUser1`
    FOREIGN KEY (`generalUser_generalUser_id`)
    REFERENCES `generalUser` (`generalUser_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `admin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `admin` ;

CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` INT NOT NULL,
  `generalUser_generalUser_id` INT NOT NULL,
  PRIMARY KEY (`admin_id`),
  INDEX `fk_admin_generalUser1_idx` (`generalUser_generalUser_id` ASC) VISIBLE,
  CONSTRAINT `fk_admin_generalUser1`
    FOREIGN KEY (`generalUser_generalUser_id`)
    REFERENCES `generalUser` (`generalUser_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `registeredUser`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `registeredUser` ;

CREATE TABLE IF NOT EXISTS `registeredUser` (
  `registeredUser_id` INT NOT NULL,
  `generalUser_generalUser_id` INT NOT NULL,
  PRIMARY KEY (`registeredUser_id`),
  INDEX `fk_registeredUser_generalUser1_idx` (`generalUser_generalUser_id` ASC) VISIBLE,
  CONSTRAINT `fk_registeredUser_generalUser1`
    FOREIGN KEY (`generalUser_generalUser_id`)
    REFERENCES `generalUser` (`generalUser_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `account_has_admin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `account_has_admin` ;

CREATE TABLE IF NOT EXISTS `account_has_admin` (
  `account_account_id` INT NOT NULL,
  `admin_admin_id` INT NOT NULL,
  PRIMARY KEY (`account_account_id`, `admin_admin_id`),
  INDEX `fk_account_has_admin1_admin1_idx` (`admin_admin_id` ASC) VISIBLE,
  INDEX `fk_account_has_admin1_account1_idx` (`account_account_id` ASC) VISIBLE,
  CONSTRAINT `fk_account_has_admin1_account1`
    FOREIGN KEY (`account_account_id`)
    REFERENCES `account` (`account_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_account_has_admin1_admin1`
    FOREIGN KEY (`admin_admin_id`)
    REFERENCES `admin` (`admin_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `account_has_registeredUser`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `account_has_registeredUser` ;

CREATE TABLE IF NOT EXISTS `account_has_registeredUser` (
  `account_account_id` INT NOT NULL,
  `registeredUser_registeredUser_id` INT NOT NULL,
  PRIMARY KEY (`account_account_id`, `registeredUser_registeredUser_id`),
  INDEX `fk_account_has_registeredUser_registeredUser1_idx` (`registeredUser_registeredUser_id` ASC) VISIBLE,
  INDEX `fk_account_has_registeredUser_account1_idx` (`account_account_id` ASC) VISIBLE,
  CONSTRAINT `fk_account_has_registeredUser_account1`
    FOREIGN KEY (`account_account_id`)
    REFERENCES `account` (`account_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_account_has_registeredUser_registeredUser1`
    FOREIGN KEY (`registeredUser_registeredUser_id`)
    REFERENCES `registeredUser` (`registeredUser_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `device`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `device` ;

CREATE TABLE IF NOT EXISTS `device` (
  `device_id` INT NOT NULL,
  `ip_address` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `time_connected` DATETIME NULL,
  `devicecol` VARCHAR(45) NULL,
  PRIMARY KEY (`device_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `registeredUser_has_device`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `registeredUser_has_device` ;

CREATE TABLE IF NOT EXISTS `registeredUser_has_device` (
  `device_device_id` INT NOT NULL,
  `registeredUser_registeredUser_id` INT NOT NULL,
  PRIMARY KEY (`device_device_id`, `registeredUser_registeredUser_id`),
  INDEX `fk_device_has_registeredUser_registeredUser1_idx` (`registeredUser_registeredUser_id` ASC) VISIBLE,
  INDEX `fk_device_has_registeredUser_device1_idx` (`device_device_id` ASC) VISIBLE,
  CONSTRAINT `fk_device_has_registeredUser_device1`
    FOREIGN KEY (`device_device_id`)
    REFERENCES `device` (`device_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_device_has_registeredUser_registeredUser1`
    FOREIGN KEY (`registeredUser_registeredUser_id`)
    REFERENCES `registeredUser` (`registeredUser_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `session`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `session` ;

CREATE TABLE IF NOT EXISTS `session` (
  `account_account_id` INT NOT NULL,
  `device_device_id` INT NOT NULL,
  PRIMARY KEY (`account_account_id`, `device_device_id`),
  INDEX `fk_account_has_device_device1_idx` (`device_device_id` ASC) VISIBLE,
  INDEX `fk_account_has_device_account1_idx` (`account_account_id` ASC) VISIBLE,
  CONSTRAINT `fk_account_has_device_account1`
    FOREIGN KEY (`account_account_id`)
    REFERENCES `account` (`account_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_account_has_device_device1`
    FOREIGN KEY (`device_device_id`)
    REFERENCES `device` (`device_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `action`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `action` ;

CREATE TABLE IF NOT EXISTS `action` (
  `action_id` INT NOT NULL,
  `role` TINYINT NULL,
  PRIMARY KEY (`action_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `admin_has_action`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `admin_has_action` ;

CREATE TABLE IF NOT EXISTS `admin_has_action` (
  `admin_admin_id` INT NOT NULL,
  `action_action_id` INT NOT NULL,
  PRIMARY KEY (`admin_admin_id`, `action_action_id`),
  INDEX `fk_admin_has_action_action1_idx` (`action_action_id` ASC) VISIBLE,
  INDEX `fk_admin_has_action_admin1_idx` (`admin_admin_id` ASC) VISIBLE,
  CONSTRAINT `fk_admin_has_action_admin1`
    FOREIGN KEY (`admin_admin_id`)
    REFERENCES `admin` (`admin_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_admin_has_action_action1`
    FOREIGN KEY (`action_action_id`)
    REFERENCES `action` (`action_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `registeredUser_has_action`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `registeredUser_has_action` ;

CREATE TABLE IF NOT EXISTS `registeredUser_has_action` (
  `registeredUser_registeredUser_id` INT NOT NULL,
  `action_action_id` INT NOT NULL,
  PRIMARY KEY (`registeredUser_registeredUser_id`, `action_action_id`),
  INDEX `fk_registeredUser_has_action_action1_idx` (`action_action_id` ASC) VISIBLE,
  INDEX `fk_registeredUser_has_action_registeredUser1_idx` (`registeredUser_registeredUser_id` ASC) VISIBLE,
  CONSTRAINT `fk_registeredUser_has_action_registeredUser1`
    FOREIGN KEY (`registeredUser_registeredUser_id`)
    REFERENCES `registeredUser` (`registeredUser_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_registeredUser_has_action_action1`
    FOREIGN KEY (`action_action_id`)
    REFERENCES `action` (`action_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `pixafy` ;
CREATE SCHEMA IF NOT EXISTS `pixafy` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `pixafy` ;

-- -----------------------------------------------------
-- Table `pixafy`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pixafy`.`users` ;

CREATE TABLE IF NOT EXISTS `pixafy`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NULL,
  `role` VARCHAR(45) NULL DEFAULT 'user',
  `photos_uploaded` INT NULL DEFAULT 0,
  `hash` VARCHAR(60) NULL,
  `salt` VARCHAR(29) NULL,
  `created` DATETIME NULL,
  `modified` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pixafy`.`photos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pixafy`.`photos` ;

CREATE TABLE IF NOT EXISTS `pixafy`.`photos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image_url` VARCHAR(45) NULL,
  `created` DATETIME NULL,
  `modified` DATETIME NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_photos_users_idx` (`user_id` ASC),
  CONSTRAINT `fk_photos_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `pixafy`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

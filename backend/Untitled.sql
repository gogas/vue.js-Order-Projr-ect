-- MySQL Script generated by MySQL Workbench
-- Thu Jun  8 23:08:09 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Confect
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Confect
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Confect` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
USE `Confect` ;

-- -----------------------------------------------------
-- Table `Confect`.`Store`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Confect`.`Store` ;

CREATE TABLE IF NOT EXISTS `Confect`.`Store` (
  `idIngr` INT NOT NULL AUTO_INCREMENT,
  `ingredient` VARCHAR(45) NULL,
  `quantity` FLOAT NULL,
  `unit` VARCHAR(45) NULL,
  `shelfLife` FLOAT NULL,
  PRIMARY KEY (`idIngr`),
  UNIQUE INDEX `idIngr_UNIQUE` (`idIngr` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Confect`.`Cakes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Confect`.`Cakes` ;

CREATE TABLE IF NOT EXISTS `Confect`.`Cakes` (
  `idCake` INT NOT NULL AUTO_INCREMENT,
  `namecake` VARCHAR(45) NULL,
  `price1kg` INT NULL,
  PRIMARY KEY (`idCake`),
  UNIQUE INDEX `idCake_UNIQUE` (`idCake` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Confect`.`Formula`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Confect`.`Formula` ;

CREATE TABLE IF NOT EXISTS `Confect`.`Formula` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idCake` INT NULL,
  `idIngr` INT NULL,
  `quantity` FLOAT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `3546`
    FOREIGN KEY (`idCake`)
    REFERENCES `Confect`.`Cakes` (`idCake`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `6687`
    FOREIGN KEY (`idIngr`)
    REFERENCES `Confect`.`Store` (`idIngr`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Confect`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Confect`.`Orders` ;

CREATE TABLE IF NOT EXISTS `Confect`.`Orders` (
  `idOrders` INT NOT NULL AUTO_INCREMENT,
  `Customer` VARCHAR(45) NULL,
  `idCake` INT NULL,
  `Weight` DOUBLE NULL,
  `Price` DOUBLE NULL,
  `Data` DATE NULL,
  `Comment` VARCHAR(100) NULL,
  `Phone` INT(10) NULL,
  PRIMARY KEY (`idOrders`),
  INDEX `1_idx` (`idCake` ASC),
  CONSTRAINT `1`
    FOREIGN KEY (`idCake`)
    REFERENCES `Confect`.`Cakes` (`idCake`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Confect`.`Bookkeeping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Confect`.`Bookkeeping` ;

CREATE TABLE IF NOT EXISTS `Confect`.`Bookkeeping` (
  `idBook` INT NOT NULL,
  `Cakes_idCake` INT NOT NULL,
  `Month` INT NULL,
  `PredictedValue` FLOAT NULL,
  `RealValue` FLOAT NULL,
  PRIMARY KEY (`idBook`),
  INDEX `fk_Bookkeeping_Cakes1_idx` (`Cakes_idCake` ASC),
  CONSTRAINT `fk_Bookkeeping_Cakes1`
    FOREIGN KEY (`Cakes_idCake`)
    REFERENCES `Confect`.`Cakes` (`idCake`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Confect`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Confect`.`user` ;

CREATE TABLE IF NOT EXISTS `Confect`.`user` (
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP);

USE `Confect` ;

-- -----------------------------------------------------
-- Placeholder table for view `Confect`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Confect`.`view1` (`id` INT);

-- -----------------------------------------------------
--  routine1
-- -----------------------------------------------------

USE `Confect`;
DROP  IF EXISTS `Confect`.`routine1`;

DELIMITER $$
USE `Confect`$$
$$

DELIMITER ;

-- -----------------------------------------------------
-- View `Confect`.`view1`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `Confect`.`view1` ;
DROP TABLE IF EXISTS `Confect`.`view1`;
USE `Confect`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

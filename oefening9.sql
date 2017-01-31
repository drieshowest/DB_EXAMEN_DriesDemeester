-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `idPatient` INT NOT NULL,
  `patient_name` VARCHAR(45) NULL,
  `patient_syndrome` VARCHAR(45) NULL,
  `patient_sex` ENUM('M', 'V') NULL,
  `patient_age_at_diagnose` INT NULL,
  PRIMARY KEY (`idPatient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`GeneMutation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`GeneMutation` (
  `idGene` INT NOT NULL,
  `gene_name` VARCHAR(45) NULL,
  `start` INT NULL,
  `end` INT NULL,
  `chromosome` INT NULL,
  `beschrijving` TEXT NULL,
  `idPatient` INT NOT NULL,
  PRIMARY KEY (`idGene`),
  INDEX `fk_GeneMutation_1_idx` (`idPatient` ASC),
  CONSTRAINT `fk_GeneMutation_1`
    FOREIGN KEY (`idPatient`)
    REFERENCES `mydb`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Syndroom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Syndroom` (
  `idSyndroom` INT NOT NULL,
  `syndroom_name` VARCHAR(45) NULL,
  `beschrijving` TEXT NULL,
  `idGene` INT NOT NULL,
  PRIMARY KEY (`idSyndroom`),
  INDEX `fk_Syndroom_1_idx` (`idGene` ASC),
  CONSTRAINT `fk_Syndroom_1`
    FOREIGN KEY (`idGene`)
    REFERENCES `mydb`.`GeneMutation` (`idGene`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


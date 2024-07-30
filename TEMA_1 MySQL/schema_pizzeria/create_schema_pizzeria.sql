-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8mb4 ;
USE `pizzeria` ;

-- -----------------------------------------------------
-- Table `pizzeria`.`botiga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`botiga` (
  `id_botiga` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `adreça` VARCHAR(45) NOT NULL,
  `CP` VARCHAR(45) NOT NULL,
  `localitat` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_botiga`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `pizzeria`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`categoria` (
  `id_categoria` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  INDEX `idx_nom` (`nom`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `pizzeria`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`client` (
  `id_client` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `cognom1` VARCHAR(45) NOT NULL,
  `cognom2` VARCHAR(45) NULL DEFAULT NULL,
  `adreça` VARCHAR(100) NOT NULL,
  `CP` VARCHAR(45) NOT NULL,
  `localitat` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  `telefon` VARCHAR(9) NOT NULL,
  `botiga_id` INT(11) NOT NULL,
  `botiga_id_botiga` INT(11) NOT NULL,
  PRIMARY KEY (`id_client`, `botiga_id_botiga`),
  INDEX `idx_nom` (`nom`),
  INDEX `id_botiga_idx` (`botiga_id`),
  INDEX `fk_client_botiga1_idx` (`botiga_id_botiga`),
  CONSTRAINT `fk_client_botiga1`
    FOREIGN KEY (`botiga_id_botiga`)
    REFERENCES `pizzeria`.`botiga` (`id_botiga`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `pizzeria`.`empleats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`empleats` (
  `id_empleat` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `cognom1` VARCHAR(45) NOT NULL,
  `cognom2` VARCHAR(45) NOT NULL,
  `NIF` VARCHAR(45) NOT NULL,
  `telf` VARCHAR(9) NOT NULL,
  `tipus` ENUM('cuiner', 'repartidor') NOT NULL,
  `botiga_id_botiga` INT(11) NOT NULL,
  PRIMARY KEY (`id_empleat`, `botiga_id_botiga`),
  INDEX `idx_nom` (`nom`),
  INDEX `idx_nif` (`NIF`),
  INDEX `fk_empleats_botiga1_idx` (`botiga_id_botiga`),
  CONSTRAINT `fk_empleats_botiga1`
    FOREIGN KEY (`botiga_id_botiga`)
    REFERENCES `pizzeria`.`botiga` (`id_botiga`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `pizzeria`.`comanda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`comanda` (
  `id_comanda` INT(11) NOT NULL AUTO_INCREMENT,
  `data_hora` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `tipus` ENUM('local', 'domicili') NOT NULL,
  `total` VARCHAR(45) NOT NULL,
  `preu_total` INT(11) NOT NULL,
  `botiga_id` INT(11) NOT NULL DEFAULT 1,
  `client_id` INT(11) NULL DEFAULT NULL,
  `empleat_id` INT(11) NULL DEFAULT NULL,
  `botiga_id_botiga` INT(11) NOT NULL,
  PRIMARY KEY (`id_comanda`, `botiga_id_botiga`),
  INDEX `id_empleat_idx` (`empleat_id`),
  INDEX `fk_comanda_botiga1_idx` (`botiga_id_botiga`),
  CONSTRAINT `id_client`
    FOREIGN KEY (`client_id`)
    REFERENCES `pizzeria`.`client` (`id_client`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `id_empleat`
    FOREIGN KEY (`empleat_id`)
    REFERENCES `pizzeria`.`empleats` (`id_empleat`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comanda_botiga1`
    FOREIGN KEY (`botiga_id_botiga`)
    REFERENCES `pizzeria`.`botiga` (`id_botiga`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `pizzeria`.`productes_comanda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`productes_comanda` (
  `comanda_id` INT(11) NOT NULL,
  `producte_id` INT(11) NOT NULL,
  `quantitat` INT(11) NOT NULL DEFAULT 1,
  `comanda_id_comanda` INT(11) NOT NULL,
  PRIMARY KEY (`comanda_id_comanda`),
  CONSTRAINT `fk_productes_comanda_comanda1`
    FOREIGN KEY (`comanda_id_comanda`)
    REFERENCES `pizzeria`.`comanda` (`id_comanda`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `pizzeria`.`productes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`productes` (
  `id_producte` INT(11) NOT NULL AUTO_INCREMENT,
  `tipus` ENUM('pizza', 'hamburguesa', 'beguda') NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `descripcio` VARCHAR(45) NOT NULL,
  `imatge` MEDIUMBLOB NULL DEFAULT NULL,
  `preu` DECIMAL(5,2) NOT NULL,
  `botiga_id` INT(11) NOT NULL,
  `categoria_id` INT(11) NOT NULL,
  `categoria_id_categoria` INT(11) NOT NULL,
  `botiga_id_botiga` INT(11) NOT NULL,
  `productes_comanda_comanda_id_comanda` INT(11) NOT NULL,
  PRIMARY KEY (`id_producte`, `categoria_id_categoria`, `botiga_id_botiga`),
  INDEX `fk_productes_categoria1_idx` (`categoria_id_categoria`),
  INDEX `fk_productes_botiga1_idx` (`botiga_id_botiga`),
  INDEX `fk_productes_productes_comanda1_idx` (`productes_comanda_comanda_id_comanda`),
  CONSTRAINT `fk_productes_categoria1`
    FOREIGN KEY (`categoria_id_categoria`)
    REFERENCES `pizzeria`.`categoria` (`id_categoria`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_productes_botiga1`
    FOREIGN KEY (`botiga_id_botiga`)
    REFERENCES `pizzeria`.`botiga` (`id_botiga`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_productes_productes_comanda1`
    FOREIGN KEY (`productes_comanda_comanda_id_comanda`)
    REFERENCES `pizzeria`.`productes_comanda` (`comanda_id_comanda`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

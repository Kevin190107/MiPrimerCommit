-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Turitrans
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Turitrans
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Turitrans` DEFAULT CHARACTER SET utf8 ;
USE `Turitrans` ;

-- -----------------------------------------------------
-- Table `Turitrans`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Turitrans`.`cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `documentoIdentificacion` DECIMAL(1,10) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `registro_id` INT NOT NULL,
  `Admin_id_user` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cliente_registro1_idx` (`registro_id` ASC) VISIBLE,
  INDEX `fk_cliente_Admin1_idx` (`Admin_id_user` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_registro1`
    FOREIGN KEY (`registro_id`)
    REFERENCES `Turitrans`.`registro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_Admin1`
    FOREIGN KEY (`Admin_id_user`)
    REFERENCES `Turitrans`.`Admin` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Turitrans`.`registro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Turitrans`.`registro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Turitrans`.`Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Turitrans`.`Admin` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(45) NOT NULL,
  `registro_id` INT NOT NULL,
  PRIMARY KEY (`id_user`),
  INDEX `fk_Admin_registro_idx` (`registro_id` ASC) VISIBLE,
  CONSTRAINT `fk_Admin_registro`
    FOREIGN KEY (`registro_id`)
    REFERENCES `Turitrans`.`registro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Turitrans`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Turitrans`.`cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `documentoIdentificacion` DECIMAL(1,10) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `registro_id` INT NOT NULL,
  `Admin_id_user` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cliente_registro1_idx` (`registro_id` ASC) VISIBLE,
  INDEX `fk_cliente_Admin1_idx` (`Admin_id_user` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_registro1`
    FOREIGN KEY (`registro_id`)
    REFERENCES `Turitrans`.`registro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_Admin1`
    FOREIGN KEY (`Admin_id_user`)
    REFERENCES `Turitrans`.`Admin` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Turitrans`.`cotizacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Turitrans`.`cotizacion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ciudad` VARCHAR(45) NOT NULL,
  `tipoVehiculo` VARCHAR(45) NOT NULL,
  `cantidadPasajeros` VARCHAR(45) NOT NULL,
  `fechasServicio` VARCHAR(45) NOT NULL,
  `cotizacioncol` VARCHAR(45) NULL,
  `cliente_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cotizacion_cliente1_idx` (`cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_cotizacion_cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `Turitrans`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Turitrans`.`reservas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Turitrans`.`reservas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombreViajero` VARCHAR(45) NOT NULL,
  `DocumentoCliente` VARCHAR(45) NOT NULL,
  `emailCliente` VARCHAR(45) NOT NULL,
  `telefonoCliente` VARCHAR(45) NOT NULL,
  `cliente_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_reservas_cliente1_idx` (`cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_reservas_cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `Turitrans`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

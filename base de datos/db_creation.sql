-- MySQL Script generated by MySQL Workbench
-- lun 28 mar 2016 19:56:07 CST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema games
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema games
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `games` DEFAULT CHARACTER SET utf8 ;
USE `games` ;

-- -----------------------------------------------------
-- Table `games`.`persona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `games`.`persona` ;

CREATE TABLE IF NOT EXISTS `games`.`persona` (
  `i_persona` INT(10) NOT NULL AUTO_INCREMENT,
  `n_persona` VARCHAR(25) NOT NULL,
  `n_apaterno` VARCHAR(25) NOT NULL,
  `n_amaterno` VARCHAR(25) NULL,
  `i_genero` VARCHAR(2) NOT NULL,
  `d_nacimiento` DATE NOT NULL,
  `e_email` VARCHAR(25) NOT NULL,
  `d_alta` TIMESTAMP NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`i_persona`),
  UNIQUE INDEX `i_persona_UNIQUE` (`i_persona` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `games`.`pais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `games`.`pais` ;

CREATE TABLE IF NOT EXISTS `games`.`pais` (
  `i_pais` VARCHAR(3) NOT NULL,
  `e_pais` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`i_pais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `games`.`region`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `games`.`region` ;

CREATE TABLE IF NOT EXISTS `games`.`region` (
  `a_cp` INT(5) NOT NULL,
  `a_colonia` VARCHAR(45) NOT NULL,
  `n_ciudad` VARCHAR(45) NOT NULL,
  `n_municipio` VARCHAR(45) NOT NULL,
  `i_pais` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`a_cp`),
  UNIQUE INDEX `a_cp_UNIQUE` (`a_cp` ASC),
  INDEX `fk_region_pais_idx` (`i_pais` ASC),
  CONSTRAINT `fk_region_pais`
    FOREIGN KEY (`i_pais`)
    REFERENCES `games`.`pais` (`i_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `games`.`direccion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `games`.`direccion` ;

CREATE TABLE IF NOT EXISTS `games`.`direccion` (
  `i_direccion` INT(10) NOT NULL AUTO_INCREMENT,
  `a_calle` VARCHAR(25) NOT NULL,
  `a_numext` VARCHAR(15) NOT NULL,
  `a_numint` VARCHAR(15) NULL,
  `a_cp` INT(5) NOT NULL,
  `f_activo` TINYINT(1) NOT NULL DEFAULT 1,
  `i_persona` INT(10) NOT NULL,
  PRIMARY KEY (`i_direccion`),
  UNIQUE INDEX `i_direccion_UNIQUE` (`i_direccion` ASC),
  INDEX `fk_direccion_persona_idx` (`i_persona` ASC),
  INDEX `fk_direccion_cp_idx` (`a_cp` ASC),
  CONSTRAINT `fk_direccion_persona`
    FOREIGN KEY (`i_persona`)
    REFERENCES `games`.`persona` (`i_persona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_direccion_cp`
    FOREIGN KEY (`a_cp`)
    REFERENCES `games`.`region` (`a_cp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `games`.`telefono`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `games`.`telefono` ;

CREATE TABLE IF NOT EXISTS `games`.`telefono` (
  `i_persona` INT(10) NOT NULL,
  `e_telefono` VARCHAR(15) NOT NULL,
  `n_extension` VARCHAR(8) NULL,
  INDEX `fk_telefono_pers_idx` (`i_persona` ASC),
  CONSTRAINT `fk_telefono_pers`
    FOREIGN KEY (`i_persona`)
    REFERENCES `games`.`persona` (`i_persona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `games`.`tipo_articulo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `games`.`tipo_articulo` ;

CREATE TABLE IF NOT EXISTS `games`.`tipo_articulo` (
  `i_tipo_articulo` VARCHAR(3) NOT NULL,
  `e_tipo_articulo` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`i_tipo_articulo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `games`.`plataforma`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `games`.`plataforma` ;

CREATE TABLE IF NOT EXISTS `games`.`plataforma` (
  `i_plataforma` VARCHAR(5) NOT NULL,
  `e_plataforma` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`i_plataforma`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `games`.`formato`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `games`.`formato` ;

CREATE TABLE IF NOT EXISTS `games`.`formato` (
  `i_formato` VARCHAR(1) NOT NULL,
  `e_formato` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`i_formato`))
ENGINE = InnoDB
COMMENT = 'fisico, digital, servicio, etc';


-- -----------------------------------------------------
-- Table `games`.`articulo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `games`.`articulo` ;

CREATE TABLE IF NOT EXISTS `games`.`articulo` (
  `i_articulo` INT(10) NOT NULL AUTO_INCREMENT,
  `e_articulo` VARCHAR(45) NOT NULL,
  `i_plataforma` VARCHAR(5) NOT NULL,
  `i_tipo` VARCHAR(3) NOT NULL,
  `i_formato` VARCHAR(1) NOT NULL,
  `q_precioVenta` FLOAT NOT NULL,
  `q_precioCompra` FLOAT NULL,
  PRIMARY KEY (`i_articulo`),
  INDEX `fk_articulo_tipo_idx` (`i_tipo` ASC),
  INDEX `fk_articulo_plat_idx` (`i_plataforma` ASC),
  INDEX `fk_articulo_formato_idx` (`i_formato` ASC),
  CONSTRAINT `fk_articulo_tipo`
    FOREIGN KEY (`i_tipo`)
    REFERENCES `games`.`tipo_articulo` (`i_tipo_articulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_articulo_plat`
    FOREIGN KEY (`i_plataforma`)
    REFERENCES `games`.`plataforma` (`i_plataforma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_articulo_formato`
    FOREIGN KEY (`i_formato`)
    REFERENCES `games`.`formato` (`i_formato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `games`.`tipocliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `games`.`tipocliente` ;

CREATE TABLE IF NOT EXISTS `games`.`tipocliente` (
  `i_tipocliente` INT(2) NOT NULL,
  `e_tipocliente` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`i_tipocliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `games`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `games`.`cliente` ;

CREATE TABLE IF NOT EXISTS `games`.`cliente` (
  `i_cliente` INT(10) NOT NULL AUTO_INCREMENT,
  `i_persona` INT(10) NOT NULL,
  `i_tipocliente` INT(2) NOT NULL,
  `q_saldo` FLOAT NULL DEFAULT 0,
  PRIMARY KEY (`i_cliente`),
  INDEX `fk_cliente_tipo_idx` (`i_tipocliente` ASC),
  INDEX `fk_cliente_pers_idx` (`i_persona` ASC),
  CONSTRAINT `fk_cliente_tipo`
    FOREIGN KEY (`i_tipocliente`)
    REFERENCES `games`.`tipocliente` (`i_tipocliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_pers`
    FOREIGN KEY (`i_persona`)
    REFERENCES `games`.`persona` (`i_persona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `games`.`transaccion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `games`.`transaccion` ;

CREATE TABLE IF NOT EXISTS `games`.`transaccion` (
  `i_transaccion` INT NOT NULL AUTO_INCREMENT,
  `t_transaccion` INT(1) NOT NULL,
  `d_transaccion` DATE NOT NULL,
  `i_cliente` INT(10) NOT NULL,
  PRIMARY KEY (`i_transaccion`),
  INDEX `fk_transaccion_cliente_idx` (`i_cliente` ASC),
  CONSTRAINT `fk_transaccion_cliente`
    FOREIGN KEY (`i_cliente`)
    REFERENCES `games`.`cliente` (`i_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `games`.`almacen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `games`.`almacen` ;

CREATE TABLE IF NOT EXISTS `games`.`almacen` (
  `i_almacen` INT(5) NOT NULL AUTO_INCREMENT,
  `e_almacen` VARCHAR(45) NOT NULL,
  `a_direccion` VARCHAR(45) NOT NULL,
  `a_cp` INT(5) NOT NULL,
  PRIMARY KEY (`i_almacen`),
  INDEX `fk_almacen_cp_idx` (`a_cp` ASC),
  CONSTRAINT `fk_almacen_cp`
    FOREIGN KEY (`a_cp`)
    REFERENCES `games`.`region` (`a_cp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `games`.`inventario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `games`.`inventario` ;

CREATE TABLE IF NOT EXISTS `games`.`inventario` (
  `i_articulo` INT(10) NOT NULL,
  `q_existencia` INT(4) NOT NULL,
  `d_actividad` DATE NOT NULL,
  `i_almacen` INT(5) NOT NULL,
  PRIMARY KEY (`i_articulo`),
  CONSTRAINT `fk_inventario_articulo`
    FOREIGN KEY (`i_articulo`)
    REFERENCES `games`.`articulo` (`i_articulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `games`.`almacen_inventario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `games`.`almacen_inventario` ;

CREATE TABLE IF NOT EXISTS `games`.`almacen_inventario` (
  `i_almacen` INT(5) NOT NULL,
  `inventario_i_articulo` INT(10) NOT NULL,
  PRIMARY KEY (`i_almacen`, `inventario_i_articulo`),
  INDEX `fk_almacen_has_inventario_inventario1_idx` (`inventario_i_articulo` ASC),
  INDEX `fk_almacen_has_inventario_almacen1_idx` (`i_almacen` ASC),
  CONSTRAINT `fk_almacen_has_inventario_almacen1`
    FOREIGN KEY (`i_almacen`)
    REFERENCES `games`.`almacen` (`i_almacen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_almacen_has_inventario_inventario1`
    FOREIGN KEY (`inventario_i_articulo`)
    REFERENCES `games`.`inventario` (`i_articulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `games`.`moneda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `games`.`moneda` ;

CREATE TABLE IF NOT EXISTS `games`.`moneda` (
  `i_moneda` VARCHAR(3) NOT NULL,
  `e_moneda` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`i_moneda`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `games`.`forma_pago`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `games`.`forma_pago` ;

CREATE TABLE IF NOT EXISTS `games`.`forma_pago` (
  `i_formapago` INT(1) NOT NULL AUTO_INCREMENT,
  `e_formapago` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`i_formapago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `games`.`detalle_transaccion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `games`.`detalle_transaccion` ;

CREATE TABLE IF NOT EXISTS `games`.`detalle_transaccion` (
  `i_transaccion` INT NOT NULL,
  `q_total` FLOAT NOT NULL,
  `i_moneda` VARCHAR(3) NOT NULL,
  `i_formapago` INT(1) NOT NULL,
  PRIMARY KEY (`i_transaccion`),
  INDEX `fk_detalle_transaccion_moneda_idx` (`i_moneda` ASC),
  INDEX `fk_detalle_transaccion_form_idx` (`i_formapago` ASC),
  CONSTRAINT `fk_detalle_transaccion_id`
    FOREIGN KEY (`i_transaccion`)
    REFERENCES `games`.`transaccion` (`i_transaccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_transaccion_moneda`
    FOREIGN KEY (`i_moneda`)
    REFERENCES `games`.`moneda` (`i_moneda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_transaccion_form`
    FOREIGN KEY (`i_formapago`)
    REFERENCES `games`.`forma_pago` (`i_formapago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `games`.`detalle_transaccion_inventario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `games`.`detalle_transaccion_inventario` ;

CREATE TABLE IF NOT EXISTS `games`.`detalle_transaccion_inventario` (
  `i_transaccion` INT NOT NULL,
  `i_articulo` INT(10) NOT NULL,
  PRIMARY KEY (`i_transaccion`, `i_articulo`),
  INDEX `fk_detalle_transaccion_has_inventario_inventario1_idx` (`i_articulo` ASC),
  INDEX `fk_detalle_transaccion_has_inventario_detalle_transaccion1_idx` (`i_transaccion` ASC),
  CONSTRAINT `fk_detalle_transaccion_has_inventario_detalle_transaccion1`
    FOREIGN KEY (`i_transaccion`)
    REFERENCES `games`.`detalle_transaccion` (`i_transaccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_transaccion_has_inventario_inventario1`
    FOREIGN KEY (`i_articulo`)
    REFERENCES `games`.`inventario` (`i_articulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'inventario_i_articulo';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

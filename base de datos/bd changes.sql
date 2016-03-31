DROP TABLE IF EXISTS `games`.`genero` ;

CREATE TABLE IF NOT EXISTS `games`.`genero` (
  `i_genero` VARCHAR(3) NOT NULL,
  `e_genero` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`i_genero`))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `games`.`clasificacion` ;

CREATE TABLE IF NOT EXISTS `games`.`clasificacion` (
  `i_clasificacion` VARCHAR(3) NOT NULL,
  `e_clasificacion` VARCHAR(25) NOT NULL,
  `q_edad` INT(2) NOT NULL,
  PRIMARY KEY (`i_clasificacion`))
ENGINE = InnoDB;

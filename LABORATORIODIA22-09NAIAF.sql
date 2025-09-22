-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema TikTokDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema TikTokDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TikTokDB` DEFAULT CHARACTER SET utf8 ;
USE `TikTokDB` ;

-- -----------------------------------------------------
-- Table `TikTokDB`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TikTokDB`.`Usuarios` (
  `idUsuarios` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(200) NOT NULL,
  `Fecha` DATE NOT NULL,
  `Pais` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUsuarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TikTokDB`.`Videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TikTokDB`.`Videos` (
  `idVideos` INT NOT NULL AUTO_INCREMENT,
  `idUsuarios` INT NOT NULL,
  `Titulo` VARCHAR(250) NOT NULL,
  `Descripcion` VARCHAR(250) NOT NULL,
  `Fecha_publi` DATE NOT NULL,
  `Duracion` TIME NULL,
  PRIMARY KEY (`idVideos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TikTokDB`.`Comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TikTokDB`.`Comentarios` (
  `idComentarios` INT NOT NULL AUTO_INCREMENT,
  `idVideos` INT NOT NULL,
  `idUsuarios` INT NOT NULL,
  `Texto` VARCHAR(250) NOT NULL,
  `Fecha_coment` DATE NOT NULL,
  PRIMARY KEY (`idComentarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TikTokDB`.`Likes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TikTokDB`.`Likes` (
  `idLikes` INT NOT NULL AUTO_INCREMENT,
  `idVideos` INT NOT NULL,
  `idUsuarios` INT NOT NULL,
  `Fecha_like` DATE NOT NULL,
  `Videos_idVideos` INT NOT NULL,
  PRIMARY KEY (`idLikes`, `Videos_idVideos`),
  INDEX `fk_Likes_Videos1_idx` (`Videos_idVideos` ASC) VISIBLE,
  CONSTRAINT `fk_Likes_Videos1`
    FOREIGN KEY (`Videos_idVideos`)
    REFERENCES `TikTokDB`.`Videos` (`idVideos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TikTokDB`.`Seguidores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TikTokDB`.`Seguidores` (
  `idSeguidores` INT NOT NULL AUTO_INCREMENT,
  `idUsuarios` INT NOT NULL,
  `Fecha_seguimiento` DATE NOT NULL,
  PRIMARY KEY (`idSeguidores`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TikTokDB`.`Usuarios_Videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TikTokDB`.`Usuarios_Videos` (
  `Usuarios_idUsuarios` INT NOT NULL,
  `Videos_idVideos` INT NOT NULL,
  PRIMARY KEY (`Usuarios_idUsuarios`, `Videos_idVideos`),
  INDEX `fk_Usuarios_has_Videos_Videos1_idx` (`Videos_idVideos` ASC) VISIBLE,
  INDEX `fk_Usuarios_has_Videos_Usuarios_idx` (`Usuarios_idUsuarios` ASC) VISIBLE,
  CONSTRAINT `fk_Usuarios_has_Videos_Usuarios`
    FOREIGN KEY (`Usuarios_idUsuarios`)
    REFERENCES `TikTokDB`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuarios_has_Videos_Videos1`
    FOREIGN KEY (`Videos_idVideos`)
    REFERENCES `TikTokDB`.`Videos` (`idVideos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TikTokDB`.`Videos_Comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TikTokDB`.`Videos_Comentarios` (
  `Videos_idVideos` INT NOT NULL,
  `Comentarios_idComentarios` INT NOT NULL,
  PRIMARY KEY (`Videos_idVideos`, `Comentarios_idComentarios`),
  INDEX `fk_Videos_has_Comentarios_Comentarios1_idx` (`Comentarios_idComentarios` ASC) VISIBLE,
  INDEX `fk_Videos_has_Comentarios_Videos1_idx` (`Videos_idVideos` ASC) VISIBLE,
  CONSTRAINT `fk_Videos_has_Comentarios_Videos1`
    FOREIGN KEY (`Videos_idVideos`)
    REFERENCES `TikTokDB`.`Videos` (`idVideos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Videos_has_Comentarios_Comentarios1`
    FOREIGN KEY (`Comentarios_idComentarios`)
    REFERENCES `TikTokDB`.`Comentarios` (`idComentarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TikTokDB`.`Usuarios_Seguidores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TikTokDB`.`Usuarios_Seguidores` (
  `Usuarios_idUsuarios` INT NOT NULL,
  `Seguidores_idSeguidores` INT NOT NULL,
  PRIMARY KEY (`Usuarios_idUsuarios`, `Seguidores_idSeguidores`),
  INDEX `fk_Usuarios_has_Seguidores_Seguidores1_idx` (`Seguidores_idSeguidores` ASC) VISIBLE,
  INDEX `fk_Usuarios_has_Seguidores_Usuarios1_idx` (`Usuarios_idUsuarios` ASC) VISIBLE,
  CONSTRAINT `fk_Usuarios_has_Seguidores_Usuarios1`
    FOREIGN KEY (`Usuarios_idUsuarios`)
    REFERENCES `TikTokDB`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuarios_has_Seguidores_Seguidores1`
    FOREIGN KEY (`Seguidores_idSeguidores`)
    REFERENCES `TikTokDB`.`Seguidores` (`idSeguidores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

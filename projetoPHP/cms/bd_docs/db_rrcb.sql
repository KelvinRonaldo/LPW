-- MySQL Script generated by MySQL Workbench
-- Wed May 29 23:30:00 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema db_rrcb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_rrcb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_rrcb` DEFAULT CHARACTER SET utf8 ;
USE `db_rrcb` ;

-- -----------------------------------------------------
-- Table `db_rrcb`.`tbl_assunto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_rrcb`.`tbl_assunto` (
  `cod_assunto` INT(11) NOT NULL AUTO_INCREMENT,
  `assunto` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`cod_assunto`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_rrcb`.`tbl_estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_rrcb`.`tbl_estado` (
  `cod_estado` INT(11) NOT NULL AUTO_INCREMENT,
  `estado` VARCHAR(40) NOT NULL,
  `uf` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`cod_estado`))
ENGINE = InnoDB
AUTO_INCREMENT = 28
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_rrcb`.`tbl_cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_rrcb`.`tbl_cidade` (
  `cod_cidade` INT(11) NOT NULL AUTO_INCREMENT,
  `cod_estado` INT(11) NOT NULL,
  `cidade` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`cod_cidade`),
  INDEX `cod_estado` (`cod_estado` ASC),
  CONSTRAINT `fk_cidade_estado`
    FOREIGN KEY (`cod_estado`)
    REFERENCES `db_rrcb`.`tbl_estado` (`cod_estado`))
ENGINE = InnoDB
AUTO_INCREMENT = 5598
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_rrcb`.`tbl_destaque_noticia_principal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_rrcb`.`tbl_destaque_noticia_principal` (
  `cod_destaque` INT(11) NOT NULL AUTO_INCREMENT,
  `destaque` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod_destaque`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_rrcb`.`tbl_endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_rrcb`.`tbl_endereco` (
  `cod_endereco` INT(11) NOT NULL AUTO_INCREMENT,
  `logradouro` VARCHAR(55) NOT NULL,
  `numero` VARCHAR(10) NOT NULL,
  `bairro` VARCHAR(40) NOT NULL,
  `cep` VARCHAR(9) NOT NULL,
  `status` VARCHAR(10) NOT NULL DEFAULT 'desativado',
  `cod_cidade` INT(11) NOT NULL,
  PRIMARY KEY (`cod_endereco`),
  INDEX `cod_cidade_idx` (`cod_cidade` ASC),
  CONSTRAINT `fk_endereco_cidade`
    FOREIGN KEY (`cod_cidade`)
    REFERENCES `db_rrcb`.`tbl_cidade` (`cod_cidade`))
ENGINE = InnoDB
AUTO_INCREMENT = 20
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_rrcb`.`tbl_evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_rrcb`.`tbl_evento` (
  `cod_evento` INT(11) NOT NULL AUTO_INCREMENT,
  `titulo_evento` VARCHAR(30) NOT NULL,
  `descricao` TEXT NOT NULL,
  `data` DATE NOT NULL,
  `host` VARCHAR(80) NULL DEFAULT NULL,
  `entrada` VARCHAR(25) NULL DEFAULT NULL,
  `imagem` VARCHAR(45) NOT NULL,
  `status` VARCHAR(10) NOT NULL DEFAULT 'desativado',
  `cod_endereco` INT(11) NOT NULL,
  PRIMARY KEY (`cod_evento`),
  INDEX `cod_endereco_idx` (`cod_endereco` ASC),
  CONSTRAINT `fk_evento_endereco`
    FOREIGN KEY (`cod_endereco`)
    REFERENCES `db_rrcb`.`tbl_endereco` (`cod_endereco`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_rrcb`.`tbl_fale_conosco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_rrcb`.`tbl_fale_conosco` (
  `cod_mensagem` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `celular` VARCHAR(15) NOT NULL,
  `telefone` VARCHAR(14) NULL DEFAULT NULL,
  `sexo` CHAR(1) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `profissao` VARCHAR(100) NOT NULL,
  `home_page` VARCHAR(150) NULL DEFAULT NULL,
  `facebook` VARCHAR(150) NULL DEFAULT NULL,
  `mensagem` TEXT NOT NULL,
  `cod_assunto` INT(11) NOT NULL,
  PRIMARY KEY (`cod_mensagem`),
  INDEX `cod_assunto_idx` (`cod_assunto` ASC),
  CONSTRAINT `fk_fale_conosco_assunto`
    FOREIGN KEY (`cod_assunto`)
    REFERENCES `db_rrcb`.`tbl_assunto` (`cod_assunto`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_rrcb`.`tbl_loja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_rrcb`.`tbl_loja` (
  `cod_loja` INT(11) NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(10) NOT NULL DEFAULT 'desativado',
  `cod_endereco` INT(11) NOT NULL,
  PRIMARY KEY (`cod_loja`),
  INDEX `cod_endereco_idx` (`cod_endereco` ASC),
  CONSTRAINT `fk_lojas_endereco`
    FOREIGN KEY (`cod_endereco`)
    REFERENCES `db_rrcb`.`tbl_endereco` (`cod_endereco`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_rrcb`.`tbl_nivel_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_rrcb`.`tbl_nivel_usuario` (
  `cod_nivel_usuario` INT(11) NOT NULL AUTO_INCREMENT,
  `nivel` VARCHAR(50) NOT NULL,
  `adm_usuario` VARCHAR(12) NOT NULL DEFAULT 'desativado',
  `adm_fale_conosco` VARCHAR(12) NOT NULL DEFAULT 'desativado',
  `adm_conteudo` VARCHAR(12) NOT NULL DEFAULT 'desativado',
  `adm_produto` VARCHAR(12) NOT NULL DEFAULT 'desativado',
  `status` VARCHAR(10) NOT NULL DEFAULT 'desativado',
  PRIMARY KEY (`cod_nivel_usuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_rrcb`.`tbl_noticia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_rrcb`.`tbl_noticia` (
  `cod_noticia` INT(11) NOT NULL AUTO_INCREMENT,
  `titulo_noticia` VARCHAR(90) NOT NULL,
  `autor` VARCHAR(50) NULL DEFAULT NULL,
  `resumo` VARCHAR(120) NOT NULL,
  `data` DATE NULL DEFAULT NULL,
  `imagem` VARCHAR(100) NOT NULL,
  `status` VARCHAR(10) NOT NULL DEFAULT 'desativado',
  PRIMARY KEY (`cod_noticia`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_rrcb`.`tbl_noticia_principal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_rrcb`.`tbl_noticia_principal` (
  `cod_noticia` INT(11) NOT NULL AUTO_INCREMENT,
  `titulo_noticia` VARCHAR(23) NOT NULL,
  `autor` VARCHAR(50) NULL DEFAULT NULL,
  `resumo` VARCHAR(90) NOT NULL,
  `data` DATE NULL DEFAULT NULL,
  `imagem` VARCHAR(100) NOT NULL,
  `status` VARCHAR(10) NOT NULL DEFAULT 'desativado',
  `cod_destaque` INT(11) NOT NULL,
  PRIMARY KEY (`cod_noticia`),
  INDEX `cod_destaque_noticial_idx` (`cod_destaque` ASC),
  CONSTRAINT `fk_noticia_destaque`
    FOREIGN KEY (`cod_destaque`)
    REFERENCES `db_rrcb`.`tbl_destaque_noticia_principal` (`cod_destaque`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_rrcb`.`tbl_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_rrcb`.`tbl_produto` (
  `cod_produto` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  `descricao` VARCHAR(120) NOT NULL,
  `preco` DOUBLE NOT NULL,
  `status` VARCHAR(10) NOT NULL DEFAULT 'desativado',
  `imagem` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`cod_produto`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_rrcb`.`tbl_promocao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_rrcb`.`tbl_promocao` (
  `cod_promocao` INT(11) NOT NULL AUTO_INCREMENT,
  `percentual_desconto` TINYINT(4) NOT NULL,
  `preco_desconto` DOUBLE NOT NULL,
  `status` VARCHAR(10) NOT NULL DEFAULT 'desativado',
  `numero_parcelas` INT(11) NULL DEFAULT NULL,
  `metodo_pagamento` VARCHAR(45) NULL DEFAULT NULL,
  `preco_parcelas` DOUBLE NULL DEFAULT NULL,
  `cod_produto` INT(11) NOT NULL,
  PRIMARY KEY (`cod_promocao`),
  INDEX `fk_promocao_produto_idx` (`cod_produto` ASC),
  CONSTRAINT `fk_promocao_produto`
    FOREIGN KEY (`cod_produto`)
    REFERENCES `db_rrcb`.`tbl_produto` (`cod_produto`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_rrcb`.`tbl_sobre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_rrcb`.`tbl_sobre` (
  `cod_sobre` INT(11) NOT NULL AUTO_INCREMENT,
  `titulo_sobre` VARCHAR(25) NOT NULL,
  `sobre` TEXT NOT NULL,
  `assinatura` VARCHAR(50) NULL DEFAULT NULL,
  `status` VARCHAR(10) NOT NULL DEFAULT 'desativado',
  `imagem` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`cod_sobre`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_rrcb`.`tbl_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_rrcb`.`tbl_usuario` (
  `cod_usuario` INT(11) NOT NULL AUTO_INCREMENT,
  `nome_usuario` VARCHAR(30) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `senha` VARCHAR(135) NOT NULL,
  `status` VARCHAR(10) NOT NULL DEFAULT 'desativado',
  `cod_nivel_usuario` INT(11) NOT NULL,
  PRIMARY KEY (`cod_usuario`),
  INDEX `cod_nivel_usuario_idx` (`cod_nivel_usuario` ASC),
  CONSTRAINT `fk_usuario_nivel_usuario`
    FOREIGN KEY (`cod_nivel_usuario`)
    REFERENCES `db_rrcb`.`tbl_nivel_usuario` (`cod_nivel_usuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_rrcb`.`tbl_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_rrcb`.`tbl_categoria` (
  `cod_categoria` INT NOT NULL AUTO_INCREMENT,
  `categoria` VARCHAR(50) NOT NULL,
  `status` VARCHAR(10) NOT NULL DEFAULT 'desativado',
  PRIMARY KEY (`cod_categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_rrcb`.`tbl_subcategoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_rrcb`.`tbl_subcategoria` (
  `cod_subcategoria` INT NOT NULL,
  `subcategoria` VARCHAR(50) NOT NULL,
  `status` VARCHAR(10) NOT NULL DEFAULT 'desativado',
  PRIMARY KEY (`cod_subcategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_rrcb`.`tbl_produto_subcategoria_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_rrcb`.`tbl_produto_subcategoria_categoria` (
  `cod_produto_subcategoria_categoria` INT NOT NULL AUTO_INCREMENT,
  `cod_subcategoria` INT NOT NULL,
  `cod_categoria` INT NOT NULL,
  `cod_produto` INT NOT NULL,
  PRIMARY KEY (`cod_produto_subcategoria_categoria`),
  INDEX `fk_subcategoria_categoria_idx` (`cod_categoria` ASC),
  INDEX `fk_subcategoria_categoria_idx1` (`cod_subcategoria` ASC),
  INDEX `fk_subcategoria_produto_idx` (`cod_produto` ASC),
  CONSTRAINT `fk_produto_subcategoria_categoria`
    FOREIGN KEY (`cod_categoria`)
    REFERENCES `db_rrcb`.`tbl_categoria` (`cod_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_categoria_subcategoria`
    FOREIGN KEY (`cod_subcategoria`)
    REFERENCES `db_rrcb`.`tbl_subcategoria` (`cod_subcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categoria_subcategoria_produto`
    FOREIGN KEY (`cod_produto`)
    REFERENCES `db_rrcb`.`tbl_produto` (`cod_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_rrcb`.`tbl_categoria_subcategoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_rrcb`.`tbl_categoria_subcategoria` (
  `cod_categoria_subcategoria` INT NOT NULL AUTO_INCREMENT,
  `cod_categoria` INT NOT NULL,
  `cod_subcategoria` INT NOT NULL,
  PRIMARY KEY (`cod_categoria_subcategoria`),
  INDEX `fk_subcategoria_categoria_idx` (`cod_subcategoria` ASC),
  INDEX `fk_categoria_subcategoria_idx` (`cod_categoria` ASC),
  CONSTRAINT `fk_subcategoria_categoria`
    FOREIGN KEY (`cod_subcategoria`)
    REFERENCES `db_rrcb`.`tbl_subcategoria` (`cod_subcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categoria_subcategoria`
    FOREIGN KEY (`cod_categoria`)
    REFERENCES `db_rrcb`.`tbl_categoria` (`cod_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bd1-tp
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bd1-tp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd1-tp` ;
USE `bd1-tp` ;

-- -----------------------------------------------------
-- Table `bd1-tp`.`Marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd1-tp`.`Marca` (
  `idMarca` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `info` VARCHAR(200) NULL,
  PRIMARY KEY (`idMarca`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd1-tp`.`ModeloDeVehículo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd1-tp`.`ModeloDeVehículo` (
  `idModeloDeVehículo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `info` VARCHAR(200) NULL,
  `Marca_idMarca` INT NOT NULL,
  PRIMARY KEY (`idModeloDeVehículo`),
  INDEX `fk_ModeloDeVehículo_Marca1_idx` (`Marca_idMarca` ASC) VISIBLE,
  CONSTRAINT `fk_ModeloDeVehículo_Marca1`
    FOREIGN KEY (`Marca_idMarca`)
    REFERENCES `bd1-tp`.`Marca` (`idMarca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd1-tp`.`Automotriz`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd1-tp`.`Automotriz` (
  `idAutomotriz` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAutomotriz`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd1-tp`.`LíneaDeMontaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd1-tp`.`LíneaDeMontaje` (
  `idLíneaDeMontaje` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `capacidadProductivaDeUnidades` INT NOT NULL,
  `idModeloDeVhículo` INT NOT NULL,
  `idAutomotriz` INT NOT NULL,
  PRIMARY KEY (`idLíneaDeMontaje`),
  INDEX `fk_LíneaDeMontaje_ModeloDeVhículo1_idx` (`idModeloDeVhículo` ASC) VISIBLE,
  INDEX `fk_LíneaDeMontaje_Automotriz1_idx` (`idAutomotriz` ASC) VISIBLE,
  CONSTRAINT `fk_LíneaDeMontaje_ModeloDeVhículo1`
    FOREIGN KEY (`idModeloDeVhículo`)
    REFERENCES `bd1-tp`.`ModeloDeVehículo` (`idModeloDeVehículo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LíneaDeMontaje_Automotriz1`
    FOREIGN KEY (`idAutomotriz`)
    REFERENCES `bd1-tp`.`Automotriz` (`idAutomotriz`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd1-tp`.`EstaciónDeTrabajo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd1-tp`.`EstaciónDeTrabajo` (
  `idEstaciónDeTrabajo` INT NOT NULL AUTO_INCREMENT,
  `trabajo` VARCHAR(45) NULL,
  `orden` INT NOT NULL,
  `idLíneaDeMontaje` INT NOT NULL,
  PRIMARY KEY (`idEstaciónDeTrabajo`),
  INDEX `fk_EstaciónDeTrabajo_LíneaDeMontaje1_idx` (`idLíneaDeMontaje` ASC) VISIBLE,
  CONSTRAINT `fk_EstaciónDeTrabajo_LíneaDeMontaje1`
    FOREIGN KEY (`idLíneaDeMontaje`)
    REFERENCES `bd1-tp`.`LíneaDeMontaje` (`idLíneaDeMontaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd1-tp`.`Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd1-tp`.`Proveedor` (
  `idProveedor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd1-tp`.`Insumo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd1-tp`.`Insumo` (
  `idInsumo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idInsumo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd1-tp`.`Concesionaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd1-tp`.`Concesionaria` (
  `idConcesionaria` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idConcesionaria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd1-tp`.`PedidoAutos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd1-tp`.`PedidoAutos` (
  `idPedidoAutos` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `idConcesionaria` INT NOT NULL,
  `idAutomotriz` INT NOT NULL,
  PRIMARY KEY (`idPedidoAutos`),
  INDEX `fk_PedidoAutos_Concesionaria1_idx` (`idConcesionaria` ASC) VISIBLE,
  INDEX `fk_PedidoAutos_Automotriz1_idx` (`idAutomotriz` ASC) VISIBLE,
  CONSTRAINT `fk_PedidoAutos_Concesionaria1`
    FOREIGN KEY (`idConcesionaria`)
    REFERENCES `bd1-tp`.`Concesionaria` (`idConcesionaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PedidoAutos_Automotriz1`
    FOREIGN KEY (`idAutomotriz`)
    REFERENCES `bd1-tp`.`Automotriz` (`idAutomotriz`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd1-tp`.`Automovil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd1-tp`.`Automovil` (
  `chasis` INT NOT NULL AUTO_INCREMENT,
  `patente` VARCHAR(45) NOT NULL,
  `fechaInicio` DATE NOT NULL,
  `fechaFinalizacion` DATE NULL,
  `idLíneaDeMontaje` INT NOT NULL,
  `idPedidoAutos` INT NOT NULL,
  PRIMARY KEY (`chasis`),
  INDEX `fk_Automovil_LíneaDeMontaje1_idx` (`idLíneaDeMontaje` ASC) VISIBLE,
  INDEX `fk_Automovil_PedidoAutos1_idx` (`idPedidoAutos` ASC) VISIBLE,
  CONSTRAINT `fk_Automovil_LíneaDeMontaje1`
    FOREIGN KEY (`idLíneaDeMontaje`)
    REFERENCES `bd1-tp`.`LíneaDeMontaje` (`idLíneaDeMontaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Automovil_PedidoAutos1`
    FOREIGN KEY (`idPedidoAutos`)
    REFERENCES `bd1-tp`.`PedidoAutos` (`idPedidoAutos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd1-tp`.`RegistroAutomovilPorEstacionDeTrabajo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd1-tp`.`RegistroAutomovilPorEstacionDeTrabajo` (
  `idEstaciónDeTrabajo` INT NOT NULL,
  `chasis` INT NOT NULL,
  `fechaIngreso` DATETIME NOT NULL,
  `fechaEgreso` DATETIME NULL,
  PRIMARY KEY (`idEstaciónDeTrabajo`, `chasis`),
  INDEX `fk_EstaciónDeTrabajo_has_Automovil_Automovil1_idx` (`chasis` ASC) VISIBLE,
  INDEX `fk_EstaciónDeTrabajo_has_Automovil_EstaciónDeTrabajo1_idx` (`idEstaciónDeTrabajo` ASC) VISIBLE,
  CONSTRAINT `fk_EstaciónDeTrabajo_has_Automovil_EstaciónDeTrabajo1`
    FOREIGN KEY (`idEstaciónDeTrabajo`)
    REFERENCES `bd1-tp`.`EstaciónDeTrabajo` (`idEstaciónDeTrabajo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EstaciónDeTrabajo_has_Automovil_Automovil1`
    FOREIGN KEY (`chasis`)
    REFERENCES `bd1-tp`.`Automovil` (`chasis`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd1-tp`.`ModeloPedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd1-tp`.`ModeloPedido` (
  `idModeloPedido` INT NOT NULL AUTO_INCREMENT,
  `cantidad` INT NOT NULL,
  `idModeloDeVehículo` INT NOT NULL,
  `idPedidoAutos` INT NOT NULL,
  PRIMARY KEY (`idModeloPedido`),
  INDEX `fk_ModeloPedido_ModeloDeVehículo1_idx` (`idModeloDeVehículo` ASC) VISIBLE,
  INDEX `fk_ModeloPedido_PedidoAutos1_idx` (`idPedidoAutos` ASC) VISIBLE,
  CONSTRAINT `fk_ModeloPedido_ModeloDeVehículo1`
    FOREIGN KEY (`idModeloDeVehículo`)
    REFERENCES `bd1-tp`.`ModeloDeVehículo` (`idModeloDeVehículo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ModeloPedido_PedidoAutos1`
    FOREIGN KEY (`idPedidoAutos`)
    REFERENCES `bd1-tp`.`PedidoAutos` (`idPedidoAutos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd1-tp`.`InformePedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd1-tp`.`InformePedido` (
  `idInformePedido` INT NOT NULL AUTO_INCREMENT,
  `montoTotal` DOUBLE NOT NULL,
  `fechaEntregaEstimada` DATE NOT NULL,
  `idPedidoAutos` INT NOT NULL,
  PRIMARY KEY (`idInformePedido`),
  INDEX `fk_InformePedido_PedidoAutos1_idx` (`idPedidoAutos` ASC) VISIBLE,
  CONSTRAINT `fk_InformePedido_PedidoAutos1`
    FOREIGN KEY (`idPedidoAutos`)
    REFERENCES `bd1-tp`.`PedidoAutos` (`idPedidoAutos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd1-tp`.`ListaDeInsumosPedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd1-tp`.`ListaDeInsumosPedidos` (
  `idlLstaDeInsumosPedidos` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `idLíneaDeMontaje` INT NOT NULL,
  `idProveedor` INT NOT NULL,
  PRIMARY KEY (`idlLstaDeInsumosPedidos`),
  INDEX `fk_listaDeInsumosPedidos_LíneaDeMontaje1_idx` (`idLíneaDeMontaje` ASC) VISIBLE,
  INDEX `fk_listaDeInsumosPedidos_Proveedor1_idx` (`idProveedor` ASC) VISIBLE,
  CONSTRAINT `fk_listaDeInsumosPedidos_LíneaDeMontaje1`
    FOREIGN KEY (`idLíneaDeMontaje`)
    REFERENCES `bd1-tp`.`LíneaDeMontaje` (`idLíneaDeMontaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_listaDeInsumosPedidos_Proveedor1`
    FOREIGN KEY (`idProveedor`)
    REFERENCES `bd1-tp`.`Proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd1-tp`.`InsumoPedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd1-tp`.`InsumoPedido` (
  `idlLstaDeInsumosPedidos` INT NOT NULL,
  `idInsumo` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `precioUnitario` INT NOT NULL,
  PRIMARY KEY (`idlLstaDeInsumosPedidos`, `idInsumo`),
  INDEX `fk_ListaDeInsumosPedidos_has_Insumo_Insumo1_idx` (`idInsumo` ASC) VISIBLE,
  INDEX `fk_ListaDeInsumosPedidos_has_Insumo_ListaDeInsumosPedidos1_idx` (`idlLstaDeInsumosPedidos` ASC) VISIBLE,
  CONSTRAINT `fk_ListaDeInsumosPedidos_has_Insumo_ListaDeInsumosPedidos1`
    FOREIGN KEY (`idlLstaDeInsumosPedidos`)
    REFERENCES `bd1-tp`.`ListaDeInsumosPedidos` (`idlLstaDeInsumosPedidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ListaDeInsumosPedidos_has_Insumo_Insumo1`
    FOREIGN KEY (`idInsumo`)
    REFERENCES `bd1-tp`.`Insumo` (`idInsumo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd1-tp`.`InsumosRecibidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd1-tp`.`InsumosRecibidos` (
  `idInsumosRecibidos` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `idlLstaDeInsumosPedidos` INT NOT NULL,
  PRIMARY KEY (`idInsumosRecibidos`),
  INDEX `fk_InsumosEntregados_ListaDeInsumosPedidos1_idx` (`idlLstaDeInsumosPedidos` ASC) VISIBLE,
  CONSTRAINT `fk_InsumosEntregados_ListaDeInsumosPedidos1`
    FOREIGN KEY (`idlLstaDeInsumosPedidos`)
    REFERENCES `bd1-tp`.`ListaDeInsumosPedidos` (`idlLstaDeInsumosPedidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

create database Hiveward;
use Hiveward;

-- -----------------------------------------------------
-- Table `mydb`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Clientes (
  `idClientes` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Senha` VARCHAR(45) NOT NULL,
  `CPFCNPJ` VARCHAR(45) NOT NULL,
  `Empresa` VARCHAR(45) NOT NULL,
  `Rede_social` VARCHAR(45) NULL,
  PRIMARY KEY (`idClientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Especies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Especies (
  `idEspecies` INT NOT NULL,
  `Nome_popular` VARCHAR(45) NOT NULL,
  `Nome_cientifico` VARCHAR(45) NOT NULL,
  `fk_cliente` INT NOT NULL,
  PRIMARY KEY (`idEspecies`),
  INDEX `fk_Especies_Clientes1_idx` (`fk_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_Especies_Clientes1`
    FOREIGN KEY (`fk_cliente`)
    REFERENCES `mydb`.`Clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Caixas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Caixas (
  `idCaixas` INT NOT NULL AUTO_INCREMENT,
  `Temperatura` VARCHAR(45) NULL,
  `Umidade` VARCHAR(45) NULL,
  `Caixascol` VARCHAR(45) NULL,
  `fk_cliente` INT NOT NULL,
  `fk_especie` INT NOT NULL,
  PRIMARY KEY (`idCaixas`),
  INDEX `fk_Caixas_Clientes1_idx` (`fk_cliente` ASC) VISIBLE,
  INDEX `fk_Caixas_Especies1_idx` (`fk_especie` ASC) VISIBLE,
  CONSTRAINT `fk_Caixas_Clientes1`
    FOREIGN KEY (`fk_cliente`)
    REFERENCES `mydb`.`Clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Caixas_Especies1`
    FOREIGN KEY (`fk_especie`)
    REFERENCES `mydb`.`Especies` (`idEspecies`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Perguntas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Perguntas (
  `idPerguntas` INT NOT NULL AUTO_INCREMENT,
  `Pergunta` VARCHAR(100) NOT NULL,
  `Resposta` VARCHAR(5000) NULL,
  `fk_cliente` INT NOT NULL,
  PRIMARY KEY (`idPerguntas`),
  INDEX `fk_Perguntas_Clientes1_idx` (`fk_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_Perguntas_Clientes1`
    FOREIGN KEY (`fk_cliente`)
    REFERENCES `mydb`.`Clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Contato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Contato (
  `idRedes_sociais` INT NOT NULL AUTO_INCREMENT,
  `Facebook` VARCHAR(45) NULL,
  `Google` VARCHAR(45) NULL,
  `Telefone` VARCHAR(45) NULL,
  `E-mail` VARCHAR(45) NULL,
  `Endereco` VARCHAR(100) NULL,
  `clientes` INT NOT NULL,
  PRIMARY KEY (`idRedes_sociais`),
  INDEX `fk_Contato_Clientes1_idx` (`clientes` ASC) VISIBLE,
  CONSTRAINT `fk_Contato_Clientes1`
    FOREIGN KEY (`clientes`)
    REFERENCES `mydb`.`Clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Medidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Medidas (
  `idMedidas` INT NOT NULL AUTO_INCREMENT,
  `Temp` DECIMAL(6,2) NOT NULL,
  `Umid` DECIMAL(6,2) NOT NULL,
  `Horario` DATETIME NOT NULL,
  `fk_caixas` INT NOT NULL,
  `fk_clientes` INT NOT NULL,
  `fk_especie` INT NOT NULL,
  PRIMARY KEY (`idMedidas`, `Horario`),
  INDEX `fk_Medidas_Caixas1_idx` (`fk_caixas` ASC, `fk_clientes` ASC, `fk_especie` ASC) VISIBLE,
  CONSTRAINT `fk_Medidas_Caixas1`
    FOREIGN KEY (`fk_caixas` , `fk_clientes` , `fk_especie`)
    REFERENCES `mydb`.`Caixas` (`idCaixas` , `fk_cliente` , `fk_especie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Usuario (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `NomeUsuario` VARCHAR(45) NOT NULL,
  `Senha` VARCHAR(45) NULL,
  `fk_cliente` INT NOT NULL,
  PRIMARY KEY (`idUsuario`),
  INDEX `fk_Usuario_Clientes1_idx` (`fk_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_Clientes1`
    FOREIGN KEY (`fk_cliente`)
    REFERENCES `mydb`.`Clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



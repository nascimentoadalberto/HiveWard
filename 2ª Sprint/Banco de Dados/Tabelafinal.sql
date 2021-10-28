create database Hiveward;
use Hiveward;

CREATE TABLE IF NOT EXISTS Clientes (
  idClientes INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Nome VARCHAR(45) NOT NULL,
  Email VARCHAR(45) NOT NULL,
  Senha VARCHAR(45) NOT NULL,
  CPFCNPJ VARCHAR(45) NOT NULL,
  Empresa VARCHAR(45),
  Rede_social VARCHAR(45)
);

CREATE TABLE IF NOT EXISTS Especies (
  idEspecies INT NOT NULL PRIMARY KEY auto_increment,
  Nome_popular VARCHAR(45) NOT NULL,
  Nome_cientifico VARCHAR(45) NOT NULL,
  fk_cliente INT NOT NULL,
    FOREIGN KEY (fk_cliente) REFERENCES Clientes (idClientes)
);

CREATE TABLE IF NOT EXISTS Caixas (
  idCaixas INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Nome_colmeia varchar(45) NOT NULL,
  fk_cliente INT NOT NULL,
  fk_especie INT NOT NULL,
    FOREIGN KEY (fk_cliente) REFERENCES Clientes (idClientes),
    FOREIGN KEY (fk_especie) REFERENCES Especies (idEspecies)
);

CREATE TABLE IF NOT EXISTS Medidas (
  idMedidas INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Temp DECIMAL(6,2) NOT NULL,
  Umid DECIMAL(6,2) NOT NULL,
  Horario DATETIME NOT NULL,
  fk_caixas INT NOT NULL,
  fk_clientes INT NOT NULL,
  fk_especie INT NOT NULL,
    FOREIGN KEY (fk_caixas) REFERENCES Caixas (idCaixas),
    FOREIGN KEY (fk_clientes) REFERENCES Clientes (idClientes),
    FOREIGN KEY (fk_especie) REFERENCES Especies (idEspecies)
);

INSERT INTO Medidas (Temp, Umid, Horario, fk_caixas, fk_clientes, fk_especie) VALUES
(32.5, 48.0, '2021-10-06 14:06:15', 1, 2, 3),
(29.9, 58.0, '2021-12-08 17:32:55', 3, 3, 4),
(36.7, 63.0, '2021-10-10 16:21:43', 2, 1, 2);

INSERT INTO Clientes (Nome, Email, Senha, CPFCNPJ) VALUES 
("José da Silva", "josesilva@gmail.com", "123456789", "987654231"),
("Fernando Brandão", "fernando.brandao@bandtec.com.br", "456789123", "789456123"),
("Adalberto Nascimento", "adalberto.nascimento@bandtec.com.br", "987654231", "321654987");

INSERT INTO Especies (Nome_popular, Nome_cientifico, fk_cliente) VALUES
("Europeia", "Apis mellifera", 2),
("Melipona scutellaris", "Melipona scutellaris", 1),
("Iraí", "Nannotrigona testaceicornis", 2),
("Tetragonisca angustula", "Tetragonisca angustula", 3);

INSERT INTO Caixas (Nome_colmeia, fk_cliente, fk_especie) VALUES
("Colmeia de Iraí", 2, 3),
("Colmeia de Europeias", 2, 1),
("Colmeia de angustula", 3, 4);

-- As tabelas a seguir não possuem telas proprietárias, por isso, não possuem inserts.

CREATE TABLE IF NOT EXISTS Perguntas (
  idPerguntas INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Pergunta VARCHAR(100) NOT NULL,
  Resposta VARCHAR(5000) NULL,
  fk_cliente INT NOT NULL,
    FOREIGN KEY (fk_cliente) REFERENCES Clientes (idClientes)
);

CREATE TABLE IF NOT EXISTS Contato (
  idRedes_sociais INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Facebook VARCHAR(45) NULL,
  Google VARCHAR(45) NULL,
  Telefone VARCHAR(45) NULL,
  Email VARCHAR(45) NULL,
  Endereco VARCHAR(100) NULL,
  clientes INT NOT NULL,
    FOREIGN KEY (clientes) REFERENCES Clientes (idClientes)
);

CREATE TABLE IF NOT EXISTS Usuario (
  idUsuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  NomeUsuario VARCHAR(45) NOT NULL,
  Senha VARCHAR(45) NULL,
  fk_cliente INT NOT NULL,
    FOREIGN KEY (fk_cliente) REFERENCES Clientes (idClientes)
);



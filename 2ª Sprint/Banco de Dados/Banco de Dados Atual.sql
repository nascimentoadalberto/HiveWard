create database HiveWard;
use HiveWard;
-- Tabela Cliente

create table Clientes(
idCliente int not null primary key auto_increment,
nomeCliente varchar(45) not null,
Telefone varchar(20),
Email varchar(45)not null,
Senha varchar(45)not null,
Solicitacoes int not null,
CPF varchar(45)not null,
Endereco varchar(50) not null,
CEP varchar(45),
qtd_caixas_sensor int,
Apicultor char(3) not null,
check (Apicultor = 'sim' or Apicultor = 'não'),
Agricultor char(3) not null,
check (Agricultor = 'sim' or Agricultor = 'não')
)auto_increment = 0;


-- Tabela Caxa_colmeia_sensor
create table CXcolmeia_sensor(
idCXcolmeia  int not null primary key auto_increment,
medida_temperatura varchar(20),
medida_umidade  varchar(20),
horario time,
local_colmeia varchar(45),
FK_cliente int,
FK_especie int,
foreign key (FK_cliente) references Clientes(idCliente),
foreign key (FK_especie) references Especies(idEspecie)
)auto_increment = 100 ;

-- Tablela Espécies
create table Especies(
idEspecie int not null primary key auto_increment,
nome_comum varchar(45),
nome_cientifico varchar(45),
cuidados varchar(45),
TipoMel varchar(45),
temperatura_ideal varchar(10)
)auto_increment = 200;

-- Tabela backup
create table table_backup(
idBackup int not null primary key auto_increment,
Dia_backup date,
FK_CXcolmeia int,
FK_media int,
foreign key (FK_CXcolmeia) references CXcolmeia_sensor(idCXcolmeia),
foreign key (FK_media) references media_diaria(idMedia)
)auto_increment = 300;

-- tabela médias diárias
create table media_diaria(
idMedia int not null primary key auto_increment,
Media datetime
) auto_increment = 400;

-- Tabela duvidas
create table Duvidas(
idDuvida int not null primary key auto_increment,
duvidas_frequentes varchar(60),
classificacao int,
FK_cliente int,
foreign key (FK_cliente) references Clientes(idCliente)
) auto_increment = 500;


drop database HiveWard;
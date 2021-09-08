create database HiveWard;
use HiveWard;

create table Clientes (
idCliente int primary key not null auto_increment,
NomeResponsavel varchar (100),
CPF varchar (11),
Email varchar (70),
Senha varchar (50),
Endereço varchar (100),
CEP varchar (9),
Apicultor char (1),
Agricultor char (1),
Qtd_Caixas int,
Solicitacoes int
);
insert into Clientes values (1, "Nicolas Cage da Silva","44489655032", "nicolascage@gmail.com", "@Catat4u", "Rua das madeiras, 444 - Jardim Árvores", "39967000", "S", "N", 2, 0);
insert into Clientes values (2, "Brad Pit Pereira","99936749246", "bpitpereira@gmail.com", "querooscar", "Rua Titanic, 321 - Jardim Antártica", "02440055", "S", "S", 3, 0), 
(3, "Will Smith Costa","2983674100", "willscosta@hotmail.com", "maluconopedaco", "Rua Titanic, 777 - Jardim Antártica", "02440055", "S", "N", 1, 3);
select * from Clientes;

create table CxColmeias (
idColmeia int primary key not null auto_increment,
Proprietario varchar (100),
idCliente int,
Coordenada varchar (20)
);
insert into CxColmeias values (1, "Nicolas Cage da Silva", 1, "30° N 31° E"),
(2, "Nicolas Cage da Silva", 1, "30° N 31° E"), 
(3, "Brad Pit Pereira", 2, "139° N 99° E"), 
(4, "Brad Pit Pereira", 2, "139° N 99° E"), 
(5, "Bras Pit Pereira", 2, "139° N 99° E"),
(6, "Will Smith Costa", 3, "34° N 156° E");
select * from CxColmeias;

create table Produtos (
idProduto int primary key not null auto_increment,
nomeProduto varchar (30),
Preco numeric (10,2)
);
insert into Produtos values (1, "Colmeia HiveWard", 150.00);
select * from Produtos;

update Clientes set nomeResponsavel = "Brad Pit Pereira" where idCliente = 1;



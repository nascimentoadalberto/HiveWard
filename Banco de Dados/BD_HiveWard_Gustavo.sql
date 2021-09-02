create database HiveWard;
use HiveWard;
create table Clientes (
idCliente int primary key not null auto_increment,
Nome varchar (100),
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
create table CxColmeias (
idColmeia int primary key not null auto_increment,
Proprietario varchar (100),
idCliente int,
Coordenada varchar (20)
);

create table Produtos (
idProduto int primary key not null auto_increment,
nomeProduto varchar (30),
Preco numeric (10,2)
);




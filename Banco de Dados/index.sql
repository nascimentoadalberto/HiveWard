create database HiveWard;
use HiveWard;

create table cadastro (
    idUser int not null primary key auto_increment,
    nome varchar(60) not null,
    email varchar(70) not null,
    senha varchar(40) not null,
    cpfcnpj char(14) not null
);

create table colmeias(
    idColmeias int not null primary key auto_increment,
    endereco varchar(150),
    quantColmeias int,
    idUser int,
    foreign key (idUser) references cadastro(idUser)
);

create table produtos(
    idProduto int primary key not null auto_increment,
    nome varchar(30) not null,
    preco decimal(10,2) not null
);

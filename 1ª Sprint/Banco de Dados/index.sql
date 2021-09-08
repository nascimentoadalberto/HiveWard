create database HiveWard;
use HiveWard;

create table cadastro (
    idUser int primary key auto_increment,
    nome varchar(60) not null,
    email varchar(70) not null,
    senha varchar(40) not null,
    cpfcnpj char(14) not null
);

create table colmeias(
    idColmeias int primary key auto_increment,
    endereco varchar(150),
    quantColmeias int,
    idUser int,
    foreign key (idUser) references cadastro(idUser)
);

create table produtos(
    idProduto int primary key auto_increment,
    nome varchar(30) not null,
    preco decimal(10,2) not null
);

insert into produtos (nome, preco) values ("Placa com sensores", 50.00);
insert into cadastro (nome, email, senha, cpfcnpj) values ("Joaquim Soares", "comercial.joaquimsoares@gmail.com", "456789123", 12345678901);
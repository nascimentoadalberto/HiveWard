create database Cadastro;
use Cadastro;
create table Produtor(
idCPF int primary key,
nome varchar (70),
cep varchar(70),
caixas varchar (70),
produção varchar (70),
produto varchar (70),
espécie varchar (70)
);
select * from Produtor;
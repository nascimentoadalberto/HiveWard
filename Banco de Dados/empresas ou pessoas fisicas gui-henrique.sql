create database Empresas;
use Empresas;
create table Geral(
id int primary key,
nome varchar (70),
fisica_juridica varchar(70),
tamanho_da_empresa varchar (70),
quantidade_de_sensores varchar (70)
);
select * from Geral;
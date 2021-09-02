create database Cadastro;
use Cadastro;
create table Cliente(
id int primary key,
nome_completo varchar (70),
cpf_cnpj varchar(70),
 email varchar (70),
empresa varchar (70),
especie varchar (70)
 );
select * from Cliente;

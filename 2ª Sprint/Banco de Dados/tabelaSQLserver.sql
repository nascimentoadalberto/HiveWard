create table Cliente (
idCliente int primary key ,
Nome varchar(45),
Email varchar(45),
Senha varchar(45),
CPF_CNPJ INT,
Empresa varchar(45)
);

create table Contato(
idRedes_sociais int primary key,
Facebook varchar(45),
Google varchar(45),
Telefone int,
Endereço varchar(45),
fkCliente int,
foreign key (fkCliente) references Cliente (idCliente)
);

create table Usuario(
idUsuario int primary key,
NomeUsuario varchar(45),
Senha  int,
fk_Cliente int,
foreign key (fk_Cliente) references Cliente (idCliente)
);

create table Especies(
idEspecies int primary key,
Nome_popular varchar(45),
Nome_cientifico varchar(45)
);

create table Caixas(
idCaixas int primary key,
fk_cliente int,
fk_especies int,
Nome_colmeia varchar(50),
foreign key (fk_cliente) references Cliente(idCliente),
foreign key (fk_especies) references Especies (idEspecies)
);

create table Medidas(
idMedidas int primary key,
Temp decimal(6,2),
Umid decimal(6,2),
Horario datetime,
fk_caixas int,
foreign key (fk_caixas) references Caixas(idCaixas)
);
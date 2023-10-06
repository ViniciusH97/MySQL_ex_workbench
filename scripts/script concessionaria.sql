create database concessionaria;
use concessionaria;

create table veiculo (
	idVeiculo int,
    idCliente int,
    idFuncionario int,
    tipo varchar(30),
    fabricante varchar(45),
    ano int,
    cor varchar(20),
    preco decimal (10,2),
    modelo varchar(30),
    kilometragem decimal(4.2),
    disponibilidade boolean,
    primary key(idVeiculo),
    foreign key(idCliente) references Cliente (idCliente),
    foreign key(idFuncionario) references funcionario(idFuncionario)
);
    
describe veiculo;

create table cliente (
	idCliente int,
    nome varchar(45),
    telefone varchar(30),
    email varchar(40),
    data_da_compra datetime,
    primary key (idCliente)
);

describe cliente;

create table funcionario (
	idFuncionario int,
    idSetor int, 
    nome varchar(45),
    funcao varchar(45),
    data_de_nascimento datetime,
    telefone varchar(10),
    salario decimal(4,2),
    primary key(idFuncionario),
    foreign key (idSetor) references setor(idSetor)
);
    
describe funcionario;

create table setor (
	idSetor int,
    nome varchar(45),
    primary key (idSetor)
);






    
    
    
    
    
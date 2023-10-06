create database concessionaria;
use concessionaria;

create table carro (
	idCarro int,
    fabricante varchar(45),
    ano datetime,
    cor varchar(20),
    modelo varchar(30),
    kilometragem decimal(4.2),
    primary key(idCarro));
    
describe carro;

create table cliente (
	idCliente int,
    nome varchar(45),
    telefone varchar(30),
    email varchar(40),
    data_da_compra datetime,
    primary key (idCliente));

describe cliente;

create table funcionario (
	idFuncionario int,
    nome varchar(45),
    funcao varchar(45),
    data_de_nascimento datetime,
    telefone varchar(10),
    salario decimal(4,2),
    primary key(idFuncionario));
    
describe funcionario;
    
    
    
    
    
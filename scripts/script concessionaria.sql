create database concessionaria;
use concessionaria;

create table cliente (
	idCliente int,
    nome varchar(45),
    telefone varchar(30),
    email varchar(40),
    data_da_compra datetime,
    primary key (idCliente)
);

create table setor (
	idSetor int,
    nome varchar(45),
    primary key (idSetor)
);

create table funcionario (
	idFuncionario int,
    idSetor int, 
    nome varchar(45),
    funcao varchar(45),
    data_de_nascimento datetime,
    telefone varchar(30),
    salario decimal(5.3),
    primary key(idFuncionario),
    foreign key (idSetor) references setor(idSetor)
);

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
    kilometragem decimal(6.2),
    disponibilidade boolean,
    primary key(idVeiculo),
    foreign key(idCliente) references Cliente (idCliente),
    foreign key(idFuncionario) references funcionario(idFuncionario)
);


    
describe veiculo;
    
select * from veiculo;

insert into setor (idSetor, nome) values (1, 'Vendas');
insert into setor (idSetor, nome) values (2, 'Financeiro');
insert into setor (idSetor, nome) values (3, 'RH');

insert into cliente (idCliente, nome, telefone, email, data_da_compra) 
values (1, 'João da Silva', '+55 35 1234-5678', 'joao@gmail.com', '2023-10-06');

insert into cliente (idCliente, nome, telefone, email, data_da_compra) 
values (2, 'Maria Santos', '+55 35 9876-5432', 'maria@ehotmail.com', '2023-09-30');

insert into cliente (idCliente, nome, telefone, email, data_da_compra) 
values (3, 'Fernando Mathias', '+55 35 9876-5432', 'fernando@ehotmail.com', '2023-09-30');

select * from cliente;

insert into funcionario (idFuncionario, idSetor, nome, funcao, data_de_nascimento, telefone, salario)
values (1, 1, 'Carlos Souza', 'Vendedor', '1985-05-15', '+55 11 99822-3222', 1500.00);

insert into funcionario (idFuncionario, idSetor, nome, funcao, data_de_nascimento, telefone, salario)
values (2, 2, 'Ana Oliveira', 'Analista Financeiro', '1990-03-20', '+55 11 99222-3333', 4000.00);

insert into funcionario (idFuncionario, idSetor, nome, funcao, data_de_nascimento, telefone, salario)
values (3, 1,'Ricardo lima', 'Vendedor', '1981-01-22', '+55 31 99130-7392', 1500.00);

select * from funcionario;

insert into veiculo (idVeiculo, idCliente, idFuncionario, tipo, fabricante, ano, cor, preco, modelo, kilometragem, disponibilidade)
values (1, 2, 1, 'Carro', 'Toyota', 2015, 'Branco', 110000.00, '2.7 SR FLEX Automático', 130000.00, 1);

insert into veiculo (idVeiculo, idCliente, idFuncionario, tipo, fabricante, ano, cor, preco, modelo, kilometragem, disponibilidade)
values (2, 1, 2, 'Caminhão', 'Volvo', 2018, 'Vermelho', 85000.00, 'FH 460', 75000.00, 1);

insert into veiculo (idVeiculo, idCliente, idFuncionario, tipo, fabricante, ano, cor, preco, modelo, kilometragem, disponibilidade)
values (3, 3, 3, 'Moto', 'Honda', 2020, 'Preto', 8000.00, 'CBR 600RR', 12000.00, 1);

select * from veiculo;



create database padaria;
use padaria;

create table Cozinheiro (
 idCozinheiro int,
 Nome varchar(45), 
 Salario decimal(8,2), 
 primary key(idCozinheiro));
 
 describe cozinheiro; # mostra a estrutura da tabela Cozinheiro
 
create table Prato (
idPrato int, 
idCozinheiro int,
Nome varchar(45), 
Preco decimal(8,2), 
primary key(idPrato), 
foreign key (idCozinheiro) references Cozinheiro (idCozinheiro));

create table Produto (
idProduto int,
Nome varchar(45),
QtdeEstoque int,
primary key (IdProduto));

create table Receita (
idPrato int,
idProduto int,
primary key(idPrato),
foreign key (idPrato) references Prato (idPrato),
foreign key (idProduto) references Produto(idProduto));

describe Prato;

insert into Cozinheiro values(1, 'joao', 1200.00);
insert into Cozinheiro values(2, 'Roberto', 1750.50);
insert into Cozinheiro values(3, 'Maria', 1500.30);
select * from Cozinheiro;

insert into Prato values(1, 'coxinha', 3.00);
insert into Prato values(2, 'feijoada', 14.90);
insert into Prato values(3, 'macarrao', 15.00);

select * from prato;

insert into Produto values(1, 'cebola', 30);
insert into Produto values(2, 'feijao', 20);
insert into Produto values(3, 'tomate', 10);

select * from Produto;

insert into Receita values(1, 'cebola', 'ccoxinha');
insert into Receita values(2, 'feijao', 'feijoada');
insert into Receita values(3, 'tomate', 'macarrao');

describe receita;

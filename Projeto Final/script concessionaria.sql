-- Active: 1724073004784@@127.0.0.1@3306@concessionaria

use concessionaria;

# criação do banco de dados

# Inserção dos Setores

select * from setor;
select * from veiculo;
select * from funcionario;
select * from vendas;
select * from cliente;

insert into setor (idSetor, nome) values (1, 'Vendas');
insert into setor (idSetor, nome) values (2, 'Financeiro');
insert into setor (idSetor, nome) values (3, 'RH');
insert into setor (idsetor, nome) values (4, 'Mecanica');
insert into setor (idsetor, nome) values (5, 'Limpeza');

# Inserção de Vendas

describe vendas;
select * from vendas;

insert into vendas values(1, '2024-09-21', 'Venda do Carro SR Flex');
insert into vendas values(2, '2024-09-21', 'Venda do caminhão da Volvo FH 460');
insert into vendas values(3, '2024-03-21', 'Venda da moto Honda CBR 600RR');
insert into vendas values(4, '2024-03-21', 'Venda do Carro Ford Fusion');
insert into vendas values(5, '2024-09-21', 'Venda do Moto Yamaha YZR');
insert into vendas values(6, '2024-03-21', 'Venda da Moto DEF');
insert into vendas values(7, '2024-09-21', 'Venda do Carro GHI');
insert into vendas values(8, '2024-03-21', 'Venda do Caminhão JKL');
insert into vendas values(9, '2024-07-21', 'Venda da Moto MNO');
insert into vendas values(10, '2024-03-21', 'Venda do Carro PQR');

# Inserção dos Clientes

describe cliente;
select * from cliente;

insert into cliente (idCliente, nome, telefone, email, idvendas) 
values (1, 'João da Silva', '+55 35 1234-5678', 'joao@gmail.com', 1);

insert into cliente (idCliente, nome, telefone, email, idvendas) 
values (2, 'Maria Santos', '+55 35 9876-5432', 'maria@ehotmail.com', 2);

insert into cliente (idCliente, nome, telefone, email, idvendas) 
values (3, 'Fernando Mathias', '+55 35 9876-5432', 'fernando@ehotmail.com', 3);

insert into cliente (idCliente, nome, telefone, email, idvendas)
values (4, 'Alex Rast', '+55 35 9876-5432', 'alex@gmail.com', 4);

insert into cliente (idCliente, nome, telefone, email, idvendas)
values (5, 'Paulo Cezar', '+55 35 9876-5432', 'paulo@gmail.com', 5);

insert into cliente (idCliente, nome, telefone, email, idvendas)
values (6, 'Naiara Nogueira', '+55 35 9876-5432', 'naiar1235@gmail.com', 6);

insert into cliente (idCliente, nome, telefone, email, idvendas) 
values (7, 'Pedro Almeida', '+55 35 9876-5432', 'pedro@gmail.com', 7);

insert into cliente (idCliente, nome, telefone, email, idvendas) 
values (8, 'Juliana Costa', '+55 35 9876-5432', 'juliana@ehotmail.com', 8);

insert into cliente (idCliente, nome, telefone, email, idvendas) 
values (9, 'Rafaela Santos', '+55 35 9876-5432', 'rafaela@ehotmail.com', 9);

insert into cliente (idCliente, nome, telefone, email, idvendas)
values (10, 'Gustavo Lima', '+55 35 9876-5432', 'gustavo@gmail.com', 10);

# Inserção dos funcionários

select * from funcionario;

insert into funcionario (idFuncionario, idSetor, nome, funcao, data_de_nascimento, telefone, salario)
values (1, 1, 'Carlos Souza', 'Vendedor', '1985-05-15', '+55 11 99822-3222', 1500.00);

insert into funcionario (idFuncionario, idSetor, nome, funcao, data_de_nascimento, telefone, salario)
values (2, 2, 'Ana Oliveira', 'Analista Financeiro', '1990-03-20', '+55 11 99222-3333', 4000.00);

insert into funcionario (idFuncionario, idSetor, nome, funcao, data_de_nascimento, telefone, salario)
values (3, 1,'Ricardo lima', 'Vendedor', '1981-01-22', '+55 31 99130-7392', 1500.00);

insert into funcionario (idFuncionario, idSetor, nome, funcao, data_de_nascimento, telefone, salario)
values (4, 3, 'Paula Santos', 'Analista de RH', '1995-07-10', '+55 31 99130-7392', 4000.00);

insert into funcionario (idFuncionario, idSetor, nome, funcao, data_de_nascimento, telefone, salario)
values (5, 1, 'Marcos Silva', 'Vendedor', '1985-05-15', '+55 11 99822-3222', 1500.00);

insert into funcionario (idFuncionario, idSetor, nome, funcao, data_de_nascimento, telefone, salario)
values (6, 5, 'Lucas Oliveira', 'Limpeza', '1990-03-20', '+55 11 99222-3333', 4000.00);

insert into funcionario (idFuncionario, idSetor, nome, funcao, data_de_nascimento, telefone, salario)
values (7, 1, 'Ricardo lima', 'Vendedor', '1981-01-22', '+55 31 99130-7392', 1500.00);

insert into funcionario (idFuncionario, idSetor, nome, funcao, data_de_nascimento, telefone, salario)
values (8, 4, 'Paula Santos', 'Mecanico', '1995-07-10', '+55 31 99130-7392', 4000.00);

insert into funcionario (idFuncionario, idSetor, nome, funcao, data_de_nascimento, telefone, salario)
values (9, 3, 'Leandro Naklo', 'Analista de RH', '1985-05-15', '+55 11 99822-3222', 1500.00);

insert into funcionario (idFuncionario, idSetor, nome, funcao, data_de_nascimento, telefone, salario)
values (10, 2, 'Roberto Marques', 'Analista Financeiro', '1990-03-20', '+55 11 99222-3333', 4000.00);

# Inserção dos Veículos

describe veiculo;
select * from veiculo;

-- Inserção dos Veículos (Somente funcionários que são vendedores)
insert into veiculo (idVeiculo, idCliente, idFuncionario, tipo, fabricante, ano, cor, preco, modelo, kilometragem, disponibilidade)
values (1, 1, 1, 'Carro', 'Toyota', 2015, 'Branco', 110000.00, '2.7 SR FLEX Automático', 130000.00, 1);

insert into veiculo (idVeiculo, idCliente, idFuncionario, tipo, fabricante, ano, cor, preco, modelo, kilometragem, disponibilidade)
values (2, 2, 1, 'Caminhão', 'Volvo', 2018, 'Vermelho', 85000.00, 'FH 460', 75000.00, 1);

insert into veiculo (idVeiculo, idCliente, idFuncionario, tipo, fabricante, ano, cor, preco, modelo, kilometragem, disponibilidade)
values (3, 3, 3, 'Moto', 'Honda', 2020, 'Preto', 8000.00, 'CBR 600RR', 12000.00, 1);

insert into veiculo (idVeiculo, idCliente, idFuncionario, tipo, fabricante, ano, cor, preco, modelo, kilometragem, disponibilidade)
values (4, 4, 3, 'Carro', 'Ford', 2017, 'Prata', 50000.00, 'Fusion', 80000.00, 1);

insert into veiculo (idVeiculo, idCliente, idFuncionario, tipo, fabricante, ano, cor, preco, modelo, kilometragem, disponibilidade)
values (5, 5, 1, 'Moto', 'Yamaha', 2019, 'Azul', 10000.00, 'YZF-R6', 15000.00, 1);

insert into veiculo (idVeiculo, idCliente, idFuncionario, tipo, fabricante, ano, cor, preco, modelo, kilometragem, disponibilidade)
values (6, 6, 5, 'Carro', 'Chevrolet', 2016, 'Preto', 40000.00, 'Cruze', 90000.00, 1);

insert into veiculo (idVeiculo, idCliente, idFuncionario, tipo, fabricante, ano, cor, preco, modelo, kilometragem, disponibilidade)
values (7, 7, 5, 'Moto', 'Suzuki', 2018, 'Vermelho', 7000.00, 'GSX-R750', 18000.00, 1);

insert into veiculo (idVeiculo, idCliente, idFuncionario, tipo, fabricante, ano, cor, preco, modelo, kilometragem, disponibilidade)
values (8, 8, 3, 'Carro', 'Volkswagen', 2015, 'Branco', 30000.00, 'Golf', 95000.00, 1);

insert into veiculo (idVeiculo, idCliente, idFuncionario, tipo, fabricante, ano, cor, preco, modelo, kilometragem, disponibilidade)
values (9, 9, 5, 'Moto', 'Kawasaki', 2021, 'Verde', 12000.00, 'Ninja 400', 5000.00, 1);

insert into veiculo (idVeiculo, idCliente, idFuncionario, tipo, fabricante, ano, cor, preco, modelo, kilometragem, disponibilidade)
values (10, 10, 7, 'Carro', 'Hyundai', 2019, 'Prata', 45000.00, 'HB20', 70000.00, 1);


# 5 Perguntas para utilização dos comando inner join, left join e right join

# 1- Quais são os nomes dos clientes e os modelos dos veículos que eles compraram?

select cliente.nome, veiculo.modelo
from cliente
inner join veiculo on cliente.idCliente = veiculo.idCliente;

# 2- Quais são os modelos e os nomes dos clientes que os compraram?

select veiculo.modelo, cliente.nome
from veiculo
left join cliente on veiculo.idCliente = cliente.idCliente;

# 3- Quais são os nomes dos funcionários e os nomes dos setores em que eles trabalham?

select funcionario.nome, setor.nome
from funcionario
inner join setor on funcionario.idsetor = setor.idsetor;

# 4- Quais são os nomes dos funcionários e os nomes dos setores em que eles trabalham? 

select f.nome as 'Nome', s.nome as 'Setor'
from funcionario f
inner join setor s on f.idSetor = s.idSetor;

# 5- Selecione todos os nomes dos clientes e os nomes dos funcionários que os atenderam.

select * from funcionario;

select c.nome as 'Clientes', f.nome as 'Funcionarios'
from cliente c
inner join funcionario f on c.idCliente = f.idFuncionario;

-- VIEWS

-- 1) Quantos carros foram vendidos no mês de setembro com o vendedor Carlos souza

create view vendas_setembro as
select count(*) as quantidade_vendas
from vendas
inner join veiculo on vendas.idvendas = veiculo.idveiculo
inner join funcionario on veiculo.idfuncionario = funcionario.idfuncionario
where month(vendas.data_da_venda) = 9 and funcionario.nome = 'Carlos Souza';

-- 2) Mostre mostre todos os detalhes da venda desde o funcionario, veiculo e cliente.
CREATE VIEW ver_detalhes_vendas AS
SELECT
    v.idVendas AS 'ID Venda',
    c.nome AS 'Nome do Cliente',
    c.telefone AS 'Telefone do Cliente',
    c.email AS 'Email do Cliente',
    ve.tipo AS 'Tipo de Veículo',
    ve.fabricante AS 'Fabricante',
    ve.modelo AS 'Modelo',
    ve.ano AS 'Ano do Veículo',
    ve.preco AS 'Preço',
    f.nome AS 'Vendedor',
    f.telefone AS 'Telefone do Vendedor',
    s.nome AS 'Setor'
FROM
    vendas v
    JOIN cliente c ON v.idVendas = c.idVendas
    JOIN veiculo ve ON c.idCliente = ve.idCliente
    JOIN funcionario f ON ve.idFuncionario = f.idFuncionario
    JOIN setor s ON f.idSetor = s.idSetor;

-- Utilizando a view

select * from vendas_setembro;
select * from ver_detalhes_vendas;

drop view ver_detalhes_vendas -- excluir view

drop view vendas_setembro; -- excluir

-- Subselect

-- 1 Encontrar o nome do funcionário que vendeu o veículo mais caro
select nome
from funcionario
where
    idFuncionario = (
        select idFuncionario
        from veiculo
        order by preco desc
        limit 1
    );

-- 2 encontrar qual cliente comprou o veículo mais caro
select nome
from cliente
where
    idCliente = (
        select idCliente
        from veiculo
        order by preco desc
        limit 1
    );

-- GROUP BY

-- Agrupar o número de vendas por mês
select month(v.data_da_venda) as mes, count(v.idvendas) as total_vendas
from vendas v
group by
    month(v.data_da_venda);

-- agrupar o número de vendas por vendedor
select funcionario.nome, count(vendas.idvendas) as total_vendas
from vendas
inner join veiculo on vendas.idvendas = veiculo.idveiculo
inner join funcionario on veiculo.idfuncionario = funcionario.idfuncionario
group by
    funcionario.nome;

-- UNION 

-- Unir as listas de carros e motos vendidos
select modelo, 'Carro' as tipo
from veiculo
where
    tipo = 'Carro'
union
select modelo, 'Moto' as tipo
from veiculo
where
    tipo = 'Moto';

-- unir as listas de carros e motos vendidos e ordenar por modelo
select modelo, 'Carro' as tipo
from veiculo
where
    tipo = 'Carro'
UNION
select modelo, 'Moto' as tipo
from veiculo
where
    tipo = 'Moto'
order by modelo;

-- Stored Procedures

-- Crie um procedimento que armezena o montante total de vendas por mês.
DELIMITER //

create procedure total_vendas_mes()
begin
    select month(v.data_da_venda) as mes, count(v.idvendas) as total_vendas
    from vendas v
    group by
        month(v.data_da_venda);
end //

-- Rodar o procedure

call total_vendas_mes();

drop procedure total_vendas_mes;

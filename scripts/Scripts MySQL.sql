CREATE DATABASE AULA;
USE AULA;

CREATE TABLE CLIENTE (
IDCLIENTE int, NOME VARCHAR(45), PRIMARY KEY (IDCLIENTE));

DESCRIBE CLIENTE;
SHOW TABLES;

SHOW DATABASES;

INSERT INTO CLIENTE (IDCLIENTE, NOME) #inserir de clientes
VALUES (1, 'Vinicius');               # valores(atributos)

INSERT INTO CLIENTE(IDCLIENTE, NOME)
VALUES (2, "Joao D'agua");

SELECT IDCLIENTE, NOME FROM CLIENTE;
SELECT * FROM CLIENTE; # Mostre(select) todos(*) de(fromm) cliente
-- comentario
# comentario
/* comentario*/

alter table cliente 
add column datanascimento date;

describe cliente;
select datanasicmento from cliente; #consutando apenas datanascimento
update cliente set datanascimento = '19970101' where iDCLIENTE = 1; # sem o where mudara todos os valores da tabela
update cliente set datanascimento = '19890324' where IDCLIENTE = 2;
select * from cliente;

insert into cliente values(3, 'joao joao', 19980802);

select * from cliente;

select * from cliente where idcliente = 3; # select para consultar(confirmar registro) antes de deletar
delete from cliente where idcliente = 3; # deleta o registro 3 da tabela

drop table cliente; # apagar tabela cliente

show tables; # ver tabelas
delete from cliente; # apaga todos os registros da tabela cliente

drop database aula; # deletando o banco de dados aula
show databases; # mostrar todos os banco de dados
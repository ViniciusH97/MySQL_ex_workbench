create database CADFUNDB;

create table CADFUN (
 codfun int,
 nome varchar(40), 
 depto char(2),
 funcao varchar(20),
 salario decimal(10,2),
 data_de_nascimento date,
 primary key(codfun));

describe cadfun;

create table caddep (
 coddep int,
 nome varchar(45),
 codfun int,
 primary key (coddep),
 foreign key (codfun) references cadfun (codfun));

insert into cadfun values(1, 'Lucas', 'lg', 'repositor', 1300.00, 20030823);
insert into cadfun values(2, 'Rodrigo', 'op', 'caixa', 1500.00, 19991211);
insert into cadfun values(3, 'Larissa', 'lg', 'atendente', 1500.00, 20000122);
insert into cadfun values(4, 'Daniel', 'ja', 'gerente', 2600.00, 19880216);
insert into cadfun values(5, 'Paulo', 'ca', 'repositor', 1300.00, 19941110);

insert into caddep values(1, 'Lucas', 4);

select * from cadfun;
select * from caddep;

# alteração da funcao de Daniel

update cadfun set funcao = 'supervisor' where codfun = 4;

select * from cadfun;

delete from cadfun where codfun = 4;

select * from cadfun;
Create database lojat;

use lojat;

create table funcionario (
	idFuncionario int not null,
    Nome varchar(45) null,
    primary key(idFuncionario)
);

create table dependente (
	idDependente int not null,
    idFuncionario int not null,
    Nome varchar(45) null,
    primary key(idDependente),
    foreign key funcionario(idFuncionario)
		references funcionario(idFuncionario)
        on delete no action
        on update no action
);

insert into funcionario values (1,'José Antonio da Silva'); 
insert into funcionario values (2,'Luis Augusto dos Anjos');
insert into funcionario values (3,'Pedro Caetano de Souza');
insert into funcionario values (4,'Ana Maria Ribeiro'); 
insert into funcionario values (5,'Lucia da Costa'); 
insert into dependente values (1,1,'Jose Antonio da Silva Filho'); 
insert into dependente values (2,1,'Jose Luis da Silva Jr'); 
insert into dependente values (3,1,'Josilda da Silva'); 
insert into dependente values (4,2,'Luisa Augusta dos Anjos');

select * from funcionario;
select * from dependente;

Delimiter //
create trigger ExDepFuncionario
after delete on funcionario
for each row

begin
	delete from dependente where idFuncioanrio=old.idFuncionario;
end
//

show triggers;

delete from funcionario where idFuncionario = 1;
	
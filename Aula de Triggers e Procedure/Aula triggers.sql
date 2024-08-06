create database exemplot;

use exemplot;

create table alunos (
	idalunos int not null,
    nome varchar(45),
    primary key (idalunos)
    );
    
create table pontos (
	idalunosp int not null,
    pontos int not null default '0',
    primary key (idalunosp)
    );
    
select * from alunos;
select * from pontos;

Delimiter //
create trigger atribponto
after insert on alunos
for each row
begin

	insert into pontos set 
    idalunosp=new.idalunos, pontos = '0';

end 
//

show triggers; #mostrar os gatilhos

insert into alunos values(1, 'Phillip'); # Criará o aluno 1, chave estrangeira 1 com 0 pontos



-- Active: 1723511489130@@127.0.0.1@3306@exempgatilhoa
CREATE database exempgatilhoa;
USE exempgatilhoa;

-- DDL

CREATE TABLE Funcionario (
 idFuncionario INTEGER NOT NULL,
 NomeFuncionario VARCHAR(45) NULL,
 PRIMARY KEY(idFuncionario)
);

CREATE TABLE Dependente (
 idDependente INTEGER NOT NULL,
 idFuncionario INTEGER NOT NULL,
 NomeDependente VARCHAR(45) NULL,
 PRIMARY KEY(idDependente),
 INDEX Dependente_FKIndex1(idFuncionario),
 FOREIGN KEY(idFuncionario)
 REFERENCES Funcionario(idFuncionario)
 ON DELETE cascade -- mudança para excluir automaticamente o registro
 ON UPDATE NO ACTION
);

-- DML

insert into funcionario values (1,'José Antonio da Silva');
insert into funcionario values (2,'Luis Augusto dos Anjos');
insert into funcionario values (3,'Pedro Caetano de Souza');
insert into funcionario values (4,'Ana Maria Ribeiro');
insert into funcionario values (5,'Lucia da Costa');

insert into dependente values (1,1,'Jose Antonio da Silva Filho');
insert into dependente values (2,1,'Jose Luis da Silva Jr');
insert into dependente values (3,1,'Josilda da Silva');
insert into dependente values (4,2,'Luisa Augusta dos Anjos'); 
insert into dependente values (5,2,'Luis Augusto dos Anjos Jr');
insert into dependente values (6,3,'Pedro Caetano de Souza Filho');
insert into dependente values (7,5,'Lucio da Costa');
insert into dependente values (8,5,'Lucia Maria da Costa');
insert into dependente values (9,5,'Luciano da Costa');
insert into dependente values (10,5,'Luciana da Costa'); 

SELECT * FROM funcionario;
SELECT * FROM dependente;

-- ATIVIDADE

-- Criação da tabela chamada DOCUMENTOS

create table Documentos (
    idDocumento integer not null AUTO_INCREMENT,
    idFuncionario integer not null,
    DataInsercao DATETIME DEFAULT CURRENT_TIMESTAMP,
    primary key(idDocumento),
    Foreign Key (idFuncionario) REFERENCES Funcionario(idFuncionario)
    on delete CASCADE -- deleta automaticamente se o registro for excluido
    on update no action -- quando a tabela funcionario for atualizado não fará mudança na tabela documentos
);

-- TRIGGER para inserir um registro após inserir um funcionario

delimiter //

create trigger cadastro_doc_funcionario
after insert on Funcionario
for each row 
BEGIN   
    insert into Documentos (idFuncionario) values (new.idFuncionario);
END
//

-- Mostrar Gatilhos
show triggers;

-- Ação para testar o gatilho

select * from funcionario;
describe funcionario;

insert into funcionario values (6, "Luigi");
insert into funcionario values (7, "Bruno");

select * from documentos;

-- Criando a tabela de demissao

CREATE TABLE Demissao (
    idDemissao INT NOT NULL AUTO_INCREMENT,
    idFuncionario INT NOT NULL,
    NomeFuncionario VARCHAR(45) not null,
    DataDemissao DATETIME NULL,
    PRIMARY KEY(idDemissao)
);

-- Trigger para inserir um registro na tabela demissao

delimiter //

create trigger registrar_demissao
before delete on funcionario
for each row
BEGIN   
    insert into Demissao (idFuncionario, NomeFuncionario)
    values (old.idfuncionario, old.NomeFuncionario);
end;

//

show triggers;

-- ABRIR COMENTARIO ACIMA  (Excluir linha acima) PARA VERIFICAR INTEGRIDADE/CONSTRAINTS

delete from dependente where idfuncionario = 1;
delete from funcionario where idfuncionario = 1; 
SELECT * FROM funcionario; -- mostrar funcionarios
SELECT * FROM dependente; -- mostrar dependentes

select * from demissao; --  mostrar funcionarios demitidos/excluidos

DROP TRIGGER IF EXISTS registrar_demissao; -- excluir trigger



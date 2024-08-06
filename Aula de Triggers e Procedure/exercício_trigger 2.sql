create database lojat2;

use lojat2;

CREATE TABLE Funcionario ( 
 idFuncionario INTEGER NOT NULL, 
 NomeFuncionario VARCHAR(45) NULL, 
 PRIMARY KEY(idFuncionario) 
); 

CREATE TABLE Documentos ( 
 idFuncionario INTEGER NOT NULL, 
 RG INT(11) NULL, 
 CPF INT(13) NULL, 
 PRIMARY KEY(idFuncionario), 
 INDEX Documentos_FKIndex1(idFuncionario), 
 FOREIGN KEY(idFuncionario) 
 REFERENCES Funcionario(idFuncionario) 
 ON DELETE NO ACTION 
 ON UPDATE NO ACTION 
); 

CREATE TABLE Dependente ( 
 idDependente INTEGER NOT NULL, 
 idFuncionario INTEGER NOT NULL, 
 NomeDependente VARCHAR(45) NULL, 
 PRIMARY KEY(idDependente), 
 INDEX Dependente_FKIndex1(idFuncionario), 
 FOREIGN KEY(idFuncionario) 
 REFERENCES Funcionario(idFuncionario) 
 ON DELETE NO ACTION 
 ON UPDATE NO ACTION 
);

select * from documentos;
select * from funcionario;

DELIMITER //
CREATE TRIGGER inserDoc
AFTER INSERT ON funcionario
FOR EACH ROW
BEGIN
    insert into documentos (idFuncionario) values (new.idFuncionario);
END
//

insert into funcionario values (1, 'Elias');
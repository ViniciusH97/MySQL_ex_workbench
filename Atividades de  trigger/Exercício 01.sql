CREATE TABLE Funcionario (
    idFuncionario INTEGER NOT NULL,
    NomeFuncionario VARCHAR(45) NULL,
    PRIMARY KEY (idFuncionario)
);

CREATE TABLE Dependente (
    idDependente INTEGER NOT NULL idFuncionario INTEGER NOT NULL,
    NomeDependente VARCHAR(45) NULL,
    PRIMARY KEY (idDependente),
    INDEX Dependente_FKIndex1 (idFuncionario),
    FOREIGN KEY (idFuncionario) REFERENCES Funcionario (idFuncionario) ON DELETE NO ACTION ON UPDATE NO ACTION
);

insert into funcionario values (1, 'José Antonio da Silva');

insert into funcionario values (2, 'Luis Augusto dos Anjos');

insert into funcionario values (3, 'Pedro Caetano de Souza');

insert into funcionario values (4, 'Ana Maria Ribeiro');

insert into funcionario values (5, 'Lucia da Costa');

insert into dependente values ( 1, 1, 'Jose Antonio da Silva Filho' );

insert into dependente values (2, 1, 'Jose Luis da Silva Jr');

insert into dependente values (3, 1, 'Josilda da Silva');

insert into dependente values ( 4, 2, 'Luisa Augusta dos Anjos' );

insert into dependente values ( 5, 2, 'Luis Augusto dos Anjos Jr' );

insert into
    dependente
values (
        6,
        3,
        'Pedro Caetano de Souza Filho'
    );

insert into dependente values (7, 5, 'Lucio da Costa');

insert into dependente values (8, 5, 'Lucia Maria da Costa');

insert into dependente values (9, 5, 'Luciano da Costa');

insert into dependente values (10, 5, 'Luciana da Costa');
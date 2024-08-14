create database pizzaria;

use pizzaria;

CREATE TABLE TipoProduto (
    idTipoProduto INT(2) NOT NULL,
    DescTipo VARCHAR(40) NULL,
    PRIMARY KEY (idTipoProduto)
);

CREATE TABLE Pizzaria (
    idPizzaria INTEGER NOT NULL,
    NomePizzaria VARCHAR(40) NULL,
    PRIMARY KEY (idPizzaria)
);

CREATE TABLE Entregador (
    idEntregador INTEGER NOT NULL,
    Nome VARCHAR(40) NULL,
    Salario REAL(8, 2) NULL,
    PRIMARY KEY (idEntregador)
);

CREATE TABLE Cliente (
    idCliente INT(5) NOT NULL,
    idPizzaria INTEGER NOT NULL,
    Nome VARCHAR(40) NULL,
    Telefone INT(8) NULL,
    PRIMARY KEY (idCliente),
    INDEX Cliente_FKIndex1 (idPizzaria),
    FOREIGN KEY (idPizzaria) REFERENCES Pizzaria (idPizzaria) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE Produto (
    idProduto INTEGER NOT NULL,
    idTipoProduto INT(2) NOT NULL,
    Nome VARCHAR(40) NULL,
    preco REAL(8, 2) NULL,
    PRIMARY KEY (idProduto),
    INDEX Produto_FKIndex1 (idTipoProduto),
    FOREIGN KEY (idTipoProduto) REFERENCES TipoProduto (idTipoProduto) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE Pedido (
    idPedido INT(5) NOT NULL,
    idEntregador INTEGER NOT NULL,
    idCliente INT(5) NOT NULL,
    PrecoTotal REAL(8, 2) NULL,
    PRIMARY KEY (idPedido),
    INDEX Pedido_FKIndex1 (idCliente),
    INDEX Pedido_FKIndex2 (idEntregador),
    FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (idEntregador) REFERENCES Entregador (idEntregador) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE PedidoItem (
    idPedido INT(5) NOT NULL,
    idProduto INTEGER NOT NULL,
    Qtde INT(3) NULL,
    Preco REAL(8, 2) NULL,
    PRIMARY KEY (idPedido, idProduto),
    INDEX PedidoItem_FKIndex1 (idPedido),
    INDEX PedidoItem_FKIndex2 (idProduto),
    FOREIGN KEY (idPedido) REFERENCES Pedido (idPedido) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (idProduto) REFERENCES Produto (idProduto) ON DELETE NO ACTION ON UPDATE NO ACTION
);

Insert into pizzaria values (1, 'Pizzaria Bela Massa');

Insert into entregador values (1, 'Pedro', 300);

Insert into entregador values (2, 'Joao', 300);

Insert into tipoproduto values (1, 'Pizzas');

Insert into tipoproduto values (2, 'Bebidas');

Insert into produto values (1, 1, 'Mussarela', 10.00);

Insert into produto values (2, 1, 'Portuguesa', 14.00);

Insert into produto values (3, 1, 'Calabresa', 12.00);

Insert into produto values (4, 1, 'Quatro Queijos', 13.00);

Insert into produto values (5, 2, 'Coca Cola', 3.50);

Insert into produto values ( 6, 2, 'Guarana Antarctica', 2.00 );

Insert into produto values (7, 2, 'Fanta Laranja', 2.50);

Select * from pizzaria;

Select * from entregador;

Select * from tipoproduto;

Select * from produto;

/*
As informações iniciais servem para colocar em funcionamento o sistema. Ou seja, até este instante, a 
pizzaria está organizando suas informações para iniciar seu funcionamento. Depois de geradas estas 
informações, os clientes ligarão solicitando os produtos para a pizzaria. Assim, será realizado o 
cadastro dos mesmos...: 
*/
Insert into cliente values (1, 1, 'Maria', 36452431);

Insert into cliente values (2, 1, 'Jose', 37863422);

Insert into cliente values (3, 1, 'Ana', 39872346);

Select * from cliente;

-- Trigger

delimiter / /

create trigger CalculaPreco before
insert
    on PedidoItem for each row 

begin
set
    new.Preco = new.Qtde * (
        select preco
        from Produto
        where
            idProduto = new.idProduto
    );

end;

/ /

show triggers;

-- Stored Procedure

delimiter / /

create procedure SomaPedido(out valortot real(8,2)) 
begin 
    select sum(Preco) into valortot from pedidoitem; 
    update pedido set precototal= (select @a); 
end;

/ /

call SomaPedido (@a);

show triggers;

DESCRIBE Pedido;

-- Inserindo pedidos

insert into pedido values (1, 1, 1, NULL);

-- inserindo itens do pedido

insert into pedidoitem values (1, 1, 2, null);

insert into pedidoitem values (1, 5, 1, null);

call SomaPedido (@a);

select * from pedido;

-- Exercício

/* O exemplo acima foi realizado com um único pedido dentro da base de dados... Qual seria a 
funcionalidade desta Stored Procedure se houvessem mais pedidos? 
Resposta: Provavelmente a Stored Procedure somaria TODOS os valores contidos na tabela */

DELIMITER / /

create PROCEDURE calcula_total_pedido (IN id_pedido INT)
BEGIN
    DECLARE total_pedido DECIMAL(10,2);
    SELECT SUM(Preco) INTO total_pedido FROM pedidoitem WHERE idPedido = id_pedido;
    UPDATE pedido SET PrecoTotal = total_pedido WHERE idPedido = id_pedido;
END;

/ /

insert into pedido values (2, 1, 2, NULL);

insert into pedidoitem values (2, 2, 1, NULL);

insert into pedidoitem values (2, 3, 1, NULL);

select * from pedido;

call calcula_total_pedido (2);

SELECT * FROM pedido;
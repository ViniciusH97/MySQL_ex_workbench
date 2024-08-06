create database pizzariaexerc;

use pizzariaexerc;

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
    FOREIGN KEY (idTipoProduto) REFERENCES TipoProduto (idTipoProduto) ON DELETE NO ACTION
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

-- Produto
Insert into produto values (1, 1, 'Mussarela', 10.00);

Insert into produto values (2, 1, 'Portuguesa', 14.00);

Insert into produto values (3, 1, 'Calabresa', 12.00);

Insert into produto values (4, 1, 'Quatro Queijos', 13.00);

Insert into produto values (5, 2, 'Coca Cola', 3.50);

Insert into produto values ( 6, 2, 'Guarana Antarctica', 2.00 );

Insert into produto values (7, 2, 'Fanta Laranja', 2.50);

-- Cliente
Insert into cliente values (1, 1, 'Maria', 36452431);

Insert into cliente values (2, 1, 'Jose', 37863422);

Insert into cliente values (3, 1, 'Ana', 39872346);

Select * from pizzaria;

Select * from entregador;

Select * from tipoproduto;

Select * from produto;

# Criação de um gatilho para calcular o preço do item do pedido
create trigger CalculaPreco
BEFORE INSERT ON PedidoItem
for each ROW
BEGIN
    set new.Preco= new.Qtde * (select preco from produto where idProduto = new.idProduto);
END;

# Pedido 1 do cliente 1
insert into pedido (idPedido, idEntregador, idCliente) values(1,1,2);

-- Itens do pedido 1
insert into pedidoItem (idPedido,idProduto,Qtde) values(1,1,2);
insert into pedidoItem (idPedido,idProduto,Qtde) values(1,2,3);
insert into pedidoItem (idPedido,idProduto,Qtde) values(1,6,2);

Select * from pedidoitem;

# Criando um Procedure para calcular o preço total do pedido

DELIMITER //
create procedure CalculaTotalPedido(out valortotal decimal(8,2))
begin
    select sum(preco) into valortotal from pedidoitem;
    update pedido set precototal = (select @a);
end;
//

call CalculaTotalPedido(@a);

# Exercicio O exemplo acima foi realizado com um único pedido dentro da base de dados... Qual seria a
#funcionalidade desta Stored Procedure se houvessem mais pedidos?

# Resposta: A funcionalidade da Stored Procedure seria calcular o preço total de todos os pedidos, e não apenas de um único pedido.

# Portanto, isso poderia ser resolvido utilizando-se de Triggers e/ou Stored Procedures? Como?
# Resposta: Sim, poderia ser resolvido utilizando-se de Triggers e/ou Stored Procedures, pois com eles é possível realizar ações automáticas 
# no banco de dados, como por exemplo, calcular o preço total de todos os pedidos.
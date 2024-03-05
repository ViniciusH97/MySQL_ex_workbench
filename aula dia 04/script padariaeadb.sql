select * from receita;
select * from cozinheiro;
select * from prato;

-- Quais os pratos que cada cozinheiro faz?
select cozinheiro.nome, prato.nome
from cozinheiro
inner join prato on cozinheiro.idcozinheiro = prato.idCozinheiro;


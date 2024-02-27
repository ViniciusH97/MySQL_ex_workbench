select idprato from prato where nome = 'pao de queijo'; -- descobrir o id Pela tabela prato
select idcozinheiro from cozinheiro where id = 9; -- Após encontrar o id do prato 


select * from cozinheiro;
select * from prato;


/*Quais cozinheiros fazem pao de queijo*/

select cozinheiro.nome
from cozinheiro 
inner join prato on prato.idcozinheiro = cozinheiro.idcozinheiro
where prato.nome = 'pao de queijo';

select cozinheiro.nome, prato.nome
from cozinheiro
inner join prato on prato.idcozinheiro = cozinheiro.idcozinheiro;

-- Quais os ingredientes são utilizados para fazer inhoque?

select ingredientes.nome, prato.nome
from receita
inner join receita on receita.idprato = receita.idingredientes;

select ingredientes.nome, prato.nome
from ingredientes
inner join receita on receita.idingredientes = receita.idprato
where ingrediente.nome = 'inhoque';

-- Correção

select prato.nome, ingredientes.nome
from prato
inner join receita on receita.idprato = prato.idprato
inner join ingredientes on ingredientes.idingredientes = receita.idingredientes
where prato.nome = 'nhoque';

-- Quais pratos utilizam ovo em suas receitas

select prato.nome
from prato
inner join receita on receita.idprato = prato.idprato
inner join ingredientes on ingredientes.idIngredientes = receita.idIngredientes
where ingredientes.nome = 'ovo';

-- Quais ingredientes utilizados pelo João e pelo Ricardo?

select ingredientes.nome
from cozinheiro
inner join prato on prato.idcozinheiro = cozinheiro.idcozinheiro
inner join receita on receita.idprato = prato.idprato
inner join ingredientes on ingredientes.idIngredientes = receita.idIngredientes
where cozinheiro.nome = 'joao' or cozinheiro.nome = 'ricardo';

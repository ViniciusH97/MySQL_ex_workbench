-- Exercícios

select * from produto;
select * from unidmedida;
select * from segmento;

-- 1 - Quantos produtos pertencem ao segmento de higiene?
select count(*)produto from produto
inner join segmento on segmento.idsegmproduto = produto.segmento
where descsegmproduto = 'higiene';

-- 2) Quais são os produtos que pertencem ao segmento de Higiene? 
select distinct descproduto from produto
inner join segmento on segmento.idsegmproduto = produto.segmento
where descsegmproduto = 'higiene';

-- 3) Quantos produtos são vendidos em Litros? 
select count(*) produto from produto
inner join unidmedida on produto.unidademedida = unidmedida.idunidmedida
where unidmedida.descrunidmedida = 'Litros';

-- 4) Quais os produtos que são vendidos em Litros?
select distinct descproduto from produto
inner join unidmedida on produto.unidademedida = unidmedida.idunidmedida
where unidmedida.descrunidmedida = 'Litros';

-- 5) Quantos produtos existem nos segmentos de Hortifruti e Carnes?
select count(*) produto from produto
inner join segmento on segmento.idsegmproduto = produto.segmento
where descsegmproduto = 'hortifruti' or descsegmproduto = 'carnes';

-- 6) Quantos produtos são vendidos em Litros?
select count(*) produto from produto
inner join unidmedida on produto.unidademedida = unidmedida.idunidmedida
where unidmedida.descrunidmedida = 'Litros';

-- 7) Quantos produtos são vendidos em Gramas e Kilos?
select count(*) produto from produto
inner join unidmedida on produto.unidademedida = unidmedida.idunidmedida
where unidmedida.siglaunidmedida = "Kg" or unidmedida.siglaunidmedida = "Gr";

-- 8) Quais são os produtos vendidos em Gramas e Kilos?
select distinct descproduto from produto
inner join unidmedida on unidmedida.idunidmedida
where unidmedida.siglaunidmedida = "Gr" or unidmedida.siglaunidmedida = "Kg";

-- 9) Quantos produtos existem no segmento de Mercearia vendidos em gramas?
select count(*) produto from produto
inner join segmento on produto.segmento = segmento.idsegmproduto 
inner join unidmedida on produto.unidademedida = unidmedida.idunidmedida
where segmento.descsegmproduto = "Mercearia" and unidmedida.siglaunidmedida = "Gr";

-- 10) Quantos produtos existem nos segmentos de Mercearia e Bebidas vendidos em litros?
select count(*) produto from produto
inner join segmento on produto.segmento = segmento.idsegmproduto
inner join unidmedida on produto.unidademedida = unidmedida.idunidmedida
where segmento.descsegmproduto = "Mercearia" or segmento.descsegmproduto = "Bebidas"
and unidmedida.siglaunidmedida = "lt";

-- 30) Qual a quantidade de produtos existentes no segmento de Hortifruti?
select count(*) produto from produto
inner join segmento on produto.segmento = segmento.idsegmproduto
where segmento.descsegmproduto = "Hortifruti";

-- 31) Qual a quantidade de produtos vendidos em Gramas, Kilos, Litros e Unidades? 
select count(*) produto from produto
inner join unidmedida on produto.unidademedida = unidmedida.idunidmedida
where unidmedida.descrunidmedida = "Gramas"
or unidmedida.descrunidmedida = "Kilos"
or unidmedida.descrunidmedida = "Litros"
or unidmedida.descrunidmedida = "Unidades";

-- 32) Qual a quantidade de produtos vendidos em 100, 200, 300 e 400 Gramas?
select count(*) produto from produto
inner join unidmedida on produto.unidademedida = unidmedida.idunidmedida
where unidmedida.descrunidmedida = "Gramas" and produto.volume = 100
or produto.volume = 200 or produto.volume = 300 or produto.volume = 400;

-- 33) Qual o preço médio dos produtos do segmento de Higiene, Limpeza e Bebidas, vendidos em 1 Litro? 
select avg(valorunitario) from produto
inner join segmento on produto.segmento = segmento.idsegmproduto
inner join unidmedida on produto.unidademedida = unidmedida.idunidmedida
where segmento.descsegmproduto = "Higiene" or segmento.descsegmproduto = "Limpeza"
or segmento.descsegmproduto = "Bebidas" and unidmedida.descrunidmedida = "Litros";

-- 34) Qual o preço do produtos mais caro do segmento de Limpeza vendido em Litros?
select max(produto.valorunitario) from produto
inner join segmento on produto.segmento = segmento.idsegmproduto
inner join unidmedida on produto.unidademedida = unidmedida.idunidmedida
where segmento.descsegmproduto = "Limpeza" and unidmedida.descrunidmedida = "Litros";

-- 35) Qual o preço do produto mais barato do segmento de Higiene vendido em Rolos?
select min(valorunitario) from produto
inner join segmento on produto.segmento = segmento.idsegmproduto
inner join unidmedida on produto.unidademedida = unidmedida.idunidmedida
where segmento.descsegmproduto = "Higiene" and unidmedida.descrunidmedida = "Rolos";

-- 36) Quais são os produtos vendidos em Litros e Mililitros?
select distinct descproduto from produto
inner join unidmedida on produto.unidademedida = unidmedida.idunidmedida
where unidmedida.descrunidmedida = "Litros" or unidmedida.descrunidmedida = "Mililitros";

-- 37) Quantos são os produtos vendidos em Litros e Mililitros pertencentes ao segmento de Limpeza?
select count(*) descproduto from produto
inner join unidmedida on produto.unidademedida = unidmedida.idunidmedida
inner join segmento on produto.segmento - segmento.idsegmproduto
where unidmedida.descrunidmedida = "Litros" or unidmedida.descrunidmedida = "Mililitros"
and segmento.descsegmproduto = "Limpeza";

-- 38) Quais são os produtos vendidos em 1, 2, 3, e 5 Litros e 200, 300 e 500 Mililitros? 
select distinct descproduto from produto
inner join unidmedida on produto.unidademedida = unidmedida.idunidmedida
where unidmedida.descrunidmedida = "Litros" and unidademedida = 1 or unidademedida = 2
or unidademedida = 3 or unidademedida = 5 or unidmedida.descrunidmedida = "Mililitros" and
unidademedida = 200 or unidademedida = 300 or unidademedida = 500;

-- 39) Exiba o preço do produto mais caro e do mais barato pertencente do segmento de Limpeza?
select
	(select max(valorunitario) from produto
	inner join segmento on produto.segmento = segmento.idsegmproduto
	where segmento.descsegmproduto = "Limpeza") as preco_caro,
	(select min(valorunitario) from produto
	inner join segmento on produto.segmento = segmento.idsegmproduto
	where segmento.descsegmproduto = "Limpeza") as preco_barato;

-- 40) Quantos produtos existem no segmento de Hortifruti e Carnes?
select count(*) produto from produto
inner join segmento on produto.segmento = segmento.idsegmproduto
where segmento.descsegmproduto = "Hortfruti" or segmento.descsegmproduto = "Carnes";

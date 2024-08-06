use supermercado;

-- Quai produto mais caro vendido em 300 gramas?

select produto.descproduto, produto.valorunitario 
from produto
inner join unidmedida on unidmedida.idunidmedida = produto.unidmedida
inner join volume on volume.idvolume = produto.volume
where volume.valorvolume = 'gramas' 
and unidmedida.siglaunidmedida = 'gr';

select * from produto
inner join unidmedida on unidmedida.idunidmedida = produto.unidmedida
inner join volume on volume.idvolume = produto.volume
where volume.valorvolume = 'gramas'
and unidmedida.siglaunidmedida = 'gr';

-- Qual o produto mais barato dentre os segmentos de limpeza e bebidas vendidos em um litro?

select min(produto.valorunitario) 
from produto
inner join segmento on segmento.idsegmproduto = produto.segmento
inner join unidmedida on unidmedida.idunidmedida = produto.unidmedida
inner join volume on volume.idvolume = produto.volume
where segmento.descsegmproduto = 'Limpeza' or segmento.descsegmproduto = 'Bebidas'
and unidmedida.descrunidmedida = 'litros';
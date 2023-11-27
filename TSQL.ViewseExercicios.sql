use Romullus;
-------------------------------------------------------------------------------------
create view vw_mostraPorCidade 
as 
select
	i.ID,
	i.Qtd_Vaga,
	i.Qtd_quarto,
	i.Qtd_suite,
	i.Qtd_banheiro,
	e.Logradouro,
	b.Nome_bairro,
	c.Nome_Cidade
from Imovel i
join Endereco as e 
on i.fk_Endereco_ID = e.ID
join Bairro b 
on e.fk_Bairro_ID = b.ID
join Cidade c 
on b.fk_Cidade_ID = c.ID;
select * from vw_mostraPorCidade where vw_mostraPorCidade.Nome_cidade = '';
drop view vw_mostraPorCidade;
select * from vw_mostraPorCidade;
--------------------------------------------------------------------------------------


create view vw_mostraQtdImovelBairro 
as
select
	i.ID,
	i.Qtd_Vaga,
	i.Qtd_quarto,
	i.Qtd_suite,
	i.Qtd_banheiro,
	e.Logradouro,
	b.Nome_bairro,
	c.Nome_Cidade
from Imovel i
join Endereco as e 
on i.fk_Endereco_ID = e.ID
join Bairro b 
on e.fk_Bairro_ID = b.ID
join Cidade c 
on b.fk_Cidade_ID = c.ID
SELECT COUNT(*) AS Quantidade_Imoveis_Barra_Tijuca
FROM vw_mostraQtdImovelBairro
WHERE Nome_bairro = 'Barra da Tijuca';

--------------------------------------------------------------------------------------

create view vw_mostraQtdImovelTipoAnuncio
as
select
	i.ID,
	i.Qtd_Vaga,
	i.Qtd_quarto,
	i.Qtd_suite,
	i.Qtd_banheiro,
	e.Logradouro,
	b.Nome_bairro,
	c.Nome_Cidade,
	ta.Nome_Tipo_Anuncio
from Imovel i
join Endereco as e 
on i.fk_Endereco_ID = e.ID
join Bairro b 
on e.fk_Bairro_ID = b.ID
join Cidade c 
on b.fk_Cidade_ID = c.ID
join TipoAnuncio ta
on i.fk_TipoAnuncio_ID = i.ID;
select * from vw_mostraQtdImovelTipoAnuncio where Nome_Tipo_Anuncio = 'serviços';

-----------------------------------------------------------------------------------------

create view vw_mostrarCalcularImovelTipoImovel
as
select
	i.ID,
	i.Qtd_Vaga,
	i.Qtd_quarto,
	i.Qtd_suite,
	i.Qtd_banheiro,
	e.Logradouro,
	b.Nome_bairro,
	c.Nome_Cidade,
	ta.Nome_Tipo_Anuncio,
	ti.NomeTipoImovel
from Imovel i
join Endereco as e 
on i.fk_Endereco_ID = e.ID
join Bairro b 
on e.fk_Bairro_ID = b.ID
join Cidade c 
on b.fk_Cidade_ID = c.ID
join TipoAnuncio ta
on i.fk_TipoAnuncio_ID = i.ID
join TipoImovel ti
on i.fk_TipoImovel_ID = i.ID;
SELECT
    ti.NomeTipoImovel AS Tipo_de_Imovel,
    COUNT(i.ID) AS Total_de_Imoveis
FROM
    Imovel i
JOIN
    TipoImovel ti ON i.fk_TipoImovel_ID = ti.ID
GROUP BY
    ti.NomeTipoImovel;

---------------------------------------------------------------------------------------

create procedure DeletarPorCidade
@Cidade int
as 
begin
	delete from Imovel
	where fk_Endereco_ID in
	(select ID from Endereco where fk_Bairro_ID in
	(select ID from Bairro where fk_Cidade_ID = @Cidade));;
end;

exec DeletarPorCidade @Cidade = 1;

-------------------------------------------------------------------------------------- 






select * from Imovel
select * from UF
select * from Bairro
select * from Cidade
select * from Endereco
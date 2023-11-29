use Romullus;
-------------------------------------------------------

create function CalcularValorTotalPorTipo (@TipoImovel int)
return decimal(10,2)
as
begin
	declare @ValorTotal decimal;
	select @ValorTotal = SUM(Valor_imovel)
	from Imovel
	where fk_TipoImovel_ID = @TipoImovelID;

	return @ValorTotal;
end;

select dbo.CalcularValorTotalPorTipo(1) as ValorImoveis;
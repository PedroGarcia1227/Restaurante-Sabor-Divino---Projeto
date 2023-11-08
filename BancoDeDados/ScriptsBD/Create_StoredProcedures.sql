create procedure SabDiv.HistoricoPedidosCliente
	@idCliente
as
begin
	select idPedido as Pedido, M.Metodo as Metodo pagamento, DataEhora, PrecoTotal as Preço total
	from Sab.Div.Pedidos, SabDiv.MetodosDePagamento as M
	where idCliente = @idCliente and idMetodoPagamento = M.idMetodoPagamento
end
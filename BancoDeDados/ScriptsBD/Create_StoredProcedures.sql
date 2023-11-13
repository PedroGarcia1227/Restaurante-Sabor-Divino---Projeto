create procedure SabDiv.HistoricoPedidosCliente
	@idCliente
as
begin
	select idPedido as Pedido, M.Metodo as Metodo pagamento, DataEhora, PrecoTotal as Preço total
	from Sab.Div.Pedidos, SabDiv.MetodosDePagamento as M
	where idCliente = @idCliente and idMetodoPagamento = M.idMetodoPagamento
end



create procedure SabDiv.criarPedido
	@nomeUsuario varchar(100),
	@metodoPagamento varchar(30),
	@dataEhora datetime
as
begin
	declare @idCliente int
	declare @idMetodo int

	select idCliente = @idCliente from SabDiv.Clientes where NomeUsuario = @nomeUsuario
	select idMetodoPagamento = @idMetodo from SabDiv.MetodosDePagamento where Metodo = @metodoPagamento
	if @dataEhora is null set @dataEhora = getdate()

	insert into SabDiv.Pedidos (IdCliente, IdMetodoPagamento, DataEhora)
	values (@idCliente, @metodoPagamento, @dataEhora)
end	
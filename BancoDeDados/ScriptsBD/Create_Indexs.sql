create index ind_ItensDePedidos_IdPedido_IdItemDeCardapio
on SabDiv.ItensDePedidos (IdPedido, IdItemDeCardapio)


create index ind_Pedidos_IdCliente_IdMetodo
on SabDiv.Pedidos (IdCliente, IdMetodo)
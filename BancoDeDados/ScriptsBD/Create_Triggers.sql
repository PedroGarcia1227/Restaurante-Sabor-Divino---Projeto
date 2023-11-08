create trigger SabDiv.trAuditoriaItensDeCardapios
on SabDiv.ItensDeCardapios
after insert, update, delete
as
begin
	declare @acao varchar(10)
	set @acao = 'inser��o'

	if exists(select * from deleted)
	begin
		if exists(select * from inserted)
		set @acao = 'altera��o'
		else
		set @acao = 'remo��o'
	end
	
	declare @linhas int
	set @linhas = @@ROWCOUNT
	insert into SabDiv.AuditoriaItensDeCardapios
	values (@acao, getdate(), @linhas)
end;


create trigger SabDiv.trRestricaoIntegridadeClientes
on SabDiv.Clientes
instead of delete
as
begin
	if exists(select * from deleted d
			  inner join SabDiv.Pedidos p on d.IdCliente = p.IdCliente)
	begin
	THROW 50000, 'Cliente n�o pode ser exclu�do pois h� registros desse cliente', 1
	end

	else
	begin
	delete from SabDiv.Clientes
	where idCliente in (select IdCliente from deleted)
	end
end

create trigger SabDiv.trRestricaoIntegridadeItensDeCardapios
on SabDiv.ItensDeCardapios
instead of delete
as
begin
	if exists(select * from deleted d
			  inner join SabDiv.ItensDeCardapios i on i.IdItemDeCardapio = d.IdItemDeCardapio)
	begin
	THROW 50000, 'Item n�o pode ser exclu�do pois h� registros desse item', 1
	end

	else
	begin
	delete from SabDiv.ItemDeCardapio
	where idItemDeCardapio in (select ItemDeCardapio from deleted)
	end
end
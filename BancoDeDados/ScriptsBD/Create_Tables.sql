create schema SabDiv

create table SabDiv.Clientes(
	IdCliente int identity(1,1) primary key,
	NomeUsuario varchar(100) unique not null,
	Senha varbinary(80) not null
)

create table SabDiv.EnderecosClientes(
	IdEndereco int identity(1,1) primary key,
	IdCliente int foreign key (idCliente) references SabDiv.Clientes(IdCliente),
	Endereco varchar(200) not null,
	CEP char(8) CHECK (CEP like '[0-9][0-9][0-9][0-9][0-9]-[0-9][0-9]')
)

create table SabDiv.AuditoriaItensDeCardapios(
	IdAuditoria int identity(1,1) primary key,
	Acao varchar(10) not null,
	DataEhora datetime not null,
	qtdLinhasAfetadas int not null
)

create table SabDiv.Cardapios(
	IdCardapio int identity(1,1) primary key,
	NomeCardapio varchar(40) not null unique,
	Descricao varchar(300)
)

create table SabDiv.ItensDeCardapios(
	IdItemDeCardapio int identity(1,1) primary key,
	NomeItem varchar(40) not null unique,
	Preco decimal(10,2) not null,
	IdCardapio int foreign key (idCardapio) references SabDiv.Cardapios(IdCardapio),
)

create table SabDiv.MetodosDePagamento(
	IdMetodoPagamento int identity(1,1) primary key,
	Metodo varchar(30) not null
)

create drop table SabDiv.Pedidos(
	IdPedido int identity(1,1) primary key,
	IdCliente int foreign key (idCliente) references SabDiv.Clientes(IdCliente),
	IdMetodoPagamento int foreign key (IdMetodoPagamento) references SabDiv.MetodosDePagamento(IdMetodoPagamento),
	DataEhora datetime not null,
	PrecoTotal decimal(10,2)
)

create drop table SabDiv.ItensDePedidos(
	IdItemPedido int identity(1,1) primary key,
	IdPedido int foreign key (IdPedido) references SabDiv.Pedidos(IdPedido),
	IdItemDeCardapio int foreign key (IdItemDeCardapio) references SabDiv.ItensDeCardapios(IdItemDeCardapio),
	Quantidade int not null
)


drop table SabDiv.AuditoriaItensDeCardapios
drop table SabDiv.ItensDePedidos
drop table SabDiv.ItensDeCardapios
drop table SabDiv.Cardapios
drop table SabDiv.Pedidos
drop table SabDiv.MetodosDePagamento
drop table SabDiv.EnderecosClientes
drop table SabDiv.Clientes
create view SabDiv.itensCardapioLanches
as
select NomeItem, Preco
from SabDiv.ItensDeCardapios
where IdCardapio = 1 and NomeItem <> 'Indisponível'


create view SabDiv.itensCardapioSobremesas
as
select NomeItem, Preco
from SabDiv.ItensDeCardapios
where IdCardapio = 2 and NomeItem <> 'Indisponível'

create view SabDiv.itensCardapioBebidas
as
select NomeItem, Preco
from SabDiv.ItensDeCardapios
where IdCardapio = 3 and NomeItem <> 'Indisponível'
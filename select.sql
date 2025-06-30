-- seleciona 1 e todas as lojas
select *
from lojas
where id = 1;

select *
from lojas;

-- seleciona 1 e todas as categorias
select *
from categorias
where id = 1;

select * 
from categorias;

-- seleciona 1 e todos os carros
select c.id, c.id_categoria + ' - ' + ca.nome, c.id_loja + ' - ' + l.nome, c.marca, c.modelo, c.ano, c.placa, c.cor, c.tipo_combustivel, c.cambio, c.preco
from carros as c
join categorias as ca
on c.id_categoria = ca.id
join lojas as l
on c.id_loja = l.id
where c.id = 1;

select c.id, c.id_categoria + ' - ' + ca.nome, c.id_loja + ' - ' + l.nome, c.marca, c.modelo, c.ano, c.placa, c.cor, c.tipo_combustivel, c.cambio, c.preco
from carros as c
join categorias as ca
on c.id_categoria = ca.id
join lojas as l
on c.id_loja = l.id;

-- seleciona 1 e todos os motoristas
select m.id, m.loja + ' - ' + l.nome, m.nome, m.cpf, m.telefone
from motoristas as m
join lojas as l
on m.loja = l.id
where m.id = 1;

select m.id, m.loja + ' - ' + l.nome, m.nome, m.cpf, m.telefone
from motoristas as m
join lojas as l
on m.loja = l.id;

-- seleciona 1 e todos os clientes
select *
from clientes
where id = 1;

select *
from clientes;

-- seleciona 1 e todos os periodos
select *
from periodos
where id = 1;

select *
from periodos;

-- seleciona 1 e todas as alocacoes
select a.id, a.id_cliente+' - '+cl.nome, a.id_carro+' - '+c.nome,a.id_motorista+' - '+m.nome,a.id_loja+' - '+l.nome,a.data_retirada,a.periodo_alugado+' - '+p.dias
from alocacoes as a
join clientes as cl
on a.id_cliente = cl.id
join carros as c
on a.id_carro = c.id
join motoristas as m
on a.id_motorista = m.id
join lojas as l
on a.id_loja = l.id
join periodos as p
on a.periodo_alugado = p.id
where a.id = 1;

select a.id, a.id_cliente+' - '+cl.nome, a.id_carro+' - '+c.nome,a.id_motorista+' - '+m.nome,a.id_loja+' - '+l.nome,a.data_retirada,a.periodo_alugado+' - '+p.dias
from alocacoes as a
join clientes as cl
on a.id_cliente = cl.id
join carros as c
on a.id_carro = c.id
join motoristas as m
on a.id_motorista = m.id
join lojas as l
on a.id_loja = l.id
join periodos as p
on a.periodo_alugado = p.id;

-- seleciona 1 e todos os pagamentos
select p.id, p.id_cliente+' - '+cl.nome, p.id_alocacao, p.codigo_autorizacao, p.parcelas, p.data_pagamento, p.valor
from pagamentos as p
join clientes as cl
on p.id_cliente = cl.id
where p.id = 1;

select p.id, p.id_cliente+' - '+cl.nome, p.id_alocacao, p.codigo_autorizacao, p.parcelas, p.data_pagamento, p.valor
from pagamentos as p
join clientes as cl
on p.id_cliente = cl.id;
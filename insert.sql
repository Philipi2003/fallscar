-- insercao lojas
insert into lojas
values(null,'lapa','111111','teste1@gmail.com','111111','rua lapa 1','rio de janeiro','rj');
insert into lojas
values(null,'botafogo','22222','teste2@gmail.com','22222','rua lapa 2','rio de janeiro','rj');
insert into lojas
values(null,'caxias','333333','teste3@gmail.com','333333','rua lapa 3','duque de caxias','rj');
-- insercao categorias
insert into categorias
values(null,'esportivo','esportivo');
insert into categorias
values(null,'casual','casual');
insert into categorias
values(null,'suv','suv');
-- insercao carros
insert into carros
values(null,1,1,'audi','cc','2018','aaa1111','branco','gasolina','manual','400.00', 0);
insert into carros
values(null,2,2,'fiat','mobi','2019','aaa2222','vermelho','gasolina','manual','350.00', 0);
insert into carros
values(null,3,3,'fiat','argo','2020','aaa3333','preto','gasolina','automático','380.00', 0);
-- insercao motoristas
insert into motoristas
values(null,'Julião','11111111','11111111',1);
insert into motoristas
values(null,'Walter','222222222','22222222',2);
insert into motoristas
values(null,'Douglas','333333','333333',3);
-- insercao clientes
insert into clientes
values(null,'Rodrigo','444444','444444','rodrigo@gmail.com');
insert into clientes
values(null,'Lucas','55555','55555','lucas@gmail.com');
insert into clientes
values(null,'Gabriela','6666','66666','gabriela@gmail.com');
-- insercao periodos
insert into periodos
values(null,7);
insert into periodos
values(null,15);
insert into periodos
values(null,30);
-- insercao alocacoes
DELIMITER //
create procedure inserirAlocacao(
  in vCliente int,
  in vCarro int,
  in vMotorista int,
  in vLoja int,
  in vData date,
  in vPeriodo int
)
begin
  insert into alocacoes(id_cliente,id_carro,id_motorista,id_loja,data_retirada,periodo_alugado,valor)
  select novo.id_cliente, novo.id_carro, m.id, novo.id_loja, novo.data_retirada, novo.periodo_alugado, c.preco * p.dias
  from (
    select 
      vCliente as id_cliente, 
      vCarro as id_carro, 
      vMotorista as id_motorista, 
      vLoja as id_loja, 
      vData as data_retirada, 
      vPeriodo as periodo_alugado
  ) as novo
  left join carros as c
  on novo.id_carro = c.id
  left join periodos as p
  on novo.periodo_alugado = p.id
  left join motoristas as m
  on novo.id_motorista = m.id
  where 
    exists(select id from clientes as cl where novo.id_cliente = cl.id) and
    exists(select id from carros as ca where novo.id_carro = ca.id) and
    (exists(select id from motoristas as mo where novo.id_motorista = mo.id) or novo.id_motorista = 0) and
    exists(select id from lojas as lo where novo.id_loja = lo.id) and
    exists(select id from periodos as pe where novo.periodo_alugado = pe.id) and
    c.id_loja = novo.id_loja and 
    (m.id = novo.id_loja or novo.id_motorista = 0) and 
    c.manutencao = 0 and
    not exists(
      select a.data_retirada, a.periodo_alugado, a.id_carro, a.id_motorista
      from alocacoes as a 
      left join periodos as ap on a.periodo_alugado = ap.id 
      where (novo.id_carro = a.id_carro or novo.id_motorista = a.id_motorista) and 
      ((novo.data_retirada between a.data_retirada and adddate(a.data_retirada, interval ap.dias day)) or (adddate(novo.data_retirada, interval p.dias day) between a.data_retirada and adddate(a.data_retirada, interval ap.dias day)))
    );
end;
// DELIMITER ;
call inserirAlocacao(1,1,1,1,'2025-06-28',1);
call inserirAlocacao(2,2,0,2,'2025-07-06',2);
call inserirAlocacao(3,3,3,3,'2025-07-21',3);
-- insercao pagamentos
insert into pagamentos(id_cliente, id_alocacao, codigo_autorizacao,parcelas,data_pagamento,valor)
select novo.cliente, novo.alocacao, novo.codigo, novo.parcelas, novo.dt, a.valor
from (select 1 as cliente, 1 as alocacao, '1111111' as codigo, null as parcelas, '2025-05-28' as dt) as novo
join alocacoes as a
on novo.alocacao = a.id;
--
insert into pagamentos(id_cliente, id_alocacao, codigo_autorizacao,parcelas,data_pagamento,valor)
select novo.cliente, novo.alocacao, novo.codigo, novo.parcelas, novo.dt, a.valor
from (select 2 as cliente, 2 as alocacao, '222222' as codigo, 3 as parcelas, '2025-05-28' as dt) as novo
join alocacoes as a
on novo.alocacao = a.id;
--
insert into pagamentos(id_cliente, id_alocacao, codigo_autorizacao,parcelas,data_pagamento,valor)
select novo.cliente, novo.alocacao, novo.codigo, novo.parcelas, novo.dt, a.valor
from (select 3 as cliente, 3 as alocacao, '33333333' as codigo, null as parcelas, '2025-04-28' as dt) as novo
join alocacoes as a
on novo.alocacao = a.id;
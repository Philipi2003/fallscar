-- verifica se o carro está disponível no dia
select c.id_carro
from carros as c
where c.manutencao <> 0 and not exists(
  select *
  from alocacoes as a
  join periodos as p 
  on a.periodo_alugado = p.id
  where c.id = a.id_carro and ('2025-06-28' between a.data_retirada and adddate(a.data_retirada, interval p.dias day))
)

-- verifica se o carro está reservado no dia
select c.id_carro
from carros as c
where exists(
  select *
  from alocacoes as a
  join periodos as p 
  on a.periodo_alugado = p.id
  where c.id = a.id_carro and ('2025-06-28' between a.data_retirada and adddate(a.data_retirada, interval p.dias day))
)

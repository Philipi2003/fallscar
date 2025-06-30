-- atualizando loja
update lojas
set nome = 'catete', endereco = 'rua catete 1'
where id = 2;
-- atualizando carros
update carros
set manutencao = 1
where id = 1;
-- atualizando motoristas
update motoristas
set loja = 3
where id = 1;
-- atualizando clientes
update clientes
set cpf = '444444', telefone = '66666'
where id = 2;
-- atualizando alocações
update alocacoes
set id_cliente = 1
where id = 1;
-- atualizando pagamentos
update pagamentos
set parcelas = 6
where id = 2;
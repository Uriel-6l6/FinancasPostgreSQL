select numero, nome from banco;
select banco_numero, numero, nome from agencia;
-- CET
with tbl_tmp_banco AS(
	select numero, nome
	from banco
)
Select numero, nome 
from tbl_tmp_banco;

-- CET
with params AS(
	select 213 AS banco_numero 
), tbl_tmp_banco AS(
	select numero, nome 
	from banco 
	join params on params.banco_numero = banco.numero
	
)
select numero, nome
from tbl_tmp_banco;

--SUBSELECT

select banco.numero , banco.nome
from banco 
join(
	select 213 AS banco_numero
) params on params.banco_numero = banco.numero;


-- CET 

with cliente_e_transacoes AS (
	select cliente.nome AS cliente_nome,
			tipo_transacao.nome AS tipo_transacao_nome, 
			cliente_transacoes.valor AS tipo_transacao_valor
	from cliente_transacoes
	join cliente on cliente.numero = cliente_transacoes.cliente_numero
	join tipo_transacao on tipo_transacao.id = cliente_transacoes.tipo_transacao_id
	join banco on banco.numero = cliente_transacoes.banco_numero and banco.nome ILIKE '%itaú%'
)
select cliente_nome, tipo_transacao_nome, tipo_transacao_valor
from cliente_e_transacoes;


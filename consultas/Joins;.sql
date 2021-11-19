select numero, nome from banco;

select numero, numero, nome from agencia;

select numero, nome from cliente;

select banco_numero, agencia_numero, numero, digito, cliente_numero from conta_corrente;

select id, nome from tipo_transacao;

select banco_numero, agencia_numero, conta_corrente_numero, conta_corrente_digito, cliente_numero, valor
from cliente_transacoes;

select count(1) from banco; --151

select count (1) from agencia; --296

--296 registros 
select banco.numero, banco.nome, agencia.numero, agencia.nome 
from banco 
join agencia on agencia.banco_numero = banco.numero;

-- bancos com agencias
select count (distinct banco.numero)
from banco 
join agencia on agencia.banco_numero = banco.numero;

select banco.numero, banco.nome, agencia.numero, agencia.nome
from banco
left join agencia on agencia.banco_numero = banco.numero;

select agencia.numero, agencia.nome, banco.numero, banco.nome 
from agencia 
right join banco on banco.numero = agencia.banco_numero;

select banco.numero, banco.nome, agencia.numero, agencia.nome 
from banco 
full join agencia on agencia.banco_numero = banco.numero;


select banco.nome,
		agencia.nome,
		conta_corrente.numero,
		conta_corrente.digito,
		cliente.nome
from banco
join agencia on agencia.banco_numero = banco.numero
join conta_corrente
	-- on conta_corrente.banco_numero = agencia.banco_numero
	on conta_corrente.banco_numero = banco.numero
	and conta_corrente.agencia_numero = agencia.numero
join cliente 
	on cliente.numero = conta_corrente.cliente_numero;

select 	tipo_transacao.id, tipo_transacao.nome,
		cliente_transacoes.id, cliente_transacoes.valor 
from tipo_transacao
join cliente_transacoes on cliente_transacoes.tipo_transacao_id = tipo_transacao.id; 


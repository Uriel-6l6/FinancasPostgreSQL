SELECT numero, nome From banco;
select banco_numero, numero, nome from agencia;
select numero, nome,email from cliente;
select banco_numero, agencia_numero, cliente_numero from cliente_transacoes;

select * from conta_corrente;

select * from information_schema.columns where table_name = 'banco';
select column_name, data_type from information_schema.columns where table_name = 'banco';

-- AVG
-- COUNT (Having)
-- MAX
-- MIN
-- SUM 

Select * from cliente_transacoes;

select avg (valor) from cliente_transacoes;

select count (numero) from cliente;

select count (numero), email from cliente where email ilike '%gmail.com'
group by email;

select max (numero)
from cliente;

select min (numero)
from cliente;

select max (valor)
from cliente_transacoes;

select max (valor), tipo_transacao_id
from cliente_transacoes
group by tipo_transacao_id;

select min (valor), tipo_transacao_id
from cliente_transacoes
group by tipo_transacao_id;

select column_name, data_type from information_schema.columns where table_name = 'cliente_transacoes';

select count (id), tipo_transacao_id
from cliente_transacoes
group by tipo_transacao_id 
having count (id) > 150;

select sum (valor)
from cliente_transacoes;

select sum (valor), tipo_transacao_id
from cliente_transacoes
group by tipo_transacao_id
order by tipo_transacao_id ASC;

select sum (valor), tipo_transacao_id
from cliente_transacoes
group by tipo_transacao_id
order by tipo_transacao_id DESC;

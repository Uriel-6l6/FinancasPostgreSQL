-- views
select numero, nome ativo 
from banco;

create or replace view vw_bancos as (
	select numero, nome, ativo
	from banco
);

select numero, nome, ativo
from vw_bancos;

create or replace view vw_bancos_2 (banco_numero, banco_nome, banco_ativo) AS (
	select numero, nome , ativo
	from banco
);

select banco_numero, banco_nome, banco_ativo
from vw_bancos_2;

insert into vw_bancos_2 (banco_numero, banco_nome, banco_ativo)
values (51, 'bank good ideas ', TRUE);

select banco_numero, banco_nome , banco_ativo from vw_bancos_2 where banco_numero = 51;
select numero, nome, ativo from banco where numero = 51;

update vw_bancos_2 set banco_ativo = false where banco_numero = 51;

select numero, nome, ativo from banco where numero = 51;

delete from vw_bancos_2 where banco_numero = 51;

select numero, nome, ativo from banco where numero = 51;

-- view temporaria (Apenas 'Rodara' nessa sessão)

create or replace temporary view vw_agencia as(
	select nome from agencia
);
select nome from vw_agencia

--WITH OPTIONS

create or replace view vw_bancos_ativos as (
	select numero, nome, ativo
	from banco 
	where ativo is true 
)with local check option;
--erro proposital 
insert into vw_bancos_ativos (numero, nome, ativo) values (51, 'bank good ideas' , FALSE);

create or replace view vw_bancos_com_a as (
	select numero, nome, ativo 
	from vw_bancos_ativos
	where nome ilike 'a%'
) with local check option;

select numero, nome, ativo from vw_bancos_com_a;
insert into vw_bancos_com_a (numero, nome, ativo) values (333,'Alfa beta', true)
select numero, nome, ativo from vw_bancos_com_a;
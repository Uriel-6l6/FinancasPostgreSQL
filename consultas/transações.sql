--transações
select numero, nome, ativo from banco order by numero ASC;

update banco ser ativo = false where numero = 0;

begin;
update banco set ativo = true where numero = 0;
select numero, nome, ativo from banco where numero = 0;
rollback ;

begin;
update banco set ativo = true where numero = 0;
commit;
select numero, nome, ativo from banco order by numero ASC;

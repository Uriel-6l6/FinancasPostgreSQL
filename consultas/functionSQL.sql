--function em SQL
create or replace function func_somar (integer,integer)
returns integer
security definer 
--returns null on null input --retorna valor apenas quando não a nulls
called on null input --retorna valor quando a nulls
language sql 
as $$
	select coalesce ($1,0) + coalesce($2,0) --coalesce retorna o primeiro valor não null
$$;

select func_somar (1,2);

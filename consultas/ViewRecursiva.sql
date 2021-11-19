-- view recursiva
create table if not exists funcionarios (
	id serial,
	nome varchar (50),
	gerente integer,
	primary key (id),
	foreign key (gerente) references funcionarios (id)	
);

insert into funcionarios (nome, gerente) values ('Lucas', null);
insert into funcionarios (nome, gerente) values ('Uriel', 1);
insert into funcionarios (nome, gerente) values ('Martins', 1);
insert into funcionarios (nome, gerente) values ('Alves', 2);
insert into funcionarios (nome, gerente) values ('Luma', 4);

select id, nome, gerente from funcionarios where gerente is null
union all 
select id, nome, gerente from funcionarios where id = 999; --apenas exemplo

create or replace recursive view vw_func (id, gerente, funcionario) as(
	select id, gerente, nome
	from funcionarios
	where gerente is null 
	union all 
	select funcionarios.id, funcionarios.gerente, funcionarios.nome
	from funcionarios
	join vw_func on vw_func.id = funcionarios.gerente
);

select id, gerente, funcionario
from vw_func;

drop table funcionarios cascade ;
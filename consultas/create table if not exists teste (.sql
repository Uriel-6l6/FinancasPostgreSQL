create table if not exists teste (
	id serial primary key,
	nome varchar (50) not null,
	create_at timestamp not null default current_timestamp
);

drop table if exists teste;

create table if not exists teste(
	cpf varchar (11) not null,
	nome varchar (50) not null,
	create_at timestamp not null default current_timestamp,
	primary key (cpf)
);

insert into teste (cpf, nome, create_at)
values ('22344566712', 'Lucas Uriel', '2021-11-11 12:00:00');

insert into teste (cpf, nome, create_at)
values ('22344566712', 'Lucas Uriel', '2021-11-11 12:00:00') on conflict (cpf) do nothing; 

update teste set nome = 'Uriel Lucas' where cpf ='22344566712' ;

select * from teste; 

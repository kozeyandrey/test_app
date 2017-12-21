drop table if exists exchangers;
create table exchangers
(
	id serial not null
		constraint cats_id_pk
			primary key,
	ex_date date not null,
	amount double precision not null
)
;

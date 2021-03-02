create user admin1 with login password '1324';
create user admin2 with login password '4231';
create table sample();
grant all privileges on table sample to admin1;
grant insert, select, update on table sample to admin2;
--1
--clients whom car is fixed 

select * from clients 
join progress on clients.id=progress.client_id where status=true

--2
--emails and cars of clients who are gave their cars to the first mechanic

select email, car, mechanic_id from clients
join mechanics on clients.mechanic_id=mechanics.id where mechanic_id=1

--3
--amount of clients who are repairing their cars with mecahnics whom have 3 clients
select count(*)
from clients
join mechanics on clients.mechanic_id = mechanics.id where clients = 3

--4
--amount of clients with same mechanic
select mechanic_id,count(*) as Amount_of_clients 
from clients 
group by clients.mechanic_id order by Amount_of_clients

--5
--full names, emails and id of mechanics of clients who are driving Camaro car
select full_name, email, mechanic_id
from clients
where car='Camaro'

--6
--change name of client by email
update clients 
set full_name = 'Renamed User' where email = 'bortner1@slate.com'

--7
--amount of clients who are driving RX-8 or Camaro cars
select count(*)
from clients
where car = 'RX-8' or car = 'Camaro'

--8
--names of mechanics of clients who are driving RX-8 or Camaro cars
select mechanics.full_name
from clients
join mechanics on clients.mechanic_id = mechanics.id where clients.car = 'RX-8' or clients.car = 'Camaro'

--9
--change status of repair progress
update progress
set status = true where client_id=7 or client_id=26

--10
--full name of mechanic whom profession is repairing Ford cars
select mechanics.full_name
from mechanics
join profession on mechanics.id=profession.mechanic_id where profession.name='Ford'
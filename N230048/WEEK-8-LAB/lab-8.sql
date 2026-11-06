use gram_panchayat;
show tables;
select * from citizen;
select * from certificate_type;
select * from certificate_application;
select * from panvhayat_office;
set autocommit=0;
select @@autocommit;
start transaction;
update certificate_application 
set application_status='approved'
where application_id=1002;
select * from certificate_application;
rollback;

start transaction;
update certificate_application 
set application_status='removed'
where application_id=1003;
commit;

select * from certificate_application where application_id=1003;

start transaction;
update certificate_application 
set application_status='approved'
where application_id=1002;
rollback;
select * from certificate_application where application_id=1002;

start transaction;
insert into certificate_application values(100,100,"2026-01-01",'welfare','pending',45.00,'gp2022yu',2,3);
select * from certificate_application where application_id=100;
rollback;
select * from certificate_application where application_id=100;

start transaction;
delete from certificate_application where application_id=1004;
rollback;
select * from certificate_application where application_id=1004;

start transaction;
update certificate_application set
application_status='approved'
where application_id=1002;

update certificate_application set fee_paid=25
where application_id=1002;
commit;

# part c savepoints...

start transaction;
update certificate_application set application_status='rejected'
where application_id=1002;
savepoint updated;
update certificate_application set application_status='rejected'
where application_id=1003;
select * from certificate_application;
rollback to updated;
commit;
select * from citizen;
 start transaction;
 insert into citizen values(107,'bot',"2007-01-18",'male',901456723,'student','kornepadu',1,'tirupati');
 savepoint sp1;
 update citizen set address='shareef' where citizen_id=107;
 rollback to sp1;
 
 start transaction;
 update certificate_application set application_status='approved' where application_id=1002;
 savepoint updateee;
 
 update certificate_application set fee_paid=20 where application_id=1003;
 savepoint sp;
 update certificate_application set fee_paid=100 where application_id=1004;
 rollback to updateee;
 
 select * from citizen where citizen_id=109;
 start transaction;
 insert into citizen values(109,'bot dd',"2007-01-18",'male',9014567232,'student','kornepadu',1,'tir\upati');
 savepoint sp;
 update citizen set gender='female' where citizen_id=109;
 savepoint sp1;
 update citizen set address='guntur' where citizen_id=109;
 rollback to sp1;
 commit;
 
 start transaction;
 savepoint sp1;
 update citizen set gender='female' where citizen_id=109;
 savepoint sp2;
 update citizen set address='guntur' where citizen_id=109;
 release savepoint sp1;
 rollback to sp1;
 
 # dcl
 
 create user 'sharef'
 identified by 'noob';
 
 select user,host from mysql.user where user ='clerk';
 grant select 
 on gram_panchayat.certificate_application
 to 'sharef';
 
 show grants for 'sharef';
 
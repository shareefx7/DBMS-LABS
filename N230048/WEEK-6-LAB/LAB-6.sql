-- SQL SUBQUERIES AND NESTED QUERIES ...--
/* UNDERSTANDING THE CONCEPT OF NO,IN,NOT IN,ANY, ALL,JOIN,GROUP BY,HAVING COMMANDS IN SQL...*/

-- A SUBQUERY IS A QUERY WRITTEN INSIDE ANOTHER QUERY ..IT IS CALLED INNER QUERY--
-- SUBQUERIES ARE USEFUL WHEN RESULT OF ONE QUERY IS REQUIRED AS INPUT FOR ANOTHER QUERY --

USE gram_panchayat;
select * from citizen;
select * from certificate_application;
select * from certificate_type;
select * from panchayat_office;

/* syntax for subqueries ..
select column_name
from table_name 
 where
column_name operator 
(select column_name from table_name where condition);
*/
select (select max(application_date) from certificate_application) as latest_application_date;
select application_date as latest_application_date from certificate_application where application_date=(select max(application_date) from certificate_application);

select (select min(application_date) from certificate_application) as latest_application_date;

select *from certificate_application where application_date=(select max(application_date) from certificate_application);

select *from certificate_application where application_date=(select min(application_date) from certificate_application);

select *from citizen where citizen_id in (select citizen_id from certificate_application where application_status="approved");

select *from certificate_application where application_date > (select min(application_date) from certificate_application);

select *from certificate_application where application_date < (select max(application_date) from certificate_application);

select *from citizen where citizen_id in (select citizen_id from certificate_application);

select *from citizen where citizen_id not in (select citizen_id from certificate_application where application_status='Approved');

select *from certificate_type where certificate_type_id in (select certificate_id from certificate_application where application_status='Approved');

select *from certificate_type where certificate_type_id not in (select certificate_id from certificate_application where application_status='Approved');

select *from certificate_application where application_date > (select min(application_date) from certificate_application);

select ct.certificate_name ,ca.application_date from certificate_application as ca join certificate_type as ct on ca.certificate_id = ct.certificate_type_id where ca.application_date=(select max(application_date) from certificate_application);

select ct.certificate_name, count(*) as application_count from certificate_application ca join certificate_type ct on ca.certificate_id = ct.certificate_type_id group by ct.certificate_type_id, ct.certificate_name having count(*) = (select max(application_count) from (select count(*) as application_count from certificate_application group by certificate_id) as counts);

select po.office_name, count(*) as application_count from certificate_application ca join panchayat_office po on ca.office_id = po.office_id group by po.office_id, po.office_name having count(*) = (select max(application_count) from (select count(*) as application_count from certificate_application group by office_id) as counts);

select ct.certificate_name, count(*) as application_count from certificate_application ca join certificate_type ct on ca.certificate_id = ct.certificate_type_id group by ct.certificate_type_id, ct.certificate_name having count(*) > (select avg(application_count) from (select count(*) as application_count from certificate_application group by certificate_id) as counts);

select c.citizen_id, c.full_name, count(ca.application_id) as application_count from citizen c join certificate_application ca on c.citizen_id = ca.citizen_id group by c.citizen_id, c.full_name having count(ca.application_id) > 1;

select po.office_name, count(*) as application_count from certificate_application ca join panchayat_office po on ca.office_id = po.office_id group by po.office_id, po.office_name having count(*) > all (select count(*) from certificate_application group by office_id);

select ct.certificate_name from certificate_application ca join certificate_type ct on ca.certificate_id = ct.certificate_type_id where ca.application_date = (select max(application_date) from certificate_application);

select c.citizen_id, c.full_name, count(ca.application_id) as application_count from citizen c join certificate_application ca on c.citizen_id = ca.citizen_id group by c.citizen_id, c.full_name having count(ca.application_id) > 1;

select application_status, count(*) as application_count from certificate_application group by application_status having count(*) = (select max(application_count) from (select count(*) as application_count from certificate_application group by application_status) as statuscounts);
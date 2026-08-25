use gram_panchayat;
SHOW TABLES;
select * from citizen;
select * from certificate_type;
select * from panchayat_office;
select * from certificate_application;


-- a view is a virtual table created from the result of sql query....--
-- a view does not store a separate copy off the data,it stores the sql query used to retrieve the data--
/*syntax
CREATE VIEW view_name as 
select columns from table_name 
where condition;*/

CREATE VIEW approved_applications as 
select * from certificate_application 
where  application_status='approved';
select * from approved_applications;

/* VIEWS WITH JOINS....*/

CREATE VIEW application_certificate_view as
select a.application_id,c.certificate_name,a.application_date,a.application_status from certificate_application a join certificate_type c on a.certificate_id=c.certificate_type_id;
select * from application_certificate_view order by application_id;

/*VIEWS WITH AGGREGATE FUNCTIONS */
create view certificate_count as 
select certificate_name ,count(*) from certificate_type c join certificate_application a where c.certificate_type_id=a.certificate_id group by certificate_name;
select * from certificate_count;

show full tables where table_type='view';
show create view certificate_count;
drop view certificate_application_count;

/* TASKS ...
      LEVEL-1
 */
 CREATE VIEW displaying_applications as
 select * from certificate_application;
 select * from displaying_applications;
 
 CREATE VIEW aplication_details as
 select a.application_id,c.citizen_id,a.application_status from certificate_application a join citizen c on a.citizen_id=c.citizen_id;
 select * from aplication_details;
 
CREATE VIEW approved_applications as 
select * from certificate_application 
where  application_status='approved';
select * from approved_applications;
 
SHOW FULL TABLES
WHERE table_type='VIEW';


CREATE VIEW CERTIFICATE AS 
select c.certificate_name,a.application_date from certificate_type c join certificate_application a on c.certificate_type_id=a.certificate_id;
select * from certificate;

create view citizenop as 
select c.full_name,a.application_status from citizen c join certificate_application a on c.citizen_id=a.citizen_id;
select * from citizenop;

create view panchayat as 
select a.application_id,p.office_name from panchayat_office p join certificate_application a on a.office_id=p.office_id;
select * from panchayat;

create view count_applications as
select certificate_id,count(*) as no_of_applications from certificate_application group by certificate_id;
select * from count_applications;
-- for certificate_name instead of certifcate_id--
create view count_application as
select c.certificate_name,count(*) as no_of_applications from certificate_type c join certificate_application a on c.certificate_type_id =a.certificate_id group by certificate_name;
select * from count_application order by no_of_applications desc;

CREATE VIEW  recieved_applications as
select p.office_name,count(*) as total_applications from panchayat_office p join certificate_application c on p.office_id=c.office_id group by office_name;
select * from recieved_applications;

CREATE VIEW OFFICE AS
select p.office_name,a.application_id,a.application_status,a.certificate_id,c.certificate_name,ct.full_name from panchayat_office p join certificate_application a on p.office_id=a.office_id join certificate_type c on a.certificate_id=c.certificate_type_id join citizen ct on a.citizen_id=ct.citizen_id;
select * from office;

CREATE VIEW PENDING AS 
select a.application_id,c.certificate_name from certificate_application a join certificate_type c on a.certificate_id=c.certificate_type_id where application_status='pending';
select * from pending;

select application_id from pending;
show create view pending;

-- LEVEL-3--
CREATE VIEW details as
select c.certificate_name,count(*) as application_count from certificate_type c join certificate_application a on c.certificate_type_id=a.certificate_id group by certificate_name;
select * from details;

create view more_one as
select office_name from panchayat_office p join certificate_application a on a.office_id=p.office_id group by office_name having count(*)>1;
select * from more_one;

create view citizen_info as
select ct.full_name,count(*)as no_of_applications from citizen ct join certificate_application a on ct.citizen_id=a.citizen_id group by full_name;
select * from citizen_info order by no_of_applications;

create view approved_info  as
select a.application_id,ct.full_name,c.certificate_name from certificate_application a join citizen ct on a.citizen_id=ct.citizen_id join certificate_type c on a.certificate_id=c.certificate_type_id where application_status='approved';
select * from approved_info;

show full tables where table_type='VIEW';
drop view application_certificate_view;
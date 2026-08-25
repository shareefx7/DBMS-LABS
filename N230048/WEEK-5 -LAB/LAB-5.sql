use gram_panchayat;
show tables;
select * from citizen;
select * from certificate_type;
select * from certificate_application;
select * from panchayat_office;
insert into citizen values(106,"shareef","2007-01-31","male",8142706612,"student","kornepadu",true,"kornepadu");
insert into certificate_application values(1006,105,"2026-01-31","personal","pending",25.31,"gp20260006",2,2),(1007,104,"2026-01-11","personal","pending",25.01,"gp20260007",1,2);
insert into certificate_application values(1008,101,"2026-02-01","residence right","rejected",35.31,"gp20260008",1,1),(1009,103,"2026-11-11","personal","pending",25.01,"gp20260009",6,4);
select count(full_name) from citizen;
select count(*) from certificate_application;
select sum(fee_paid) from certificate_application;
select avg(fee_paid) from certificate_application;
select max(fee_paid) from certificate_application;
select max(application_date) from certificate_application;
select min(fee_paid) from certificate_application;
select min(application_date) from certificate_application;
select application_status, count(*) from certificate_application group by application_status;
select village_name,count(*) from citizen group by village_name;
select certificate_id,office_id,count(*) from certificate_application group by certificate_id,office_id;
select certificate_id,count(*) from certificate_application group by certificate_id having count(*)>1;

-- order by incresing order..
select certificate_id ,count(*) as total_application from certificate_application group by certificate_id order by count(*) ;
-- order by decreasing order
select certificate_id,count(*) from certificate_application group by certificate_id order by count(*) desc;

select village_name,count(*) from citizen group by village_name order by count(*);

select count(*) from certificate_application;
select count(*) from citizen;
select * from citizen;
select count(distinct certificate_name) from certificate_type;
select min(application_date) from certificate_application;
select max(application_date) from certificate_application;
select * from certificate_application;
select application_status,count(*) from certificate_application group by application_status;
select certificate_name,count(*) from certificate_type group by certificate_name;
select office_name,count(*) from panchayat_office group by office_name;
select village_name,count(*) from citizen group by village_name order by count(*);
select application_date,count(*) from certificate_application group by application_date;
select certificate_id,office_id from certificate_application group by certificate_id,office_id;
select c.certificate_name,count(*) from certificate_type ct join certificate_application ca on ca.certificate_id=ct.certificate_type_id group by certificate_id;
select office_name,count(*) from certificate_type ct join certificate_application a on ct.certificate_type_id=a.certificate_id join panchayat_office p on a.office_id=p.office_id group by office_name;
select ct.certificate_name,count(*) from certificate_application a join certificate_type ct on a.certificate_id=ct.certificate_type_id group by ct.certificate_name;
select office_name,count(*)as noofapplications from panchayat_office p join certificate_application ct on p.office_id=ct.office_id group by office_name order by count(*);
select certificate_name,certificate_type_id,count(*) as total from certificate_type ct join certificate_application p on ct.certificate_type_id=p.certificate_id join panchayat_office o on p.office_id=o.office_id group by certificate_name having count(*)>=2;
# simpler version for this ..
select certificate_name,count(*) from certificate_type ct join certificate_application p on ct.certificate_type_id=p.certificate_id group by certificate_id having count(*)>=2;
# if we want only certificate_id...
select certificate_id,count(*) from certificate_application group by certificate_id having count(*)>=2;
select office_id,count(*) from certificate_application group by office_id having count(*)>=2;
# if we want office_name ...
select office_name,count(*) from panchayat_office p join certificate_application a on p.office_id=a.office_id group by office_name having count(*)>=2;
select certificate_id,count(*) as noofapplications from certificate_application group by certificate_id order by count(*) desc;
#if we want certificate_name ...
select certificate_name ,count(*) from certificate_type ct join certificate_application p on ct.certificate_type_id=p.certificate_id group by certificate_name order by count(*) desc;
select office_name,count(*) from panchayat_office o join certificate_application p on o.office_id=p.office_id group by office_name order by count(*);
#without office_name
select office_id,count(*) from certificate_application group by office_id order by count(*);
select certificate_id,count(*) from certificate_application group by certificate_id having count(*)>=2  order by count(*) desc;
# if we want name of the certificate_name....
select certificate_name ,count(*) from certificate_type ct join certificate_application p on ct.certificate_type_id=p.certificate_id group by certificate_name having count(*)>=2 order by count(*) desc;
select certificate_id,office_id,count(*) as total from certificate_application group by certificate_id,office_id order by count(*) desc;
select application_status,count(*) from certificate_application group by application_status order by count(*) desc;
select application_status,count(*) from certificate_application group by application_status order by count(*) ;
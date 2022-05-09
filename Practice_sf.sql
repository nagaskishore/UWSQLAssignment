CREATE or replace transient TABLE electricity_services (
    customer_id varchar(255),
    electricity_service_id varchar(255),
    service_start_date date,
    service_end_date date
);



INSERT INTO electricity_services (customer_id, electricity_service_id, service_start_date, service_end_date)
VALUES 
('A12375', '213409', '2020-01-01', '2019-03-31'),
('A12375', '323789', '2019-01-01', null),
('B76892', '434169', '2019-03-05', '2019-10-22'),
('B76892', '544549', '2019-05-07', null),
('B76893', '654929', '2019-07-09', '2020-10-21'),
('A12377', '765309', '2019-09-10', null),
('B76894', '875689', '2019-11-12', '2020-07-07'),
('A12378', '986069', '2020-01-14', null),
('B76895', '1096449', '2020-03-17', null),
('A12379', '1206829', '2020-05-19', null),
('B76896', null, '2020-07-21', null),
('B76896', '1427589', '2020-09-22', null),
('B76896', '1537969', '2020-11-24', null),
('B76896', '1648349', '2021-01-26', null),
('B76898', null, '2021-01-30', null),
('A12382', '1869109', '2021-02-01', null),
('B76899', '1979489', '2021-02-03', null);


select * from electricity_services;


CREATE OR REPLACE TRANSIENT TABLE mobile_services (
    customer_id varchar(255),
    mobile_number varchar(255),
    service_start_date date,
    service_end_date date
);


INSERT INTO mobile_services (customer_id, mobile_number, service_start_date, service_end_date)
VALUES
('A12375', '07136930534', '2018-01-01', null),
('A12375', '07246930728', '2019-01-01', null),
('B76892', '07356930922', '2019-02-03', '2021-09-07'),
('A12376', '07466931116', '2019-03-08', null),
('B76893', '07576931310', '2019-04-10', '2021-10-21'),
('A12377', '07686931504', '2019-05-13', null),
('B76894', '07796931698', '2019-06-15', null),
('A12378', '07906931892', '2019-07-18', null),
('B76895', '07016932086', '2019-08-20', null),
('A12379', '07126932280', '2019-09-22', null),
('B76896', '07236932474', '2019-10-25', null),
('B76896', '07346932668', '2019-11-27', null);


SELECT * FROM mobile_services;


----------------------
select * from electricity_services;
SELECT * FROM mobile_services;

select count(ELECTRICITY_SERVICE_ID) from electricity_services; --15
SELECT Count(MOBILE_NUMBER) FROM mobile_services; --12
select * from (
select 'electricity_services' as Table_name, count(ELECTRICITY_SERVICE_ID) from electricity_services
union all
select 'mobile_services' as Table_name, Count(MOBILE_NUMBER) FROM mobile_services
);

select sum(services) from (
select  count(ELECTRICITY_SERVICE_ID) as services from electricity_services
union all
select Count(MOBILE_NUMBER) as services FROM mobile_services
);

SELECT COUNT(CUSTOMER_ID) FROM electricity_services; --17
SELECT COUNT(*) FROM electricity_services; --17


select count(CUSTOMER_ID) from mobile_services; --12
select count(*) from mobile_services; --12

select count(*) from (
select CUSTOMER_ID from electricity_services
union all
select CUSTOMER_ID from mobile_services
);

--29


select count(*) from (
select CUSTOMER_ID from electricity_services
union
select CUSTOMER_ID from mobile_services
);


select CUSTOMER_ID from electricity_services where CUSTOMER_ID in (select CUSTOMER_ID from mobile_services); --14
select CUSTOMER_ID from mobile_services where CUSTOMER_ID in (select CUSTOMER_ID from electricity_services); --11
select distinct CUSTOMER_ID from electricity_services where CUSTOMER_ID in (select distinct CUSTOMER_ID from mobile_services);



select * from electricity_services where SERVICE_END_DATE is null and ELECTRICITY_SERVICE_ID is not null;

select extract(year from SERVICE_START_DATE), extract(month from SERVICE_START_DATE)
from electricity_services order by SERVICE_START_DATE;

select 
extract(year from SERVICE_START_DATE) as year,
extract(month from SERVICE_START_DATE) as month, count(*) from 
electricity_services group by year,month order by year,month;

select * from electricity_services;

select last_day(SERVICE_START_DATE,'MONTH') FROM electricity_services;


select last_day(SERVICE_START_DATE,'MONTH') as last_day, count(*) 
from electricity_services where SERVICE_END_DATE is null and ELECTRICITY_SERVICE_ID is not null 
group by last_day order by last_day;

select 
extract(year from SERVICE_START_DATE) as year,
extract(month from SERVICE_START_DATE) as month, count(*) from 
electricity_services where SERVICE_END_DATE is null and ELECTRICITY_SERVICE_ID is not null 
group by year,month order by year,month;


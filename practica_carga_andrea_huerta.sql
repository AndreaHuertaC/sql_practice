--CREACIÓN DEL ESQUEMA

create schema practica authorization phnqlqyj;

--CREACIÓN DE TABLAS Y ASIGNACIÓN DE PRIMARY KEYS Y FOREIGN KEYS
--Tabla Colours
create table practica.colours (
	id_color varchar(4) not null, --PK
	name varchar(200) not null,
	description varchar(512) null);

alter table practica.colours
add constraint colours_PK primary key (id_color); 

--Tabla Companies
create table practica.companies (
	id_company varchar(8) not null, --PK
	name varchar(200) not null,
	description varchar(512) null);

alter table practica.companies
add constraint companies_PK primary key (id_company); 

--Tabla Brands
create table practica.brands (
	id_brand varchar(4) not null, --PK
	name varchar(200) not null,
	id_company varchar(8) not null); --FK

alter table practica.brands
add constraint brands_PK primary key (id_brand); 

alter table practica.brands
add constraint brand_company_FK foreign key (id_company) 
references practica.companies(id_company);

--Tabla Car Models

create table practica.car_models (
	id_model varchar(8) not null, --PK
	name varchar(200) not null,
	id_brand varchar(4) not null); --FK

alter table practica.car_models
add constraint models_PK primary key (id_model); 

alter table practica.car_models
add constraint brand_model_FK foreign key (id_brand) 
references practica.brands(id_brand);

--Tabla Cars

create table practica.cars (
	id_car varchar(10) not null, --PK
	car_registration varchar(10) not null,
	id_color varchar(4) not null, --FK
	id_model varchar(8) not null, --FK
	dt_purchase date not null,
	km float null,
	comments varchar(512) null);

alter table practica.cars
add constraint cars_PK primary key (id_car); 

alter table practica.cars
add constraint cars_colour_FK foreign key (id_color) 
references practica.colours(id_color);

alter table practica.cars
add constraint cars_model_FK foreign key (id_model)
references practica.car_models(id_model);

--Tabla Currencies

create table practica.currencies (
	id_currency varchar(4) not null, --PK
	name varchar(200) not null);

alter table practica.currencies
add constraint currencies_PK primary key (id_currency);

--Tabla Workshops

create table practica.workshops (
	id_workshop varchar(8) not null, --PK
	name varchar(200) not null,
	address varchar(500) not null,
	comments varchar(512) null);

alter table practica.workshops
add constraint workshops_PK primary key (id_workshop);

--Tabla Carchecks

create table practica.carchecks (
	id_carcheck varchar(10) not null, --PK
	id_workshop varchar(8) not null, --FK
	amount float not null,
	id_currency varchar(4) not null, --FK
	comments varchar(512) null);

alter table practica.carchecks
add constraint carchecks_PK primary key (id_carcheck); 

alter table practica.carchecks
add constraint workshop_check_FK foreign key (id_workshop) 
references practica.workshops(id_workshop);

alter table practica.carchecks
add constraint check_currency_FK foreign key (id_currency)
references practica.currencies(id_currency);

--Tabla histórico car_checks

create table practica.hist_car_checks (
	id_car varchar(10) not null, --PK, FK
	id_carcheck varchar(10) not null, --PK, FK
	dt_carcheck date not null,
	km float not null,
	comments varchar(512) null);

alter table practica.hist_car_checks
add constraint hist_car_checks_PK primary key(id_car, id_carcheck);

alter table practica.hist_car_checks
add constraint hist_cars_FK1 foreign key(id_car)
references practica.cars(id_car);

alter table practica.hist_car_checks
add constraint hist_carchecks_FK2 foreign key(id_carcheck)
references practica.carchecks(id_carcheck);

--Tabla coverage type

create table practica.coverage_type (
	id_coverage varchar(4) not null, --PK
	name varchar(200) not null,
	comments varchar(512) null);

alter table practica.coverage_type
add constraint coverage_PK primary key (id_coverage);

--Tabla pólizas

create table practica.insurance_policies (
	id_policy varchar(10) not null, --PK
	n_policy varchar(20) not null,
	id_insurance_company varchar(8) not null, --FK
	premium_amount float not null,
	id_currency varchar(4) not null, --FK
	id_coverage varchar(4) not null, --FK
	comments varchar(512) null);

alter table practica.insurance_policies
add constraint policies_PK primary key (id_policy); 

alter table practica.insurance_policies
add constraint policies_company_FK foreign key (id_insurance_company) 
references practica.companies(id_company);

alter table practica.insurance_policies
add constraint policies_currency_FK foreign key (id_currency)
references practica.currencies(id_currency);

alter table practica.insurance_policies
add constraint policies_coverage_FK foreign key (id_coverage)
references practica.coverage_type(id_coverage);

--Tabla histórico car_policies

create table practica.hist_cars_policies (
	id_car varchar(10) not null, --PK, FK
	id_policy varchar(10) not null, --PK, FK
	dt_start date not null,
	dt_end date null default '4000-12-31',
	comments varchar(512) null);

alter table practica.hist_cars_policies
add constraint hist_car_policies_PK primary key(id_car, id_policy);

alter table practica.hist_cars_policies
add constraint hist_carspolicies_FK1 foreign key(id_car)
references practica.cars(id_car);

alter table practica.hist_cars_policies
add constraint hist_carspolicies_FK2 foreign key(id_policy)
references practica.insurance_policies(id_policy);


--CARGA DATOS
--Tabla colours
insert into practica.colours (id_color, name, description) values('01','BLANCO','');
insert into practica.colours (id_color, name, description) values('02','NEGRO','');
insert into practica.colours (id_color, name, description) values('03','GRIS','');
insert into practica.colours (id_color, name, description) values('04','PLATEADO','');
insert into practica.colours (id_color, name, description) values('05','AZUL','');
insert into practica.colours (id_color, name, description) values('06','ROJO','');

--Tabla Companies

insert into practica.companies (id_company, name, description) values('01','BMW GROUP','');
insert into practica.companies (id_company, name, description) values('02','DAIMLER','');
insert into practica.companies (id_company, name, description) values('03','FCA','');
insert into practica.companies (id_company, name, description) values('04','HYUNDAI','');
insert into practica.companies (id_company, name, description) values('05','RENAULT NISSAN','');
insert into practica.companies (id_company, name, description) values('06','PSA','');
insert into practica.companies (id_company, name, description) values('07','LIBERTY SEGUROS','');
insert into practica.companies (id_company, name, description) values('08','MAPFRE','');
insert into practica.companies (id_company, name, description) values('09','AXA','');
insert into practica.companies (id_company, name, description) values('10','MUTUA MADRILENA','');
insert into practica.companies (id_company, name, description) values('11','PELAYO','');
insert into practica.companies (id_company, name, description) values('12','ALLIANZ','');

-- Tabla Brands
insert into practica.brands (id_brand, name, id_company) values('01','BMW','01');
insert into practica.brands (id_brand, name, id_company) values('02','MINI','01');
insert into practica.brands (id_brand, name, id_company) values('03','MERCEDES','02');
insert into practica.brands (id_brand, name, id_company) values('04','SMART','02');
insert into practica.brands (id_brand, name, id_company) values('05','ALFA ROMEO','03');
insert into practica.brands (id_brand, name, id_company) values('06','CHRISLER','03');
insert into practica.brands (id_brand, name, id_company) values('07','FIAT','03');
insert into practica.brands (id_brand, name, id_company) values('08','JEEP','03');
insert into practica.brands (id_brand, name, id_company) values('09','LANCIA','03');
insert into practica.brands (id_brand, name, id_company) values('10','KIA','04');
insert into practica.brands (id_brand, name, id_company) values('11','HYUNDAI','04');
insert into practica.brands (id_brand, name, id_company) values('12','RENAULT','05');
insert into practica.brands (id_brand, name, id_company) values('13','NISSAN','05');
insert into practica.brands (id_brand, name, id_company) values('14','MITSUBISHI','05');
insert into practica.brands (id_brand, name, id_company) values('15','DACIA','05');
insert into practica.brands (id_brand, name, id_company) values('16','CITROEN','06');
insert into practica.brands (id_brand, name, id_company) values('17','PEUGEOT','06');
insert into practica.brands (id_brand, name, id_company) values('18','OPEL','06');

--Tabla car models
insert into practica.car_models (id_model, name, id_brand) values('01','GIULIETTA','05');
insert into practica.car_models (id_model, name, id_brand) values('02','SERIE 1','01');
insert into practica.car_models (id_model, name, id_brand) values('03','BERLINGO','16');
insert into practica.car_models (id_model, name, id_brand) values('04','DOKKER','15');
insert into practica.car_models (id_model, name, id_brand) values('05','500','07');
insert into practica.car_models (id_model, name, id_brand) values('06','TUCSON','11');
insert into practica.car_models (id_model, name, id_brand) values('07','CHEROKEE','08');
insert into practica.car_models (id_model, name, id_brand) values('08','RIO','10');
insert into practica.car_models (id_model, name, id_brand) values('09','DELTA','09');
insert into practica.car_models (id_model, name, id_brand) values('10','CLASE A','03');
insert into practica.car_models (id_model, name, id_brand) values('11','CABRIO','02');
insert into practica.car_models (id_model, name, id_brand) values('12','ASX','14');
insert into practica.car_models (id_model, name, id_brand) values('13','ARIYA','13');
insert into practica.car_models (id_model, name, id_brand) values('14','ASTRA','18');
insert into practica.car_models (id_model, name, id_brand) values('15','208','17');
insert into practica.car_models (id_model, name, id_brand) values('16','CAPTUR','12');
insert into practica.car_models (id_model, name, id_brand) values('17','FOURFOUR','04');



--Tabla cars
insert into practica.cars (id_car, car_registration, id_color, id_model, dt_purchase, km, comments) values('01','5050MVF','05','05','2012-05-23','71201','');
insert into practica.cars (id_car, car_registration, id_color, id_model, dt_purchase, km, comments) values('02','5847KKM','01','01','2018-05-21','36220','');
insert into practica.cars (id_car, car_registration, id_color, id_model, dt_purchase, km, comments) values('03','9689RIR','06','16','2022-11-23', null, '');
insert into practica.cars (id_car, car_registration, id_color, id_model, dt_purchase, km, comments) values('04','8847EWE','05','15','2008-05-26','105363','');
insert into practica.cars (id_car, car_registration, id_color, id_model, dt_purchase, km, comments) values('05','9963VVC','04','07','2012-05-24','58744','');
insert into practica.cars (id_car, car_registration, id_color, id_model, dt_purchase, km, comments) values('06','8585DDF','01','11','2014-05-20','66121','');
insert into practica.cars (id_car, car_registration, id_color, id_model, dt_purchase, km, comments) values('07','4567SSD','02','08','2012-02-23','88231','');
insert into practica.cars (id_car, car_registration, id_color, id_model, dt_purchase, km, comments) values('08','7414RRE','03','10','2016-01-03','55698','');
insert into practica.cars (id_car, car_registration, id_color, id_model, dt_purchase, km, comments) values('09','9969WWS','05','09','2019-06-23','12636','');
insert into practica.cars (id_car, car_registration, id_color, id_model, dt_purchase, km, comments) values('10','2213FFE','03','03','2020-09-05','10563','');
insert into practica.cars (id_car, car_registration, id_color, id_model, dt_purchase, km, comments) values('11','4469RRX','02','02','2013-07-22','78563','');
insert into practica.cars (id_car, car_registration, id_color, id_model, dt_purchase, km, comments) values('12','7784DDI','04','14','2015-08-27','44174','');
insert into practica.cars (id_car, car_registration, id_color, id_model, dt_purchase, km, comments) values('13','6643KLI','03','13','2017-02-06','16898','');
insert into practica.cars (id_car, car_registration, id_color, id_model, dt_purchase, km, comments) values('14','1130LLP','01','03','2016-09-02','25636','');
insert into practica.cars (id_car, car_registration, id_color, id_model, dt_purchase, km, comments) values('15','3001BUI','06','17','2005-03-24','99585','');
insert into practica.cars (id_car, car_registration, id_color, id_model, dt_purchase, km, comments) values('16','6021IIL','02','12','2006-04-28','80636','');
insert into practica.cars (id_car, car_registration, id_color, id_model, dt_purchase, km, comments) values('17','7733YUH','04','04','2012-11-01','45236','');

-- Tabla currencies
insert into practica.currencies (id_currency, name) values('01','EUR');
insert into practica.currencies (id_currency, name) values('02','GBP');
insert into practica.currencies (id_currency, name) values('03','USD');

--Tabla workshops
insert into practica.workshops (id_workshop, name, address, comments) values('01','TALLER LEVANTE','CALLE LEVANTE 5, MADRID','');
insert into practica.workshops (id_workshop, name, address, comments) values('02','TALLER MANOLO','CALLE COSTOSA 1, LEGANES','');
insert into practica.workshops (id_workshop, name, address, comments) values('03','CARGLASS COMILLAS','CALLE LARGA 55, MADRID','');

--Tabla car checks
insert into practica.carchecks (id_carcheck, id_workshop, amount, id_currency, comments) values('01','01','660','01','');
insert into practica.carchecks (id_carcheck, id_workshop, amount, id_currency, comments) values('02','02','1240','01','');
insert into practica.carchecks (id_carcheck, id_workshop, amount, id_currency, comments) values('03','03','2100','01','');
insert into practica.carchecks (id_carcheck, id_workshop, amount, id_currency, comments) values('04','01','400','01','');
insert into practica.carchecks (id_carcheck, id_workshop, amount, id_currency, comments) values('05','01','630','01','');
insert into practica.carchecks (id_carcheck, id_workshop, amount, id_currency, comments) values('06','02','200','01','');
insert into practica.carchecks (id_carcheck, id_workshop, amount, id_currency, comments) values('07','03','180','01','');

--Tabla historico car checks
insert into practica.hist_car_checks (id_car, id_carcheck, dt_carcheck, km, comments) values('01','01','2022-05-25','70000','');
insert into practica.hist_car_checks (id_car, id_carcheck, dt_carcheck, km, comments) values('02','02','2022-05-26','30000','');
insert into practica.hist_car_checks (id_car, id_carcheck, dt_carcheck, km, comments) values('16','03','2021-05-27','75000','');
insert into practica.hist_car_checks (id_car, id_carcheck, dt_carcheck, km, comments) values('01','04','2020-12-28','50000','');
insert into practica.hist_car_checks (id_car, id_carcheck, dt_carcheck, km, comments) values('17','05','2022-05-29','40000','');
insert into practica.hist_car_checks (id_car, id_carcheck, dt_carcheck, km, comments) values('16','06','2019-05-30','50000','');
insert into practica.hist_car_checks (id_car, id_carcheck, dt_carcheck, km, comments) values('07','07','2022-05-31','85000','');

--Tabla coberturas
insert into practica.coverage_type (id_coverage, name, comments) values('01','Terceros','');
insert into practica.coverage_type (id_coverage, name, comments) values('02','Terceros ampliado','');
insert into practica.coverage_type (id_coverage, name, comments) values('03','Todo riesgo','');

--Tabla pólizas
insert into practica.insurance_policies (id_policy, n_policy, id_insurance_company, premium_amount, id_currency, id_coverage,  comments) values('01','20223696336921','07','500','01','01','');
insert into practica.insurance_policies (id_policy, n_policy, id_insurance_company, premium_amount, id_currency, id_coverage,  comments) values('02','20213696336500','08','785','01','02','');
insert into practica.insurance_policies (id_policy, n_policy, id_insurance_company, premium_amount, id_currency, id_coverage,  comments) values('03','20223696456985','09','966','01','03','');
insert into practica.insurance_policies (id_policy, n_policy, id_insurance_company, premium_amount, id_currency, id_coverage,  comments) values('04','20213696366936','10','1002','01','03','');
insert into practica.insurance_policies (id_policy, n_policy, id_insurance_company, premium_amount, id_currency, id_coverage,  comments) values('05','20223696355588','11','450','01','01','');
insert into practica.insurance_policies (id_policy, n_policy, id_insurance_company, premium_amount, id_currency, id_coverage,  comments) values('06','20203696336603','12','560','01','01','');
insert into practica.insurance_policies (id_policy, n_policy, id_insurance_company, premium_amount, id_currency, id_coverage,  comments) values('07','20223696336900','10','663','01','02','');
insert into practica.insurance_policies (id_policy, n_policy, id_insurance_company, premium_amount, id_currency, id_coverage,  comments) values('08','20223696333333','11','702','01','02','');
insert into practica.insurance_policies (id_policy, n_policy, id_insurance_company, premium_amount, id_currency, id_coverage,  comments) values('09','20213696336921','12','682','01','02','');
insert into practica.insurance_policies (id_policy, n_policy, id_insurance_company, premium_amount, id_currency, id_coverage,  comments) values('10','20193696336921','08','463','01','01','');
insert into practica.insurance_policies (id_policy, n_policy, id_insurance_company, premium_amount, id_currency, id_coverage,  comments) values('11','20333696336500','07','525','01','01','');
insert into practica.insurance_policies (id_policy, n_policy, id_insurance_company, premium_amount, id_currency, id_coverage,  comments) values('12','20333695556500','08','774','01','02','');
insert into practica.insurance_policies (id_policy, n_policy, id_insurance_company, premium_amount, id_currency, id_coverage,  comments) values('13','20333696338877','09','675','01','02','');
insert into practica.insurance_policies (id_policy, n_policy, id_insurance_company, premium_amount, id_currency, id_coverage,  comments) values('14','20444696336500','10','999','01','03','');
insert into practica.insurance_policies (id_policy, n_policy, id_insurance_company, premium_amount, id_currency, id_coverage,  comments) values('15','20333999336500','11','1056','01','03','');
insert into practica.insurance_policies (id_policy, n_policy, id_insurance_company, premium_amount, id_currency, id_coverage,  comments) values('16','20333696339999','12','899','01','03','');
insert into practica.insurance_policies (id_policy, n_policy, id_insurance_company, premium_amount, id_currency, id_coverage,  comments) values('17','20522696336500','10','499','01','01','');
insert into practica.insurance_policies (id_policy, n_policy, id_insurance_company, premium_amount, id_currency, id_coverage,  comments) values('18','20123332165006','11','690','01','02','');
insert into practica.insurance_policies (id_policy, n_policy, id_insurance_company, premium_amount, id_currency, id_coverage,  comments) values('19','20333696338900','12','515','01','01','');
insert into practica.insurance_policies (id_policy, n_policy, id_insurance_company, premium_amount, id_currency, id_coverage,  comments) values('20','21111696336500','08','707','01','02','');
insert into practica.insurance_policies (id_policy, n_policy, id_insurance_company, premium_amount, id_currency, id_coverage,  comments) values('21','21111888336500','08','665','01','02','');
insert into practica.insurance_policies (id_policy, n_policy, id_insurance_company, premium_amount, id_currency, id_coverage,  comments) values('22','21111695996500','08','700','01','02','');


--Tabla histórico coche pólizas
insert into practica.hist_cars_policies (id_car, id_policy, dt_start, dt_end, comments) values('01','07','2012-05-23','2013-05-23','');
insert into practica.hist_cars_policies (id_car, id_policy, dt_start, dt_end, comments) values('01','10','2013-05-23', default,'');
insert into practica.hist_cars_policies (id_car, id_policy, dt_start, dt_end, comments) values('02','18','2018-05-21',default,'');
insert into practica.hist_cars_policies (id_car, id_policy, dt_start, dt_end, comments) values('03','22','2022-11-23',default,'');
insert into practica.hist_cars_policies (id_car, id_policy, dt_start, dt_end, comments) values('04','03','2008-05-26','2009-05-26','');
insert into practica.hist_cars_policies (id_car, id_policy, dt_start, dt_end, comments) values('04','04','2009-05-26',default,'');
insert into practica.hist_cars_policies (id_car, id_policy, dt_start, dt_end, comments) values('05','08','2012-05-24','2016-05-24','');
insert into practica.hist_cars_policies (id_car, id_policy, dt_start, dt_end, comments) values('05','15','2016-05-24',default,'');
insert into practica.hist_cars_policies (id_car, id_policy, dt_start, dt_end, comments) values('06','12','2014-05-20','2020-05-20','');
insert into practica.hist_cars_policies (id_car, id_policy, dt_start, dt_end, comments) values('06','20','2020-05-20',default,'');
insert into practica.hist_cars_policies (id_car, id_policy, dt_start, dt_end, comments) values('07','06','2012-02-23',default,'');
insert into practica.hist_cars_policies (id_car, id_policy, dt_start, dt_end, comments) values('08','14','2016-01-03',default,'');
insert into practica.hist_cars_policies (id_car, id_policy, dt_start, dt_end, comments) values('09','19','2019-06-23',default,'');
insert into practica.hist_cars_policies (id_car, id_policy, dt_start, dt_end, comments) values('10','21','2020-09-05',default,'');
insert into practica.hist_cars_policies (id_car, id_policy, dt_start, dt_end, comments) values('11','11','2013-07-22',default,'');
insert into practica.hist_cars_policies (id_car, id_policy, dt_start, dt_end, comments) values('12','13','2015-08-27',default,'');
insert into practica.hist_cars_policies (id_car, id_policy, dt_start, dt_end, comments) values('13','17','2017-02-06',default,'');
insert into practica.hist_cars_policies (id_car, id_policy, dt_start, dt_end, comments) values('14','16','2016-09-02',default,'');
insert into practica.hist_cars_policies (id_car, id_policy, dt_start, dt_end, comments) values('15','01','2005-03-24','2010-03-24','');
insert into practica.hist_cars_policies (id_car, id_policy, dt_start, dt_end, comments) values('15','05','2010-03-24',default,'');
insert into practica.hist_cars_policies (id_car, id_policy, dt_start, dt_end, comments) values('16','02','2006-04-28',default,'');
insert into practica.hist_cars_policies (id_car, id_policy, dt_start, dt_end, comments) values('17','09','2012-11-01',default,'');
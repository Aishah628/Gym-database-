create database GYM
use GYM 

create table Trainers(T_ID char(15) primary key , T_name varchar(20)not null , email varchar not null unique , sex char , join_Date date not null , experience_in_year int , salary decimal(7,2));

create table Phone (phone_no varchar(10) not null , Trainer_ID char(15) not null ,primary key (phone_no,Trainer_ID), foreign key (Trainer_ID) references Trainers(T_ID) on delete cascade );

create table Subscriptions (sub_id char (15) primary key , price int not null , duration_in_months int not null , no_subscribed int );

create table Members (Mem_ID char(15) primary key ,phone varchar(10) not null , M_name varchar(20) not null , start_datee date not null ,Trainer_ID char(15), gender char , weight_in_kg decimal(3,1), height_in_cm decimal(4,1),date_of_brith date not null , email_id varchar not null unique , pack_id char(15)  foreign key references Subscriptions (sub_id) on delete no action , end_date date not null ,  foreign key (Trainer_ID) references Trainers(T_ID) on delete set null);

create table Merchandise( Merch_ID char(15) primary key , color varchar(20) not null, price int not null , typee varchar(10), no_sold int , no_in_stock int );

create table Exercises(Ex_ID char(15) primary key , ex_name varchar(20) not null , typee varchar(16), time_solt time , no_attending int );

create table Equipments( Eq_ID char(15) primary key , quantity int , cost int , eq_name varchar(15) not null);

create table Consist(Pack_ID char(15), EX_ID char(15) primary key (Pack_ID,EX_ID) , foreign key (Pack_ID) references Subscriptions (sub_id) on delete cascade ,foreign key (EX_ID) references Exercises(Ex_ID) on delete cascade);

create table Buy(Member_ID char (15), Mer_ID char(15),primary key (Member_ID,Mer_ID ), foreign key (Member_ID)references  Members (Mem_ID) on delete cascade, foreign key (Mer_ID) references  Merchandise( Merch_ID)on delete cascade);  

create table Conduct(Exercis_ID char(15) ,Trainer_ID char(15) , primary key(Exercis_ID,Trainer_ID) , foreign key (Exercis_ID) references  Exercises(Ex_ID) on delete cascade,foreign key (Trainer_ID) references  Trainers(T_ID)on delete cascade);   

create table Uses (Member_ID char (15),Equipment_ID char(15),primary key (Member_ID,Equipment_ID ), foreign key (Member_ID)references  Members(Mem_ID) on delete cascade,foreign key (Equipment_ID) references  Equipments( Eq_ID )on delete cascade);

create table Takeup (Member_ID char (15),Exercis_ID char(15),primary key (Member_ID,Exercis_ID ),  foreign key (Member_ID)references  Members (Mem_ID) on delete cascade,foreign key (Exercis_ID) references  Exercises(Ex_ID) on delete cascade  );   

Alter table  Members add check(phone between '0500000000' and '0599999999');
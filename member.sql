create table member(
    id varchar(50) not null primary key,
    passwd varchar(16) not null,
    name varchar(10) not null,
    birth varchar(10) not null,
    gender varchar(10) not null,
    postcode varchar(10) not null,
    addr1 varchar(20) not null,
    addr2 varchar(20) not null,
    reg_date datetime not null
);
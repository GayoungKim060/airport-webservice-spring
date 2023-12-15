DROP TABLE if EXISTS airline;
CREATE TABLE airline(
    id int auto_increment primary key,
    takeoffDate date,
    airline varchar(200),
    flightName varchar(10),
    flightNum varchar(10),
    dest varchar(200),
    takeoffTime time,
    gateAlpha char(1) default 'A',
    gateNum varchar(5) default 0,
    takeoffTimeNew time,
    remark varchar(100),
    managerTel varchar(50),
    note varchar(200),
    regdate timestamp default current_timestamp
);

-- Seed Data --
insert into airline(takeoffDate, airline, flightName, flightNum, dest, takeoffTime, gateAlpha, gateNum, takeoffTimeNew, remark)
values ('2023-11-05', 'Korean', 'KA', '11023', 'Beijing', '08:10', 'A', '17', NULL , 'Boarding'),
       ('2023-11-05', 'Asiana', 'AA', '21000', 'Hanoi', '08:00', 'C', '8', NULL , 'Boarding'),
       ('2023-11-05', 'Delta', 'DA', '31033', 'Los Angeles', '08:07', 'A', '2', '08:10' , 'Delayed'),
       ('2023-11-05', 'Korean', 'KA', '14033', 'London', '08:10', 'A', '3', NULL , 'Boarding'),
       ('2023-11-05', 'Korean', 'KA', '15023', 'New York', '08:16', 'A', '5', NULL , 'Boarding'),
       ('2023-11-12', 'Qatar', 'QA', '30023', 'Pyongyang', '08:20', 'C', '9', NULL , 'Cancelled'),
       ('2023-11-12', 'Korean', 'KA', '20015', 'Roma', '08:22', 'A', '11', '08:25' , 'Delayed'),
       ('2023-11-12', 'Delta', 'DA', '10227', 'Tokyo', '08:22', 'B', '2', NULL , 'Scheduled'),
       ('2023-11-12', 'Asiana', 'DA', '10227', 'Berlin', '08:25', 'B', '07', NULL , 'Scheduled'),
       ('2023-11-12', 'Qatar', 'DA', '10227', 'Tokyo', '08:25', 'C', '3', NULL , 'Scheduled');

insert into airline(takeoffDate, airline, flightName, flightNum, dest, takeoffTime, gateAlpha, gateNum, takeoffTimeNew, remark, managerTel, note)
values ('2023-12-17', 'Qatar', 'QA', '22045', 'German', '09:10', 'B', '5', NULL , 'Boarding', '010-1111-2222', 'BTS celebritiy security'),
       ('2023-12-17', 'Delta', 'DA', '31033', 'London', '09:15', 'A', '12', NULL , 'Boarding', '010-0000-0001', '15 VIP first guests'),
       ('2023-12-17', 'Korean', 'KA', '11023', 'New York', '09:17', 'A', '08', NULL , 'Boarding', '010-1222-2223', 'Shwan Mendes celebrity security'),
       ('2023-12-17', 'Asiana', 'AA', '21000', 'Hanoi', '09:20', 'A', '17', '09:30' , 'Delayed', '010-3333-2222', 'For president'),
       ('2023-12-17', 'Asiana', 'AA', '21000', 'Dubai', '09:22', 'A', '17', NULL , 'Boarding', '010-4444-2222', 'For fake president'),
       ('2023-12-17', 'Qatar', 'QA', '22045', 'Roma', '09:30', 'A', '4', NULL , 'Boarding', '010-5555-2222', '20 VIP first guests from India'),
       ('2023-12-17', 'Delta', 'DA', '10227', 'Beijing', '09:43', 'A', '14', '09:55' , 'Delayed' , '010-6666-2222', 'Disabled service provided'),
       ('2023-12-17', 'Asiana', 'KA', '11023', 'Pyongyang', '09:50', 'A', '17', NULL , 'Scheduled', '010-7777-2222', 'BTS celebrity security'),
       ('2023-12-17', 'Qatar', 'QA', '30023', 'Tokyo', '10:05', 'B', '3', NULL , 'Scheduled', '010-8888-2222', 'preminum cooking service'),
       ('2023-12-17', 'Asiana', 'AA', '21000', 'German', '10:15', 'B', '7', NULL , 'Scheduled', '010-1111-2222', 'Disabled service provided');

-- Query --

SELECT * FROM airline;

select * from airline where managerTel='';
update airline set takeoffTimeNew = NULL where id=30;
update airline set airline='Delta',
                   select * from airline where takeoffTimeNew = 'NULL';

SELECT * from airline where remark = 'Boarding';
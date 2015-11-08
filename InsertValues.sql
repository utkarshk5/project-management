delete from users;
delete from teams;
delete from tasks;
delete from teamAssign;
delete from taskAssign;

BEGIN;

insert into teams values( DEFAULT, 0, 'Admin');
insert into teams values( DEFAULT, 1, 'Research');
insert into teams values( DEFAULT, 2, 'Development');

insert into users values( DEFAULT, 'admin', 'root', 'admin@admin.com', '9999999999', 'Admin address', 0);

insert into users values( DEFAULT, 'Suresh', 'sureshIsAwesome', 'suri@gmail.com', '8008012345', '123, Suresh house, Lajpat Nagar, Delhi', 1);
insert into users values( DEFAULT, 'Rohit', 'rohitRoxxx', 'sharma12@hotmail.com', '9978711242', '22, Koti Boti road, Parel, Mumbai', 1);

insert into users values( DEFAULT, 'Wood', 'pass1', 'sureshKaPattha@hotmail.com', '9878711242', '12, Koti Boti road, Parel, Mumbai', 2);
insert into users values( DEFAULT, 'Yu', 'pass2', 'yu@hotmail.com', '9778711242', '32, Koti Boti road, Parel, Mumbai', 2);
insert into users values( DEFAULT, 'Steel', 'pass3', 'steel@hotmail.com', '9678711242', '42, Koti Boti road, Parel, Mumbai', 2);
insert into users values( DEFAULT, 'Luv', 'pass4', 'luv@hotmail.com', '9578711242', '52, Koti Boti road, Parel, Mumbai', 2);

insert into users values( DEFAULT, 'Mi', 'pass1', 'sharma1@hotmail.com', '9478711242', '62, Koti Boti road, Parel, Mumbai', 2);
insert into users values( DEFAULT, 'Da', 'pass2', 'sharma2@hotmail.com', '9378711242', '72, Koti Boti road, Parel, Mumbai', 2);
insert into users values( DEFAULT, 'Sam', 'pass3', 'sharma3@hotmail.com', '9278711242', '82, Koti Boti road, Parel, Mumbai', 2);

insert into teamAssign values(1,1);
insert into teamAssign values(1,2);
insert into teamAssign values(1,3);

insert into teamAssign values(2,2);
insert into teamAssign values(2,4);
insert into teamAssign values(2,5);
insert into teamAssign values(2,6);
insert into teamAssign values(2,7);

insert into teamAssign values(3,3);
insert into teamAssign values(3,8);
insert into teamAssign values(3,9);
insert into teamAssign values(3,10);


insert into tasks values(  DEFAULT, 1, 1, NULL, 'Admin wala Task', 'The main task', '1999-01-08', '0', 'none' );
insert into tasks values(  DEFAULT, 1, 1, 1, 'Research Task', 'The research part of the job', '1999-01-08', '0', 'none' );
insert into tasks values(  DEFAULT, 1, 1, 1, 'Development Task', 'The dev part of the job', '1999-01-08', '0', 'none' );

insert into tasks values(  DEFAULT, 2, 2, 2, 'Research Sub Task 1', 'The dev part of the job', '1999-01-08', '1', 'none' );
insert into tasks values(  DEFAULT, 2, 2, 2, 'Research Sub Task 2', 'The dev part of the job', '1999-01-08', '0', 'none' );

insert into tasks values(  DEFAULT, 3, 3, 3, 'Dev Sub Task 1', 'The dev part of the job', '1999-01-08', '1', 'none' );
insert into tasks values(  DEFAULT, 3, 3, 3, 'Dev Sub Task 2', 'The dev part of the job', '1999-01-08', '0', 'none' );

insert into taskAssign values(1,1);
insert into taskAssign values(2,2);
insert into taskAssign values(3,3);

insert into taskAssign values(4,4);
insert into taskAssign values(4,5);

insert into taskAssign values(5,5);
insert into taskAssign values(5,6);
insert into taskAssign values(5,7);

insert into taskAssign values(6,8);
insert into taskAssign values(6,9);

insert into taskAssign values(7,9);
insert into taskAssign values(7,10);

insert into resources values(DEFAULT,'file1','data1');

insert into resourceAssign values(1,1);
COMMIT;
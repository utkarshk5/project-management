delete from users;
delete from teams;
delete from tasks;
delete from teamAssign;
delete from taskAssign;
-- delete from subtasks;
-- delete from assigned;

BEGIN;

insert into teams values( 0, 0, 'Admin');
insert into teams values( 1, 1, 'Research');
insert into teams values( 2, 2, 'Development');

insert into users values( 0, 'admin', 'root', 'admin@admin.com', '9999999999', 'Admin address', 0, 'Whos your bitch?', 'ck');

insert into users values( 1, 'Suresh', 'sureshIsAwesome', 'suri@gmail.com', '8008012345', '123, Suresh house, Lajpat Nagar, Delhi', 1, 'What am I?', 'question');
insert into users values( 2, 'Rohit', 'rohitRoxxx', 'sharma12@hotmail.com', '9978711242', '22, Koti Boti road, Parel, Mumbai', 1, 'You cant keep this until you have given it.', 'promise');

insert into users values( 3, 'Wood', 'pass1', 'sureshKaPattha@hotmail.com', '9878711242', '12, Koti Boti road, Parel, Mumbai', 2, 'Some months have 30 days, some months have 31 days; how many have 28?', '12');
insert into users values( 4, 'Yu', 'pass2', 'yu@hotmail.com', '9778711242', '32, Koti Boti road, Parel, Mumbai', 2, 'Take off my skin -- I wont cry, but you will! What am I?', 'onion');
insert into users values( 5, 'Steel', 'pass3', 'steel@hotmail.com', '9678711242', '42, Koti Boti road, Parel, Mumbai', 2, 'The more it dries, the wetter it gets. What is it?', 'towel');
insert into users values( 6, 'Luv', 'pass4', 'luv@hotmail.com', '9578711242', '52, Koti Boti road, Parel, Mumbai', 2, 'What grows when it eats, but dies when it drinks?', 'fire');

insert into users values( 7, 'Mi', 'pass1', 'sharma1@hotmail.com', '9478711242', '62, Koti Boti road, Parel, Mumbai', 2, 'You play with me at night before going to sleep. You can’t get caught fiddling with me at work. You only let a select few people touch me. What am I?', 'phone');
insert into users values( 8, 'Da', 'pass2', 'sharma2@hotmail.com', '9378711242', '72, Koti Boti road, Parel, Mumbai', 2, 'What’s long and hard and has cum in it?', 'cucumber');
insert into users values( 9, 'Sam', 'pass3', 'sharma3@hotmail.com', '9278711242', '82, Koti Boti road, Parel, Mumbai', 2, 'I come in a lot of different sizes. Sometimes, I drip a little. If you blow me, it feels really good. What am I?', 'nose');

insert into teamAssign values(0,0);
insert into teamAssign values(0,1);
insert into teamAssign values(0,2);

insert into teamAssign values(1,1);
insert into teamAssign values(1,3);
insert into teamAssign values(1,4);
insert into teamAssign values(1,5);
insert into teamAssign values(1,6);

insert into teamAssign values(2,2);
insert into teamAssign values(2,7);
insert into teamAssign values(2,8);
insert into teamAssign values(2,9);


insert into tasks values(  0, 0, 0, NULL, 'Admin wala Task', 'The main task', '1999-01-08', '0', 'none' );
insert into tasks values(  1, 0, 0, 0, 'Research Task', 'The research part of the job', '1999-01-08', '0', 'none' );
insert into tasks values(  2, 0, 0, 0, 'Development Task', 'The dev part of the job', '1999-01-08', '0', 'none' );

insert into tasks values(  3, 1, 1, 1, 'Research Sub Task 1', 'The dev part of the job', '1999-01-08', '1', 'none' );
insert into tasks values(  4, 1, 1, 1, 'Research Sub Task 2', 'The dev part of the job', '1999-01-08', '0', 'none' );

insert into tasks values(  5, 2, 2, 2, 'Dev Sub Task 1', 'The dev part of the job', '1999-01-08', '1', 'none' );
insert into tasks values(  6, 2, 2, 2, 'Dev Sub Task 2', 'The dev part of the job', '1999-01-08', '0', 'none' );

insert into taskAssign values(0,0);
insert into taskAssign values(1,1);
insert into taskAssign values(2,2);

insert into taskAssign values(3,3);
insert into taskAssign values(3,4);

insert into taskAssign values(4,4);
insert into taskAssign values(4,5);
insert into taskAssign values(4,6);

insert into taskAssign values(5,7);
insert into taskAssign values(5,8);

insert into taskAssign values(6,8);
insert into taskAssign values(6,9);

insert into resources values(DEFAULT,'file1','data1');

insert into resourceAssign values(0,1);
COMMIT;

-- insert into subtasks values( 2, 1 );

-- insert into assigned values('1','1');
-- insert into assigned values('2','2');
-- insert into assigned values('3','3');

-- delete from prereq;
-- delete from time_slot;
-- delete from advisor;
-- delete from takes;
-- delete from student;
-- delete from teaches;
-- delete from section;
-- delete from instructor;
-- delete from course;
-- delete from department;
-- delete from classroom;
-- insert into classroom values ('Packard', '101', '500');
-- insert into classroom values ('Painter', '514', '10');
-- insert into classroom values ('Taylor', '3128', '70');
-- insert into classroom values ('Watson', '100', '30');
-- insert into classroom values ('Watson', '120', '50');
-- insert into department values ('Biology', 'Watson', '90000');
-- insert into department values ('Comp. Sci.', 'Taylor', '100000');
-- insert into department values ('Elec. Eng.', 'Taylor', '85000');
-- insert into department values ('Finance', 'Painter', '120000');
-- insert into department values ('History', 'Painter', '50000');
-- insert into department values ('Music', 'Packard', '80000');
-- insert into department values ('Physics', 'Watson', '70000');
-- insert into course values ('BIO-101', 'Intro. to Biology', 'Biology', '4');
-- insert into course values ('BIO-301', 'Genetics', 'Biology', '4');
-- insert into course values ('BIO-399', 'Computational Biology', 'Biology', '3');
-- insert into course values ('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', '4');
-- insert into course values ('CS-190', 'Game Design', 'Comp. Sci.', '4');
-- insert into course values ('CS-315', 'Robotics', 'Comp. Sci.', '3');
-- insert into course values ('CS-319', 'Image Processing', 'Comp. Sci.', '3');
-- insert into course values ('CS-347', 'Database System Concepts', 'Comp. Sci.', '3');
-- insert into course values ('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', '3');
-- insert into course values ('FIN-201', 'Investment Banking', 'Finance', '3');
-- insert into course values ('HIS-351', 'World History', 'History', '3');
-- insert into course values ('MU-199', 'Music Video Production', 'Music', '3');
-- insert into course values ('PHY-101', 'Physical Principles', 'Physics', '4');
-- insert into instructor values ('10101', 'Srinivasan', 'Comp. Sci.', '65000');
-- insert into instructor values ('12121', 'Wu', 'Finance', '90000');
-- insert into instructor values ('15151', 'Mozart', 'Music', '40000');
-- insert into instructor values ('22222', 'Einstein', 'Physics', '95000');
-- insert into instructor values ('32343', 'El Said', 'History', '60000');
-- insert into instructor values ('33456', 'Gold', 'Physics', '87000');
-- insert into instructor values ('45565', 'Katz', 'Comp. Sci.', '75000');
-- insert into instructor values ('58583', 'Califieri', 'History', '62000');
-- insert into instructor values ('76543', 'Singh', 'Finance', '80000');
-- insert into instructor values ('76766', 'Crick', 'Biology', '72000');
-- insert into instructor values ('83821', 'Brandt', 'Comp. Sci.', '92000');
-- insert into instructor values ('98345', 'Kim', 'Elec. Eng.', '80000');
-- insert into section values ('BIO-101', '1', 'Summer', '2009', 'Painter', '514', 'B');
-- insert into section values ('BIO-301', '1', 'Summer', '2010', 'Painter', '514', 'A');
-- insert into section values ('CS-101', '1', 'Fall', '2009', 'Packard', '101', 'H');
-- insert into section values ('CS-101', '1', 'Spring', '2010', 'Packard', '101', 'F');
-- insert into section values ('CS-190', '1', 'Spring', '2009', 'Taylor', '3128', 'E');
-- insert into section values ('CS-190', '2', 'Spring', '2009', 'Taylor', '3128', 'A');
-- insert into section values ('CS-315', '1', 'Spring', '2010', 'Watson', '120', 'D');
-- insert into section values ('CS-319', '1', 'Spring', '2010', 'Watson', '100', 'B');
-- insert into section values ('CS-319', '2', 'Spring', '2010', 'Taylor', '3128', 'C');
-- insert into section values ('CS-347', '1', 'Fall', '2009', 'Taylor', '3128', 'A');
-- insert into section values ('EE-181', '1', 'Spring', '2009', 'Taylor', '3128', 'C');
-- insert into section values ('FIN-201', '1', 'Spring', '2010', 'Packard', '101', 'B');
-- insert into section values ('HIS-351', '1', 'Spring', '2010', 'Painter', '514', 'C');
-- insert into section values ('MU-199', '1', 'Spring', '2010', 'Packard', '101', 'D');
-- insert into section values ('PHY-101', '1', 'Fall', '2009', 'Watson', '100', 'A');
-- insert into teaches values ('10101', 'CS-101', '1', 'Fall', '2009');
-- insert into teaches values ('10101', 'CS-315', '1', 'Spring', '2010');
-- insert into teaches values ('10101', 'CS-347', '1', 'Fall', '2009');
-- insert into teaches values ('12121', 'FIN-201', '1', 'Spring', '2010');
-- insert into teaches values ('15151', 'MU-199', '1', 'Spring', '2010');
-- insert into teaches values ('22222', 'PHY-101', '1', 'Fall', '2009');
-- insert into teaches values ('32343', 'HIS-351', '1', 'Spring', '2010');
-- insert into teaches values ('45565', 'CS-101', '1', 'Spring', '2010');
-- insert into teaches values ('45565', 'CS-319', '1', 'Spring', '2010');
-- insert into teaches values ('76766', 'BIO-101', '1', 'Summer', '2009');
-- insert into teaches values ('76766', 'BIO-301', '1', 'Summer', '2010');
-- insert into teaches values ('83821', 'CS-190', '1', 'Spring', '2009');
-- insert into teaches values ('83821', 'CS-190', '2', 'Spring', '2009');
-- insert into teaches values ('83821', 'CS-319', '2', 'Spring', '2010');
-- insert into teaches values ('98345', 'EE-181', '1', 'Spring', '2009');
-- insert into student values ('00128', 'Zhang', 'Comp. Sci.', '102');
-- insert into student values ('12345', 'Shankar', 'Comp. Sci.', '32');
-- insert into student values ('19991', 'Brandt', 'History', '80');
-- insert into student values ('23121', 'Chavez', 'Finance', '110');
-- insert into student values ('44553', 'Peltier', 'Physics', '56');
-- insert into student values ('45678', 'Levy', 'Physics', '46');
-- insert into student values ('54321', 'Williams', 'Comp. Sci.', '54');
-- insert into student values ('55739', 'Sanchez', 'Music', '38');
-- insert into student values ('70557', 'Snow', 'Physics', '0');
-- insert into student values ('76543', 'Brown', 'Comp. Sci.', '58');
-- insert into student values ('76653', 'Aoi', 'Elec. Eng.', '60');
-- insert into student values ('98765', 'Bourikas', 'Elec. Eng.', '98');
-- insert into student values ('98988', 'Tanaka', 'Biology', '120');
-- insert into takes values ('00128', 'CS-101', '1', 'Fall', '2009', 'A');
-- insert into takes values ('00128', 'CS-347', '1', 'Fall', '2009', 'A-');
-- insert into takes values ('12345', 'CS-101', '1', 'Fall', '2009', 'C');
-- insert into takes values ('12345', 'CS-190', '2', 'Spring', '2009', 'A');
-- insert into takes values ('12345', 'CS-315', '1', 'Spring', '2010', 'A');
-- insert into takes values ('12345', 'CS-347', '1', 'Fall', '2009', 'A');
-- insert into takes values ('19991', 'HIS-351', '1', 'Spring', '2010', 'B');
-- insert into takes values ('23121', 'FIN-201', '1', 'Spring', '2010', 'C+');
-- insert into takes values ('44553', 'PHY-101', '1', 'Fall', '2009', 'B-');
-- insert into takes values ('45678', 'CS-101', '1', 'Fall', '2009', 'F');
-- insert into takes values ('45678', 'CS-101', '1', 'Spring', '2010', 'B+');
-- insert into takes values ('45678', 'CS-319', '1', 'Spring', '2010', 'B');
-- insert into takes values ('54321', 'CS-101', '1', 'Fall', '2009', 'A-');
-- insert into takes values ('54321', 'CS-190', '2', 'Spring', '2009', 'B+');
-- insert into takes values ('55739', 'MU-199', '1', 'Spring', '2010', 'A-');
-- insert into takes values ('76543', 'CS-101', '1', 'Fall', '2009', 'A');
-- insert into takes values ('76543', 'CS-319', '2', 'Spring', '2010', 'A');
-- insert into takes values ('76653', 'EE-181', '1', 'Spring', '2009', 'C');
-- insert into takes values ('98765', 'CS-101', '1', 'Fall', '2009', 'C-');
-- insert into takes values ('98765', 'CS-315', '1', 'Spring', '2010', 'B');
-- insert into takes values ('98988', 'BIO-101', '1', 'Summer', '2009', 'A');
-- insert into takes values ('98988', 'BIO-301', '1', 'Summer', '2010', null);
-- insert into advisor values ('00128', '45565');
-- insert into advisor values ('12345', '10101');
-- insert into advisor values ('23121', '76543');
-- insert into advisor values ('44553', '22222');
-- insert into advisor values ('45678', '22222');
-- insert into advisor values ('76543', '45565');
-- insert into advisor values ('76653', '98345');
-- insert into advisor values ('98765', '98345');
-- insert into advisor values ('98988', '76766');
-- insert into time_slot values ('A', 'M', '8', '0', '8', '50');
-- insert into time_slot values ('A', 'W', '8', '0', '8', '50');
-- insert into time_slot values ('A', 'F', '8', '0', '8', '50');
-- insert into time_slot values ('B', 'M', '9', '0', '9', '50');
-- insert into time_slot values ('B', 'W', '9', '0', '9', '50');
-- insert into time_slot values ('B', 'F', '9', '0', '9', '50');
-- insert into time_slot values ('C', 'M', '11', '0', '11', '50');
-- insert into time_slot values ('C', 'W', '11', '0', '11', '50');
-- insert into time_slot values ('C', 'F', '11', '0', '11', '50');
-- insert into time_slot values ('D', 'M', '13', '0', '13', '50');
-- insert into time_slot values ('D', 'W', '13', '0', '13', '50');
-- insert into time_slot values ('D', 'F', '13', '0', '13', '50');
-- insert into time_slot values ('E', 'T', '10', '30', '11', '45 ');
-- insert into time_slot values ('E', 'R', '10', '30', '11', '45 ');
-- insert into time_slot values ('F', 'T', '14', '30', '15', '45 ');
-- insert into time_slot values ('F', 'R', '14', '30', '15', '45 ');
-- insert into time_slot values ('G', 'M', '16', '0', '16', '50');
-- insert into time_slot values ('G', 'W', '16', '0', '16', '50');
-- insert into time_slot values ('G', 'F', '16', '0', '16', '50');
-- insert into time_slot values ('H', 'W', '10', '0', '12', '30');
-- insert into prereq values ('BIO-301', 'BIO-101');
-- insert into prereq values ('BIO-399', 'BIO-101');
-- insert into prereq values ('CS-190', 'CS-101');
-- insert into prereq values ('CS-315', 'CS-101');
-- insert into prereq values ('CS-319', 'CS-101');
-- insert into prereq values ('CS-347', 'CS-101');
-- insert into prereq values ('EE-181', 'PHY-101');

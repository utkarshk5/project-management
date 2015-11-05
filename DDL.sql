-- drop table users cascade;
-- drop table teams cascade;
-- drop table tasks cascade;
-- drop table teamAssign cascade;
-- drop table taskAssign cascade;
 drop table resources cascade;

CREATE TABLE teams
(team_id    serial,
 leader_id    INTEGER not null,
 team_name    VARCHAR(20) UNIQUE,
 PRIMARY KEY(team_id)
);

CREATE TABLE users
(user_id     serial,
 username    VARCHAR(20),
 password    VARCHAR(20) not null,
 email   	 VARCHAR(80) UNIQUE,
 phone   	 VARCHAR(15),
 address    VARCHAR(80),
 clearance    INTEGER,
 PRIMARY KEY (user_id)
);

CREATE TABLE teamAssign
(
  team_id  INTEGER,
  user_id  INTEGER,
PRIMARY KEY(team_id, user_id),
  FOREIGN KEY (team_id) REFERENCES teams
  ON DELETE CASCADE,
FOREIGN KEY (user_id) REFERENCES users(user_id)
  ON DELETE CASCADE
);

-- ALTER TABLE users
-- ADD CONSTRAINT user_team FOREIGN KEY(user_id)
--     references teamAssign(user_id)
--     DEFERRABLE INITIALLY DEFERRED;

CREATE TABLE tasks
(task_id     serial,
 assigned_by INTEGER,
 team_id INTEGER,
 supertask   INTEGER,
 title       VARCHAR(30),
 detailed_desc VARCHAR(200),
 deadline    DATE not null,
 completed  boolean not null,
 remarks    VARCHAR(100),
 PRIMARY KEY(task_id),
 FOREIGN KEY (assigned_by) REFERENCES users
 ON DELETE CASCADE,
 FOREIGN KEY (team_id) REFERENCES teams
 ON DELETE CASCADE
 );

CREATE TABLE taskAssign
(
  task_id  INTEGER,
  user_id  INTEGER,
  PRIMARY KEY(task_id, user_id),
  FOREIGN KEY (task_id) REFERENCES tasks
  ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users
  ON DELETE CASCADE
);

CREATE TABLE resources
(
  resource_id SERIAL,
  filename    VARCHAR(30),
  file        BYTEA,
  PRIMARY KEY(resource_id)
);

CREATE TABLE resourceAssign
(
  task_id  INTEGER,
  resource_id  INTEGER,
PRIMARY KEY(task_id, resource_id),
  FOREIGN KEY (task_id) REFERENCES tasks
  ON DELETE CASCADE,
  FOREIGN KEY (resource_id) REFERENCES resources
  ON DELETE CASCADE
);

-- CREATE TABLE subtasks
--     (subtask     INTEGER,
--      task        INTEGER,
--      PRIMARY KEY (subtask, task),
--      FOREIGN KEY (subtask) REFERENCES tasks
--       ON DELETE CASCADE,
--      FOREIGN KEY (task) REFERENCES tasks
--       ON DELETE CASCADE
--     );


-- CREATE TABLE assigned
--     (user_id INTEGER,
--      task_id INTEGER,
--      PRIMARY KEY(user_id,task_id),
--      FOREIGN KEY (user_id) REFERENCES users
--      ON DELETE CASCADE,
--      FOREIGN KEY (task_id) REFERENCES tasks
--      ON DELETE CASCADE
--      );



-- CREATE TABLE classroom
--     (building   	 VARCHAR(15),
--      room_number   	 VARCHAR(7),
--      capacity   	 numeric(4,0),
--      PRIMARY KEY (building, room_number)
--     );

-- CREATE TABLE department
--     (dept_name   	 VARCHAR(20),
--      building   	 VARCHAR(15),
--      budget   	     	numeric(12,2) check (budget > 0),
--      PRIMARY KEY (dept_name)
--     );

-- CREATE TABLE course
--     (course_id   	 VARCHAR(8),
--      title   		 VARCHAR(50),
--      dept_name   	 VARCHAR(20),
--      credits   	 numeric(2,0) check (credits > 0),
--      PRIMARY KEY (course_id),
--      FOREIGN KEY (dept_name) REFERENCES department
--    	 on delete set null
--     );

-- CREATE TABLE instructor
--     (ID   		 VARCHAR(5),
--      name   		 VARCHAR(20) not null,
--      dept_name   	 VARCHAR(20),
--      salary   		 numeric(8,2) check (salary > 29000),
--      PRIMARY KEY (ID),
--      FOREIGN KEY (dept_name) REFERENCES department
--    	 on delete set null
--     );

-- CREATE TABLE section
--     (course_id   	 VARCHAR(8),
--      	sec_id   		 VARCHAR(8),
--      semester   	 VARCHAR(6)
--    	 check (semester in ('Fall', 'Winter', 'Spring', 'Summer')),
--      year   		 numeric(4,0) check (year > 1701 and year < 2100),
--      building   	 VARCHAR(15),
--      room_number   	 VARCHAR(7),
--      time_slot_id   	 VARCHAR(4),
--      PRIMARY KEY (course_id, sec_id, semester, year),
--      FOREIGN KEY (course_id) REFERENCES course
--    	 ON DELETE CASCADE,
--      FOREIGN KEY (building, room_number) REFERENCES classroom
--    	 on delete set null
--     );

-- CREATE TABLE teaches
--     (ID   		 VARCHAR(5),
--      course_id   	 VARCHAR(8),
--      sec_id   		 VARCHAR(8),
--      semester   	 VARCHAR(6),
--      year   		 numeric(4,0),
--      PRIMARY KEY (ID, course_id, sec_id, semester, year),
--      FOREIGN KEY (course_id,sec_id, semester, year) REFERENCES section
--    	 ON DELETE CASCADE,
--      FOREIGN KEY (ID) REFERENCES instructor
--    	 ON DELETE CASCADE
--     );

-- CREATE TABLE student
--     (ID   		 VARCHAR(5),
--      name   		 VARCHAR(20) not null,
--      dept_name   	 VARCHAR(20),
--      tot_cred   	 numeric(3,0) check (tot_cred >= 0),
--      PRIMARY KEY (ID),
--      FOREIGN KEY (dept_name) REFERENCES department
--    	 on delete set null
--     );

-- CREATE TABLE takes
--     (ID   		 VARCHAR(5),
--      course_id   	 VARCHAR(8),
--      sec_id   		 VARCHAR(8),
--      semester   	 VARCHAR(6),
--      year   		 numeric(4,0),
--      grade   	     	VARCHAR(2),
--      PRIMARY KEY (ID, course_id, sec_id, semester, year),
--      FOREIGN KEY (course_id,sec_id, semester, year) REFERENCES section
--    	 ON DELETE CASCADE,
--      FOREIGN KEY (ID) REFERENCES student
--    	 ON DELETE CASCADE
--     );

-- CREATE TABLE advisor
--     (s_ID   		 VARCHAR(5),
--      i_ID   		 VARCHAR(5),
--      PRIMARY KEY (s_ID),
--      FOREIGN KEY (i_ID) REFERENCES instructor (ID)
--    	 on delete set null,
--      FOREIGN KEY (s_ID) REFERENCES student (ID)
--    	 ON DELETE CASCADE
--     );

-- CREATE TABLE time_slot
--     (time_slot_id   	 VARCHAR(4),
--      day   		 VARCHAR(1),
--      start_hr   	 numeric(2) check (start_hr >= 0 and start_hr < 24),
--      start_min   	 numeric(2) check (start_min >= 0 and start_min < 60),
--      end_hr   		 numeric(2) check (end_hr >= 0 and end_hr < 24),
--      end_min   	 numeric(2) check (end_min >= 0 and end_min < 60),
--      PRIMARY KEY (time_slot_id, day, start_hr, start_min)
--     );

-- CREATE TABLE prereq
--     (course_id   	 VARCHAR(8),
--      prereq_id   	 VARCHAR(8),
--      PRIMARY KEY (course_id, prereq_id),
--      FOREIGN KEY (course_id) REFERENCES course
--    	 ON DELETE CASCADE,
--      FOREIGN KEY (prereq_id) REFERENCES course
--     );

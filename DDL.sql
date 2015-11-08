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

alter sequence resources_resource_id_seq restart with 1;
alter sequence users_user_id_seq restart with 1;
alter sequence tasks_task_id_seq restart with 1;
alter sequence teams_team_id_seq restart with 1;
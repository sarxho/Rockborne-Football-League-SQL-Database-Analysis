--CREATING THE TABLE SCRIPT MANUALLY--
CREATE TABLE "RockborneFootballLeague".teams (
    team_id INT PRIMARY KEY,
    team_name VARCHAR(100)
);
SELECT * 
FROM "RockborneFootballLeague".teams;

INSERT INTO "RockborneFootballLeague".teams (team_id, team_name)
VALUES
    (1, 'Data Masters'),
    (2, 'BI Gods'),
    (3, 'Vis Wizards'),
    (4, 'Data Cleaners');
SELECT *
FROM "RockborneFootballLeague".teams;

--CREATING THE PARTICIPATING GROUPS--
DROP TABLE IF EXISTS "RockborneFootballLeague".participating_groups;
CREATE TABLE "RockborneFootballLeague".participating_groups (
    group_id VARCHAR(10) PRIMARY KEY,
    participating_groups VARCHAR(100)
);

INSERT INTO "RockborneFootballLeague".participating_groups (group_id, participating_groups)
VALUES
	('G1', 'Cohort 4'),
	('G2', 'Cohort 5'),
	('G3', 'Cohort 6'),
	('G4', 'Cohort 7'),
	('G5', 'Bench'),
	('G6', 'Training Team'),
	('G7', 'HR'),
	('G8', 'Consultants');
SELECT *
FROM "RockborneFootballLeague".participating_groups;

--CREATING VENUES TABLE--

CREATE TABLE "RockborneFootballLeague".venue (
    venue_id VARCHAR(10) PRIMARY KEY,
    venues VARCHAR(100)
);

INSERT INTO "RockborneFootballLeague".venue (venue_id, venues)
VALUES
	('V1', 'Wimbledon 1'),
	('V2', 'Wimbledon 2'),
	('V3', 'Wimbledon 3');

SELECT *
FROM "RockborneFootballLeague".venue;

--CREATING THE CONSULTANT TABLE--
DROP TABLE IF EXISTS "RockborneFootballLeague".consultant;
CREATE TABLE "RockborneFootballLeague".consultant (
	consultant_id INT ,
    group_id VARCHAR(10),
	player_id INT PRIMARY KEY,
	name VARCHAR(100)
);

INSERT INTO "RockborneFootballLeague".consultant (consultant_id, group_id, player_id, name)
VALUES
	(200, 'G1', 1,'Aedan Petty'),
	(201, 'G3', 2,'Aliza Santos'),
	(201, 'G6', 3,'Kaylynn Vaughan'),
	(202, 'G4', 4,'Arjun Bauer'),
	(202, 'G2', 5,'Lilian Huber'),
	(203, 'G6', 6,'Lizeth Roberts'),
	(203, 'G7', 7,'Nathan Mcdowell'),
	(204, 'G8', 8,'Alvin Ali'),
	(204, 'G7', 9,'Jordin Christensen'),
	(205, 'G7', 10,'Saul Blevins'),
	(205, 'G2', 11,'Carina Meza'),
	(206, 'G5', 12,'Isabelle Campos'),
	(206, 'G1', 13,'Kyleigh Phelps'),
	(207, 'G7', 14,'Angela Wong'),
	(207, 'G7', 15,'Kole Rojas'),
	(208, 'G4', 16,'Martha Potts'),
	(208, 'G6', 17,'Tomas Powell'),
	(209, 'G5', 18,'Paxton Clarke'),
	(209, 'G8', 19,'Jamya Dodson'),
	(210, 'G8', 20,'Georgia Clements'),
	(210, 'G2', 21,'Edwin Crawford'),
	(211, 'G8', 22,'Malachi Osborn'),
	(211, 'G2', 23,'Zion Kent'),
	(212, 'G5', 24,'Anahi Reyes'),
	(212, 'G8', 25,'Maddox Cabrera'),
	(213, 'G4', 26,'Brody Gutierrez'),
	(213, 'G3', 27,'Hayley Stevenson'),
	(214, 'G8', 28,'Kamora Sanchez'),
	(214, 'G6', 29,'Livia Holmes'),
	(215, 'G8', 30,'Tanner Jenkins'),
	(215, 'G5', 31,'Madelyn Meadows'),
	(216, 'G3', 32,'Paola Wilkerson'),
	(216, 'G6', 33,'Jared Patton'),
	(217, 'G8', 34,'Pierre Washington'),
	(217, 'G4', 35,'Dominik Cochran'),
	(218, 'G4', 36,'Miya Skinner'),
	(218, 'G5', 37,'Mara Barnett'),
	(219, 'G2', 38,'Cornelius Dodson'),
	(219, 'G6', 39,'Ashleigh Kaiser'),
	(220, 'G6', 40,'Weston Meza');

SELECT *
FROM "RockborneFootballLeague".consultant;

--CREATING TORNAMENT TABLE--
DROP TABLE IF EXISTS "RockborneFootballLeague".tournament;
CREATE TABLE "RockborneFootballLeague".tournament (
    tournament_id VARCHAR(10) PRIMARY KEY,
    tournament_name VARCHAR(100),
	season VARCHAR(100),
	year INT
);

INSERT INTO "RockborneFootballLeague".tournament (tournament_id, tournament_name, season, year)
VALUES
	('T1','6-a-side Rockborne','Winter',2022),
	('T2','Friendly','Winter', 2023 );
SELECT *
FROM "RockborneFootballLeague".tournament;

--CREATING TEAM MEMBERSHIP TABLE--
DROP TABLE IF EXISTS "RockborneFootballLeague".team_membership;
CREATE TABLE "RockborneFootballLeague".team_membership (
	membership_id INT PRIMARY KEY,
    player_id INT,
	team_id INT,
	tournament_id VARCHAR (10)
);

INSERT INTO "RockborneFootballLeague".team_membership (membership_id, player_id, team_id, tournament_id)
VALUES 
	(1,1,1,'T1'),
	(2,2,1,'T1'),
	(3,3,1,'T1'),
	(4,4,1,'T1'),
	(5,5,1,'T1'),
	(6,6,1,'T1'),
	(7,7,1,'T1'),
	(8,8,1,'T1'),
	(9,9,1,'T1'),
	(10,10,1,'T1'),
	(11,11,2,'T1'),
	(12,12,2,'T1'),
	(13,13,2,'T1'),
	(14,14,2,'T1'),
	(15,15,2,'T1'),
	(16,16,2,'T1'),
	(17,17,2,'T1'),
	(18,18,2,'T1'),
	(19,19,2,'T1'),
	(20,20,2,'T1'),
	(21,21,3,'T1'),
	(22,22,3,'T1'),
	(23,23,3,'T1'),
	(24,24,3,'T1'),
	(25,25,3,'T1'),
	(26,26,3,'T1'),
	(27,27,3,'T1'),
	(28,28,3,'T1'),
	(29,29,3,'T1'),
	(30,30,3,'T1'),
	(31,31,4,'T1'),
	(32,32,4,'T1'),
	(33,33,4,'T1'),
	(34,34,4,'T1'),
	(35,35,4,'T1'),
	(36,36,4,'T1'),
	(37,37,4,'T1'),
	(38,38,4,'T1'),
	(39,39,4,'T1'),
	(40,40,4,'T1');

	
SELECT *
FROM "RockborneFootballLeague".team_membership;

-- CREATING EVENTS TABLE --
CREATE TABLE "RockborneFootballLeague".events (
	event_id INT PRIMARY KEY,
    match_id INT,
	type_of_event VARCHAR (100),
	event_min INT,
	player_id INT,
	home_or_away_id INT
);

INSERT INTO "RockborneFootballLeague".events (event_id, match_id, type_of_event, event_min, player_id, home_or_away_id)
VALUES 
	(1,1,'Score',5,8,1),
	(2,1,'Yellow Card',10,12,2),
	(3,1,'Score',80,7,1),
	(4,2,'Score',10,35,2),
	(5,2,'Score',11,27,1),
	(6,2,'Yellow Card',30,30,1),
	(7,3,'Score',2,8,1),
	(8,3,'Yellow Card',10,1,1),
	(9,3,'Yellow Card',70,9,1),
	(10,3,'Score',85,27,2),
	(11,3,'Yellow Card',88,8,1),
	(12,4,'Score',20,19,1),
	(13,4,'Score',30,35,2),
	(14,4,'Score',40,17,1),
	(15,4,'Red Card',40,32,2),
	(16,5,'Yellow Card',35,10,1),
	(17,5,'Yellow Card',88,38,2),
	(18,6,'Score',2,28,2),
	(19,6,'Score',5,19,1),
	(20,6,'Score',55,27,2),
	(21,7,'Score',1,19,1),
	(22,7,'Score',35,8,2),
	(23,7,'Yellow Card',60,3,2),
	(24,7,'Score',77,3,2),
	(25,7,'Score',82,16,1),
	(26,8,'Yellow Card',10,35,1),
	(27,8,'Score',12,25,2),
	(28,8,'Score',66,35,2),
	(29,8,'Score',68,27,2),
	(30,9,'Score',20,29,1),
	(31,9,'Score',25,29,1),
	(32,9,'Yellow Card',30,23,1),
	(33,9,'Score',77,7,2),
	(34,9,'Score',85,26,1),
	(35,9,'Score',89,8,2),
	(36,10,'Red Card',10,32,1),
	(37,10,'Score',75,19,2),
	(38,11,'Score',25,35,1),
	(39,11,'Score',46,37,1),
	(40,11,'Yellow Card',62,1,2),
	(41,12,'Score',29,19,2),
	(42,12,'Yellow Card',42,17,2),
	(43,12,'Score',80,26,1),
	(44,12,'Score',87,18,2),
	(45,12,'Score',90,25,1);

SELECT *
FROM "RockborneFootballLeague".events;

--CREATING MY HOME AND AWAY TABLE--
CREATE TABLE "RockborneFootballLeague".home_away (
	home_or_away VARCHAR (100),
    home_or_away_id INT PRIMARY KEY
);
INSERT INTO "RockborneFootballLeague".home_away (home_or_away, home_or_away_id)
VALUES 
	('Home',1),
	('Away',2);
SELECT *
FROM "RockborneFootballLeague".home_away;

--CREATING MATCH FIXTURE TABLE--
CREATE TABLE "RockborneFootballLeague".match_fixture (
    match_id INT PRIMARY KEY,
    date DATE,
    time TIME,
    week INT,
    venue_id VARCHAR(10),
    tournament_id VARCHAR(10)
);

INSERT INTO "RockborneFootballLeague".match_fixture (match_id, date, time, week, venue_id, tournament_id)
VALUES
	(1,'2022-10-01','16:00:00',1,'V1','T1'),
	(2,'2022-10-01','16:00:00',1,'V2','T1'),
	(3,'2022-10-08','16:00:00',2,'V2','T1'),
	(4,'2022-10-08','16:00:00',2,'V3','T1'),
	(5,'2022-10-22','16:00:00',3,'V3','T1'),
	(6,'2022-10-22','16:00:00',3,'V2','T1'),
	(7,'2022-10-29','16:00:00',4,'V1','T1'),
	(8,'2022-10-29','16:00:00',4,'V3','T1'),
	(9,'2022-11-05','16:00:00',5,'V3','T1'),
	(10,'2022-11-05','16:00:00',5,'V1','T1'),
	(11,'2022-11-12','16:00:00',6,'V2','T1'),
	(12,'2022-11-12','16:00:00',6,'V3','T1'),
	(13,'2023-11-12','16:00:00',7,'V1','T2'),
	(14,'2023-11-12','16:00:00',7,'V3','T2');	
SELECT *
FROM "RockborneFootballLeague". match_fixture;

--CREATING THE POINTS TABLE--
CREATE TABLE "RockborneFootballLeague".points_score (
    playing_teams_id INT PRIMARY KEY,
    match_id INT,
    team_id INT,
    points INT,
    home_or_away_id INT
);

INSERT INTO "RockborneFootballLeague".points_score (playing_teams_id, match_id, team_id, points, home_or_away_id)
VALUES
	(1,1,1,3,1),
	(2,1,2,0,2),
	(3,2,3,1,1),
	(4,2,4,1,2),
	(5,3,1,3,1),
	(6,3,3,0,2),
	(7,4,2,3,1),
	(8,4,4,0,2),
	(9,5,1,0,1),
	(10,5,4,0,2),
	(11,6,2,0,1),
	(12,6,3,1,2),
	(13,7,2,1,1),
	(14,7,1,1,2),
	(15,8,4,0,1),
	(16,8,3,3,2),
	(17,9,2,3,1),
	(18,9,4,0,2),
	(19,10,4,0,1),
	(20,10,3,3,2),
	(21,11,4,3,1),
	(22,11,1,0,2),
	(23,12,3,1,1),
	(24,12,2,1,2),
	(25,13,4,NULL,1),
	(26,13,1,NULL,2),
	(27,14,3,NULL,1),
	(28,14,2,NULL,2);
SELECT *
FROM "RockborneFootballLeague".points_score;

--NOW I AM ADDING IN FOREIGN KEYS TO ALL THE TABLES 
-- consultant and participating_groups--
ALTER TABLE "RockborneFootballLeague".consultant
ADD CONSTRAINT fk_consultant_group
FOREIGN KEY (group_id)
REFERENCES "RockborneFootballLeague".participating_groups (group_id);

-- team_membership and consultant--
ALTER TABLE "RockborneFootballLeague".team_membership
ADD CONSTRAINT fk_team_membership_player
FOREIGN KEY (player_id)
REFERENCES "RockborneFootballLeague".consultant (player_id);

-- team_membership and teams--
ALTER TABLE "RockborneFootballLeague".team_membership
ADD CONSTRAINT fk_team_membership_team
FOREIGN KEY (team_id)
REFERENCES "RockborneFootballLeague".teams (team_id);

-- team_membership and tournament--
ALTER TABLE "RockborneFootballLeague".team_membership
ADD CONSTRAINT fk_team_membership_tournament
FOREIGN KEY (tournament_id)
REFERENCES "RockborneFootballLeague".tournament (tournament_id);

-- match_fixture and venue --
ALTER TABLE "RockborneFootballLeague".match_fixture
ADD CONSTRAINT fk_match_fixture_venue
FOREIGN KEY (venue_id)
REFERENCES "RockborneFootballLeague".venue (venue_id);

-- match_fixture and tournament--
ALTER TABLE "RockborneFootballLeague".match_fixture
ADD CONSTRAINT fk_match_fixture_tournament
FOREIGN KEY (tournament_id)
REFERENCES "RockborneFootballLeague".tournament (tournament_id);

-- points_score and match_fixture--
ALTER TABLE "RockborneFootballLeague".points_score
ADD CONSTRAINT fk_points_score_match
FOREIGN KEY (match_id)
REFERENCES "RockborneFootballLeague".match_fixture (match_id);

-- points_score and teams--
ALTER TABLE "RockborneFootballLeague".points_score
ADD CONSTRAINT fk_points_score_team
FOREIGN KEY (team_id)
REFERENCES "RockborneFootballLeague".teams (team_id);

-- points_score and home_away--
ALTER TABLE "RockborneFootballLeague".points_score
ADD CONSTRAINT fk_points_score_homeaway
FOREIGN KEY (home_or_away_id)
REFERENCES "RockborneFootballLeague".home_away (home_or_away_id);

-- events and match_fixture--
ALTER TABLE "RockborneFootballLeague".events
ADD CONSTRAINT fk_events_match
FOREIGN KEY (match_id)
REFERENCES "RockborneFootballLeague".match_fixture (match_id);

-- events and consultant--
ALTER TABLE "RockborneFootballLeague".events
ADD CONSTRAINT fk_events_player
FOREIGN KEY (player_id)
REFERENCES "RockborneFootballLeague".consultant (player_id);

-- events and home_away--
ALTER TABLE "RockborneFootballLeague".events
ADD CONSTRAINT fk_events_homeaway
FOREIGN KEY (home_or_away_id)
REFERENCES "RockborneFootballLeague".home_away (home_or_away_id);

--THIS SECTION IS FOR ADDING CONSTRAINTS--
-- WEEKS MUST BE GREATER THAN 0
ALTER TABLE "RockborneFootballLeague".match_fixture
ADD CONSTRAINT week_greater
CHECK (week > 0);

-- EVENTS MINS MUST BE BETWEEN 0 AND 120
ALTER TABLE "RockborneFootballLeague".events
ADD CONSTRAINT event_min_range
CHECK (event_min >= 0 AND event_min <= 120);

-- POINTS MUST BE BETWEEN O AND 3 
ALTER TABLE "RockborneFootballLeague".points_score
ADD CONSTRAINT points_range
CHECK (points >= 0 AND points <= 3);

--  TEAM NAME MUST BE UNIQUE
ALTER TABLE "RockborneFootballLeague".teams
ADD CONSTRAINT uq_team_name UNIQUE (team_name);

-- VENUES MUST BE UNIQUE 
ALTER TABLE "RockborneFootballLeague".venue
ADD CONSTRAINT uq_venue_name UNIQUE (venues);

-- NO GAME CAN HAPPEN AT THE SAME TIME 
ALTER TABLE "RockborneFootballLeague".match_fixture
ADD CONSTRAINT match_schedule UNIQUE (date, time, venue_id);

--Here NOT NULL and is being added to the teams, venues,consultant, 
--group and tournament table. 
ALTER TABLE "RockborneFootballLeague".teams
ALTER COLUMN team_name SET NOT NULL;

ALTER TABLE "RockborneFootballLeague".venue
ALTER COLUMN venues SET NOT NULL;

ALTER TABLE "RockborneFootballLeague".consultant
ALTER COLUMN name SET NOT NULL;

ALTER TABLE "RockborneFootballLeague".participating_groups
ALTER COLUMN participating_groups SET NOT NULL;

ALTER TABLE "RockborneFootballLeague".tournament
ALTER COLUMN tournament_name SET NOT NULL;


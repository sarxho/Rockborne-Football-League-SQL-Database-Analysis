--QUESTION 1 1. Listing all students, 
--who play for a particular department (i.e. Cohort 4 group).
--Loading the participating group table 
SELECT *
FROM "RockborneFootballLeague".participating_groups;
--Using joins to link the participating groups column with the consulting 
--table I have decided to pick Cohort 7
SELECT c.name, c.group_id, p.participating_groups
FROM "RockborneFootballLeague".consultant AS c
INNER JOIN "RockborneFootballLeague".participating_groups AS p
ON c.group_id = p.group_id
WHERE p.participating_groups = 'Cohort 7';

--QUESTION 2 Listing all fixtures for a specific date 
--(i.e. 29th of October 2022 and including team names and venues). 
--Joining the venues table to the match table based on the venues id 
-- then joining this table onto the point score table because it have both the
--team_id and matchid in order to call the team id 
--i then linked this table to the team table to get the name 
SELECT mf.date, v.venues, mf.match_id, ps.team_id, t.team_name
FROM "RockborneFootballLeague".match_fixture AS mf
INNER JOIN "RockborneFootballLeague".venue AS v
ON mf.venue_id = v.venue_id
INNER JOIN "RockborneFootballLeague".points_score AS ps
ON ps.match_id = mf.match_id
INNER JOIN "RockborneFootballLeague".teams AS t
ON t.team_id = ps.team_id; 

--This is to simplify the table and add the where clause for this date, '2022-10-29'
SELECT mf.date, v.venues, t.team_name
FROM "RockborneFootballLeague".match_fixture AS mf
INNER JOIN "RockborneFootballLeague".venue AS v
ON mf.venue_id = v.venue_id
INNER JOIN "RockborneFootballLeague".points_score AS ps
ON ps.match_id = mf.match_id
INNER JOIN "RockborneFootballLeague".teams AS t
ON t.team_id = ps.team_id
WHERE  mf.date = '2022-10-29';

--QUESTION 3  Listing all the players who have scored more than 2 goals. 
SELECT *
FROM "RockborneFootballLeague".events;
--started of by seeing who had scored 
SELECT *
FROM "RockborneFootballLeague".events
WHERE type_of_event = 'Score';
-- i added column called times scored which 
--counts the amount of time the player scores 
SELECT DISTINCT 
	player_id, 
	COUNT(*) AS times_scored
FROM "RockborneFootballLeague".events
WHERE type_of_event = 'Score'
GROUP BY player_id
ORDER BY times_scored;
--Here i used the joins function to join the events to the link the
--name to the player id  and done the count grater than one so it
--includes 2  
SELECT 
    e.player_id,
	e.type_of_event,
    c.name,
    COUNT(*) AS times_scored
FROM "RockborneFootballLeague".events AS e
INNER JOIN "RockborneFootballLeague".consultant AS c
  ON e.player_id = c.player_id
WHERE e.type_of_event = 'Score'
GROUP BY e.player_id, c.name,e.type_of_event
HAVING COUNT(*) > 1;

--QUESTION 4 Listing the number of cards (yellow and red) per team. 
SELECT *
FROM "RockborneFootballLeague".events;
--I started by joining the events table to the points table and then the 
--team table
SELECT e.type_of_event, e.match_id,ps.team_id,t.team_name
FROM "RockborneFootballLeague".events AS e
INNER JOIN "RockborneFootballLeague".points_score AS ps
ON e.match_id = ps.match_id
INNER JOIN "RockborneFootballLeague".teams AS t
ON ps.team_id = t.team_id
--here i added the WHEN for the type of event
SELECT e.type_of_event, e.match_id,ps.team_id,t.team_name
FROM "RockborneFootballLeague".events AS e
INNER JOIN "RockborneFootballLeague".points_score AS ps
ON e.match_id = ps.match_id
INNER JOIN "RockborneFootballLeague".teams AS t
ON ps.team_id = t.team_id
WHERE e.type_of_event = 'Yellow Card' OR e.type_of_event = 'Red Card';
--here i added the count and filter to the code in order to count the yellow
--and red cards and put that into a column
SELECT t.team_name,
	COUNT(*) FILTER (WHERE e.type_of_event = 'Yellow Card') AS yellow_cards,
    COUNT(*) FILTER (WHERE e.type_of_event = 'Red Card') AS red_cards
FROM "RockborneFootballLeague".events AS e
INNER JOIN "RockborneFootballLeague".points_score AS ps
ON e.match_id = ps.match_id
INNER JOIN "RockborneFootballLeague".teams AS t
ON ps.team_id = t.team_id
WHERE e.type_of_event = 'Yellow Card' OR e.type_of_event = 'Red Card'
GROUP BY t.team_name;

--QUESTION 5 Return the games that are going to be played (friendly matches). 
SELECT *
FROM "RockborneFootballLeague".match_fixture
WHERE tournament_id = 'T2';

--QUESTION 6 The table displays the team's name and the points earned during the 
--tournament. 
SELECT *
FROM "RockborneFootballLeague".points_score;
--Here i used join to join the point score and teams together based on 
--team_id
SELECT ps.points, t.team_id, t.team_name
FROM "RockborneFootballLeague".points_score AS ps
INNER JOIN "RockborneFootballLeague".teams AS t
ON t.team_id = ps.team_id;
--Here I summed up the point and grouped it by team id and 
--team name since they are the same 
SELECT 
    t.team_id,
    t.team_name,
    SUM(ps.points) AS total_points
FROM "RockborneFootballLeague".points_score AS ps
INNER JOIN "RockborneFootballLeague".teams AS t
ON t.team_id = ps.team_id
GROUP BY t.team_id, t.team_name;

--QUESTION 7 For each team, present the distribution of goals scored
--and conceded in each half of the match. 
--Here I join the events table to the team membership table based on the 
--player id and then joined the team id in the team membership to teams 
--table 
SELECT e.type_of_event, e.event_min, t.team_name
FROM "RockborneFootballLeague".events AS e
INNER JOIN "RockborneFootballLeague".team_membership AS tm
ON e.player_id = tm.player_id
INNER JOIN "RockborneFootballLeague".teams AS t
ON tm.team_id = t.team_id
WHERE e.type_of_event = 'Score';
--here i am creating columns for mins before and after 45 mins and
--grouping it by team name using count and filter
SELECT 
	COUNT(*) FILTER (WHERE e.event_min <= 45) AS goals_1_half,
    COUNT(*) FILTER (WHERE e.event_min > 45) AS goals_2_half,
	t.team_name
FROM "RockborneFootballLeague".events AS e
INNER JOIN "RockborneFootballLeague".team_membership AS tm
ON e.player_id = tm.player_id
INNER JOIN "RockborneFootballLeague".teams AS t
ON tm.team_id = t.team_id
WHERE e.type_of_event = 'Score'
GROUP BY team_name;

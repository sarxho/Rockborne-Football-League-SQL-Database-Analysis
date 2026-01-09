# Rockborne Football League — SQL Database & Analysis

## Overview
This project builds a relational database for a **Rockborne 6-a-side Football League** and uses **SQL** to answer a set of analytical questions about players, fixtures, events, and team performance.

It demonstrates end-to-end SQL skills:
- Database design (schema + keys)
- Data insertion
- Constraints and validation rules
- Analytical queries using joins, aggregation, filtering, and grouping

---

## Database Schema
The database is created under the schema:

`"RockborneFootballLeague"`

### Tables Created
- **teams**: team list (unique team names)
- **participating_groups**: cohort/department group labels
- **venue**: match venues (unique venue names)
- **consultant**: players with consultant and group information
- **tournament**: tournaments (season + year)
- **team_membership**: assigns players to teams for a tournament
- **match_fixture**: match schedule (date/time/week/venue/tournament)
- **points_score**: match results (team points, home/away)
- **home_away**: home/away reference table
- **events**: match events (goals, yellow cards, red cards)

### Relationships (Foreign Keys)
Key relationships include:
- consultant.group_id → participating_groups.group_id  
- team_membership.player_id → consultant.player_id  
- team_membership.team_id → teams.team_id  
- team_membership.tournament_id → tournament.tournament_id  
- match_fixture.venue_id → venue.venue_id  
- match_fixture.tournament_id → tournament.tournament_id  
- points_score.match_id → match_fixture.match_id  
- points_score.team_id → teams.team_id  
- points_score.home_or_away_id → home_away.home_or_away_id  
- events.match_id → match_fixture.match_id  
- events.player_id → consultant.player_id  
- events.home_or_away_id → home_away.home_or_away_id  

---

## Data Quality Rules (Constraints)
To improve data integrity, constraints were added:
- `week > 0`
- `event_min` must be between `0 and 120`
- `points` must be between `0 and 3`
- team names and venue names are **unique**
- no match can be scheduled at the same **date + time + venue**
- key descriptive fields set to `NOT NULL` (team_name, venues, consultant name, etc.)

---

## Analytical Questions (SQL Queries)

### Q1) List all players who belong to a specific participating group (e.g., Cohort 7)
- Demonstrates: `JOIN`, filtering with `WHERE`

### Q2) List all fixtures for a specific date including venue and team names (e.g., 2022-10-29)
- Demonstrates: multi-table joins across `match_fixture`, `venue`, `points_score`, `teams`

### Q3) List all players who have scored more than 2 goals
- Demonstrates: filtering events + aggregation (`COUNT`) + `HAVING` + join to get player names

### Q4) Count the number of yellow and red cards per team
- Demonstrates: conditional counting using `FILTER`, grouping by team

### Q5) Return games that are going to be played (friendly matches)
- Demonstrates: filtering by tournament type (`tournament_id = 'T2'`)

### Q6) Show total points earned by each team during the tournament
- Demonstrates: `SUM(points)` + `GROUP BY`

### Q7) For each team, show distribution of goals scored in 1st half vs 2nd half
- Demonstrates: conditional aggregation based on event minute (`<=45` vs `>45`)

---

## SQL Skills Demonstrated
- Schema design + relational modelling
- Primary keys and foreign keys
- Data validation constraints (`CHECK`, `UNIQUE`, `NOT NULL`)
- `INNER JOIN` across multiple tables
- Aggregations: `COUNT`, `SUM`
- `GROUP BY` and `HAVING`
- Conditional logic with `FILTER`
- Clean query writing for analysis use-cases

---

## How to Run
1. Create the schema `"RockborneFootballLeague"` in your SQL environment
2. Run the table creation + insert script
3. Run the query script to reproduce results

> Note: The SQL uses `FILTER` which is supported in **PostgreSQL**.

---

## Suggested Improvements (Next Steps)
- Add views (e.g. `league_table_view`) to make reporting easier
- Use window functions (`RANK()`, `ROW_NUMBER()`) to create leaderboards

---


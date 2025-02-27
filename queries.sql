-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database
-- General sql queries are not included shothand for column names are used as well.

-- Query 1: total number of matches played by each player
SELECT p."name" AS "player_name", COUNT(m."id")  AS  "matches_played"
FROM "players" p
    JOIN "matches" m ON p."id" = m."player_id"
GROUP BY p."name";

-- Query 2: total number of matches played by each agent
SELECT a."name" AS "agent_name", COUNT(m."id") AS  "matches_played" FROM "agents" a
JOIN "matches" m ON a."id" = m."agent_id"
GROUP BY a."name";


-- Query 3: Retrieve all matches played on a specific map
SELECT m."date", p."name" AS  "player_name", ag."name" AS "agent_name", ms."total_kills", ms."total_deaths", ms."total_time"
FROM "matches" m JOIN "players" p ON  m."player_id" = p."id"
JOIN "agents" ag ON m."agent_id" = ag."id"
JOIN "matchstats" ms ON m."id" = ms."match_id"
WHERE m."map_id" = 2;

-- Query 4: stats for particular agent
SELECT m."date", p."name" AS "player_name", ag."name" AS "agent_name", ms."total_kills", ms."total_deaths", ms."total_time"
FROM "matches" m
JOIN "players" p ON m."player_id" = p."id"
    JOIN "agents" ag ON m."agent_id" = ag."id"
JOIN "matchstats" ms ON m."id" = ms."match_id"
WHERE m."agent_id" = 5 ORDER BY m."date";

-- Query 5: stats and matches played between some dates
SELECT m."date", p."name" AS "player_name", ag."name" AS "agent_name", ms."total_kills", ms."total_deaths", ms."total_time"
FROM "matches" m
JOIN "players" p ON m."player_id" = p."id"
JOIN "agents" ag ON m."agent_id" = ag."id"
JOIN "matchstats" ms ON m."id" = ms."match_id"
WHERE m."date" BETWEEN '2024-01-01' AND '2024-01-10'
ORDER BY m."date";

-- Query 6: avg kills per match for each player
SELECT p."name" AS "player_name",  AVG(ms."total_kills")  AS "average_kills_per_match" FROM "players" p
JOIN "matches" m ON p."id" = m."player_id"
JOIN "matchstats" ms ON m."id" = ms."match_id"
GROUP BY p."name";

-- Query 7: agent payer use for most total kills
SELECT a."name" AS "agent_name", SUM(ms."total_kills") AS "total_kills" FROM "agents" a
JOIN "matches" m ON a."id" = m."agent_id"
JOIN "matchstats" ms ON m."id" = ms."match_id"
GROUP BY a."name"
ORDER BY "total_kills" DESC
LIMIT 1;

-- Query 8: map's kills and times of use
SELECT map."name" AS "map_name", COUNT(m."id") AS "matches_played", SUM(ms."total_kills") AS "total_kills" FROM "maps" map
JOIN "matches" m ON map."id" = m."map_id"
JOIN "matchstats" ms ON m."id" = ms."match_id"
GROUP BY map."name";

-- Query 9: to find player by agent on specific map
SELECT p."name" AS "player_name", a."name" AS "agent_name" FROM "players" p
JOIN "matches" m ON p."id" = m."player_id"
JOIN "agents" a ON m."agent_id" = a."id"
WHERE m."agent_id" = 3;

-- Query 10: agents choice by all players
SELECT p."name" AS "player_name", ag."name" AS "most_played_agent" FROM "players" p
JOIN "matches" m ON p."id" = m."player_id"
JOIN "agents" ag ON m."agent_id" = ag."id"
GROUP BY p."id", ag."name"
ORDER BY COUNT(m."id") DESC;


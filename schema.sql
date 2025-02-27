-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

--Players table schema

CREATE TABLE "players"(
    "id" INTEGER ,
    "name" TEXT NOT NULL,
    "username" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")
);

--Maps table schema

CREATE TABLE "maps"(
    "id" INTEGER ,
    "name" TEXT NOT NULL,
    PRIMARY KEY("id")
);

--Agents table schema

CREATE TABLE "agents"(
    "id" INTEGER ,
    "name" TEXT NOT NULL,
    "abilities" TEXT NOT NULL,
    PRIMARY KEY("id")
);

--Matches table schema
CREATE TABLE "matches"(
    "id" INTEGER ,
    "player_id" INTEGER NOT NULL,
    "map_id" INTEGER NOT NULL,
    "agent_id" INTEGER NOT NULL,
    "date" NUMERIC NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("player_id") REFERENCES "players"("id"),
    FOREIGN KEY("map_id") REFERENCES "maps"("id"),
    FOREIGN KEY("agent_id") REFERENCES "agents"("id")
);

--matchstats table schema

CREATE TABLE "matchstats"(
    "id" INTEGER,
    "match_id" INTEGER NOT NULL,
    "total_kills" INTEGER NOT NULL,
    "total_deaths" INTEGER NOT NULL,
    "total_time" NUMERIC NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("match_id") REFERENCES "matches"("id")
);

--INDEX(S)

--To speed up the process by seeing query plan
CREATE INDEX "player_match" ON "matches"("player_id","agent_id");
--other scans cannot be avoided as they are SUM, COUNT AND AVG functions.

--CREATE VIEW
CREATE VIEW "player" AS
SELECT "id","name","username" FROM "players";

--Players DUMMY VALUES
INSERT INTO "players"("name","username","password")
VALUES
('aswin','aswinragnarok','89f0519f9967a15610c57bd7597ceac3'),
('ganesh', 'darkgladiator', 'e10adc3949ba59abbe56e057f20f883e'),
('aashrith', 'throx', 'e10adc3949ba59abbe56e057f20f883e'),
('john_doe', 'john_doe_123', 'e10adc3949ba59abbe56e057f20f883e'),
('jane_smith', 'jane_smith99', '25d55ad283aa400af464c76d713c07ad'),
('mike_hunt', 'mike_hunt12', '5d41402abc4b2a76b9719d911017c592'),
('ash_ketchum', 'ash_pokemon', '7c6a180b36896a0a8c02787eeafb0e4c'),
('sarah_lee', 'sarah_lee89', '6cb75f652a9b52798eb6cf2201057c73'),
('robert_brown', 'rob_brown22', '098f6bcd4621d373cade4e832627b4f6'),
('emma_watson', 'emma_magic', '2a38a4a9316c49e5a833517c45d31070'),
('jack_black', 'jack_comedy', '8f14e45fceea167a5a36dedd4bea2543'),
('amy_adams', 'amy_adams11', 'd3d9446802a44259755d38e6d163e820'),
('charlie_pace', 'charlie_music', '45c48cce2e2d7fbdea1afc51c7c6ad26'),
('kate_austin', 'kate_escape', '6512bd43d9caa6e02c990b0a82652dca'),
('hurley_hugo', 'hurley_lost', 'c20ad4d76fe97759aa27a0c99bff6710'),
('sawyer_james', 'sawyer_con', 'c51ce410c124a10e0db5e4b97fc2af39'),
('john_locke', 'locke_faith', 'aab3238922bcc25a6f606eb525ffdc56'),
('desmond_hume', 'desmond_time', '9bf31c7ff062936a96d3c8bd1f8f2ff3'),
('sun_kwon', 'sun_garden', 'c74d97b01eae257e44aa9d5bade97baf'),
('jin_kwon', 'jin_love', '70efdf2ec9b086079795c442636b55fb'),
('ben_linus', 'ben_leader', '6f4922f45568161a8cdf4ad2299f6d23'),
('juliet_burke', 'juliet_doc', '1f0e3dad99908345f7439f8ffabdffc4'),
('miles_straume', 'miles_ghost', 'd9d4f495e875a2e075a1a4a6e1b9770f');


--Maps DUMMY VALUES
INSERT INTO "maps"("name")
VALUES
('Ascent'),
('Bind'),
('Haven'),
('Split'),
('Icebox'),
('Breeze'),
('Fracture'),
('Pearl'),
('Lotus'),
('Sunset');

--Agents DUMMY VALUES
INSERT INTO "agents"("name","abilities")
VALUES
('Jett', 'Dash'),
('Phoenix', 'Hot Hands'),
('Sage', 'Slow Orb'),
('Raze', 'Boom Bot'),
('Omen', 'Shrouded Step'),
('Breach', 'Flashpoint'),
('Viper', 'Snake Bite'),
('Cypher', 'Spycam'),
('Sova', 'Recon Bolt'),
('Reyna', 'Leer'),
('Killjoy', 'Nanoswarm'),
('Astra', 'Gravity Well'),
('Yoru', 'Gatecrash'),
('KAY/O', 'FRAG/ment'),
('Skye', 'Regrowth'),
('Sova', 'Owl Drone'),
('Breach', 'Aftershock'),
('KAY/O', 'Suppressing'),
('Viper', 'Toxic Screen'),
('Jett', 'Tailwind'),
('Sage', 'Resurrection'),
('Raze', 'Paint Shells'),
('Omen', 'Paranoia'),
('Phoenix', 'Blaze'),
('Astra', 'Nebula'),
('Skye', 'Trailblazer'),
('Yoru', 'Dimensional Drift'),
('Killjoy', 'Lockdown');

--Matches DUMMY VALUES
INSERT INTO "matches"("player_id","map_id","agent_id","date")
VALUES
(1,1,1,'2024-01-02'),
(5, 7, 13, '2024-01-12'),
(2, 4, 18, '2024-01-14'),
(17, 10, 3, '2024-01-08'),
(13, 1, 9, '2024-01-16'),
(10, 8, 7, '2024-01-03'),
(1, 3, 5, '2024-01-20'),
(14, 9, 2, '2024-01-10'),
(8, 6, 16, '2024-01-18'),
(15, 2, 19, '2024-01-21'),
(3, 5, 11, '2024-01-15'),
(9, 4, 20, '2024-01-17'),
(16, 3, 1, '2024-01-09'),
(11, 7, 12, '2024-01-06'),
(18, 10, 6, '2024-01-07'),
(6, 8, 8, '2024-01-13'),
(4, 9, 4, '2024-01-05'),
(20, 2, 14, '2024-01-04'),
(12, 1, 17, '2024-01-11'),
(19, 6, 15, '2024-01-19'),
(7, 5, 10, '2024-01-02');

--Matchestats DUMMY VALUES
INSERT INTO "matchstats"("match_id","total_kills","total_deaths","total_time")
VALUES
(16, 35, 20, '00:32:14'),
(3, 50, 18, '00:28:45'),
(7, 40, 25, '00:30:05'),
(1, 45, 20, '00:35:10'),
(12, 60, 15, '00:40:30'),
(10, 55, 22, '00:33:20'),
(19, 38, 19, '00:31:50'),
(2, 42, 21, '00:29:30'),
(14, 50, 23, '00:34:15'),
(5, 47, 28, '00:38:00'),
(18, 30, 17, '00:27:10'),
(9, 53, 30, '00:36:40'),
(6, 48, 26, '00:32:00'),
(8, 41, 24, '00:30:50'),
(15, 37, 22, '00:29:40'),
(13, 52, 19, '00:33:05'),
(17, 49, 21, '00:31:25'),
(20, 36, 27, '00:39:00'),
(4, 44, 20, '00:30:15');



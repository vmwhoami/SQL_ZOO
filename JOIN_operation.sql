-- 1. The first example shows the goal scored by a player with the last name 'Bender'. The * says to list all the columns in the table - a shorter way of saying matchid, teamid, player, gtime

-- Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'

SELECT matchid, player
FROM goal
WHERE teamid = 'GER'


-- 2. Show id, stadium, team1, team2 for just game 1012

SELECT id, stadium, team1, team2
FROM game
WHERE id = 1012

-- 3. Modify it to show the player, teamid, stadium and mdate for every German goal.

SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER'

-- 4. Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'

SELECT team1, team2, player
FROM game JOIN goal ON (game.id = goal.matchid)
WHERE player LIKE 'Mario%'

-- 5. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10

SELECT player, teamid, coach, gtime
FROM goal JOIN eteam ON (teamid = id)
WHERE gtime<=10


-- 6.  List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.

SELECT mdate, teamname
FROM game JOIN eteam ON (team1=eteam.id)
WHERE coach = 'Fernando Santos'

-- 7.List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw''

SELECT player
FROM goal
    JOIN game
    ON id = matchid
WHERE stadium =  'National Stadium, Warsaw'

-- 8.The example query shows all goals scored in the Germany-Greece quarterfinal.
-- Instead show the name of all players who scored a goal against Germany.

SELECT DISTINCT(player)
FROM goal
    JOIN game
    ON id = matchid
WHERE (team1= teamid AND team2='GER')
    OR (team2 = teamid AND team1 = 'GER')

-- 9.Show teamname and the total number of goals scored.
SELECT teamname, COUNT(*)
FROM goal x
    JOIN eteam y
    ON x.teamid = y.id
GROUP BY teamname

-- 10.Show the stadium and the number of goals scored in each stadium.

SELECT stadium, COUNT(*)
FROM game
    JOIN goal
    ON id = matchid
GROUP BY stadium


-- 11.For every match involving 'POL', show the matchid, date and the number of goals scored.
SELECT matchid, mdate, COUNT(*)
FROM game
    JOIN goal
    ON id = matchid
WHERE team1 = 'POL'
    OR team2 = 'POL'
GROUP BY matchid,mdate
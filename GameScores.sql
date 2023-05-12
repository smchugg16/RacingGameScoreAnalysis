*/
---Cleaning and Exploring Data using SQL Queries---

*/

SELECT * 
FROM RacingGames.dbo.GameScores

------------------------------------------------------------------------------------------

---Changing ReleaseDate Column Type---
ALTER TABLE RacingGames.dbo.GameScores
ALTER COLUMN ReleaseDate DATE

/*Checking For Date Type*/
SELECT * 
FROM RacingGames.dbo.GameScores
ORDER BY ReleaseDate desc

/*Fixing Spelling Mistakes*/
UPDATE RacingGames.dbo.GameScores SET Title = 'Burnout Revenge' WHERE Title IN ('Burnout Revnge')

SELECT * 
FROM RacingGames.dbo.GameScores
WHERE Title LIKE 'Burnout%'



------------------------------------------------------------------------------------------
/*Checking Average Scores of Popular Racing Game Franchises*/

---Checking For Games with Multiple Console Reviews---
SELECT Title, AVG(Score) AS AvgRate, COUNT(Title) AS VersionsCount
FROM RacingGames.dbo.GameScores
GROUP BY Title
ORDER BY VersionsCount desc, AvgRate desc

---Need For Speed---
SELECT Title, AVG(Score) AS AVGScore
FROM RacingGames.dbo.GameScores
WHERE Title LIKE 'Need For Speed%'
GROUP BY Title

---Forza Motorsport---
SELECT Title, AVG(Score) AS AVGScore
FROM RacingGames.dbo.GameScores
WHERE Title LIKE 'Forza Motorsport%'
GROUP BY Title

---Forza Horizon---
SELECT Title, AVG(Score) AS AVGScore
FROM RacingGames.dbo.GameScores
WHERE Title LIKE 'Forza Horizon%'
GROUP BY Title

---DiRT---
SELECT Title, AVG(Score) AS AVGScore
FROM RacingGames.dbo.GameScores
WHERE Title LIKE 'DiRT%'
GROUP BY Title

---Midnight Club---
SELECT Title, AVG(Score) AS AVGScore
FROM RacingGames.dbo.GameScores
WHERE Title LIKE 'Midnight Club%'
GROUP BY Title

---Gran Turismo---
SELECT Title, AVG(Score) AS AVGScore
FROM RacingGames.dbo.GameScores
WHERE Title LIKE 'Gran Turismo%'
GROUP BY Title

---Mario Kart---
SELECT Title, AVG(Score) AS AVGScore
FROM RacingGames.dbo.GameScores
WHERE Title LIKE 'Mario Kart%'
GROUP BY Title

---F1---
SELECT Title, AVG(Score) AS AVGScore
FROM RacingGames.dbo.GameScores
WHERE Title LIKE 'F1%'
GROUP BY Title

---Burnout---
SELECT Title, AVG(Score) AS AVGScore
FROM RacingGames.dbo.GameScores
WHERE Title LIKE 'Burnout%'
GROUP BY Title

---Colin McRae (Techincally DiRT)---
SELECT Title, AVG(Score) AS AVGScore
FROM RacingGames.dbo.GameScores
WHERE Title LIKE 'Colin McRae%'
GROUP BY Title

---NASCAR---
SELECT Title, AVG(Score) AS AVGScore
FROM RacingGames.dbo.GameScores
WHERE Title LIKE 'NASCAR%'
GROUP BY Title

---PGR---
SELECT Title, AVG(Score) AS AVGScore
FROM RacingGames.dbo.GameScores
WHERE Title LIKE 'Project Gotham%'
GROUP BY Title



-----------------------------------------------------------------------------------------
/*More Queries- Comparing Retro Games, Genres*/

---Do "Simulation" Racing Games Score Higher Than Arcade Racing Games?---
SELECT Genre, AVG(Score) AS GenreAvgScore
FROM RacingGames.dbo.GameScores
GROUP BY Genre
ORDER BY GenreAvgScore desc

---(Yes, but not by a considerable amount. Rally games have the lowest average score.)---


---Is there a "Retro Game" Bias (released before 2008- 15 years ago)?---
SELECT YEAR(ReleaseDate) AS RelYr, AVG(Score) AS YearAvgScore
FROM RacingGames.dbo.GameScores
GROUP BY YEAR(ReleaseDate)
ORDER BY YearAvgScore desc

---11 out of the Top 20 Here are 2008 or earlier, so not necessarily.---


-----------------------------------------------------------------------------------------
/*Grab Table For Export into Tableau*/
SELECT Title, Score, Console, Genre, ReleaseDate 
FROM RacingGames.dbo.GameScores
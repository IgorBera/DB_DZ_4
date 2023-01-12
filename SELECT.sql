SELECT name, production_year FROM album
WHERE production_year = 2018;

SELECT name, length FROM track
WHERE length = (SELECT MAX(length) FROM track);

SELECT name FROM track
WHERE (length / 60) >= 3.5;

SELECT name FROM collection
WHERE production_year BETWEEN 2018 AND 2020;

SELECT name FROM singer
WHERE name NOT LIKE '% %';

SELECT name FROM track
WHERE name LIKE '%my%' OR name LIKE '%мой%' OR name LIKE '%My%' OR name LIKE '%Мой%';

-- количество исполнителей в каждом жанре
SELECT g.name, COUNT(g.id) FROM genre g
JOIN genresinger gs ON g.id = gs.genre_id
GROUP BY g.name;

-- количество треков, вошедших в альбомы 2019-2020 годов
SELECT a.production_year, COUNT(t.id) FROM track t  
JOIN album a ON t.album_id = a.id
WHERE a.production_year BETWEEN 2019 AND 2020
GROUP BY a.production_year;

-- средняя продолжительность треков по каждому альбому
SELECT a.name, ROUND(AVG(t.length), 1) average  FROM album a
JOIN track t ON a.id = t.album_id 
GROUP BY a.name;

-- все исполнители, которые не выпустили альбомы в 2020 году
SELECT DISTINCT name FROM singer  
WHERE name NOT IN (
	SELECT s.name FROM singer s
	JOIN singeralbum sa  ON s.id = sa.singer_id 
	JOIN album a ON sa.album_id = a.id 
	WHERE a.production_year = 2020);

-- названия сборников, в которых присутствует конкретный исполнитель
SELECT DISTINCT c.name FROM collection c
JOIN trackcollection tc ON c.id = tc.collection_id 
JOIN track t ON tc.track_id = t.id 
JOIN album a ON t.album_id = a.id 
JOIN singeralbum sa ON a.id = sa.album_id 
JOIN singer s ON sa.singer_id = s.id 
WHERE s.name = 'ДДТ';

-- название альбомов, в которых присутствуют исполнители более 1 жанра
SELECT a.name FROM album a 
JOIN singeralbum sa ON a.id = sa.album_id 
JOIN singer s ON sa.singer_id = s.id 
JOIN genresinger gs ON s.id = gs.singer_id 
JOIN genre g ON gs.genre_id = g.id
GROUP BY a.name
HAVING COUNT(*) > 1;

-- наименование треков, которые не входят в сборники
SELECT t.name, t.id FROM track t 
LEFT JOIN trackcollection tc ON t.id = tc.track_id 
WHERE tc.track_id IS NULL;

-- исполнителя(-ей), написавшего самый короткий по продолжительности трек
SELECT s.name FROM singer s 
JOIN singeralbum sa ON s.id = sa.singer_id 
JOIN album a ON sa.album_id = a.id 
JOIN track t ON a.id = t.album_id 
WHERE length = (SELECT MIN(length) FROM track);

-- название альбомов, содержащих наименьшее количество треков
SELECT a.name FROM album a 
JOIN track t ON a.id = t.album_id 
GROUP BY a.name
HAVING (
	SELECT COUNT(id) FROM track 
	GROUP BY album_id
	ORDER BY COUNT(id)
	LIMIT 1) = COUNT(t.id);

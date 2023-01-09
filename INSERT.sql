INSERT INTO Genre(name)
VALUES
	('Rock'),
	('Dance'),
	('Hip-Hop'),
	('Pop'),
	('Rap'),
	('R&B');

INSERT INTO Singer(name)
VALUES
	('Би-2'),
	('Silience'),
	('FEDUK'),
	('NILETTO'),
	('GAAYAZOV$ BROTHER$'),
	('ДДТ'),
	('Chris Brown'),
	('50 Cent');

INSERT INTO GenreSinger(genre_id, singer_id)
VALUES
	(1, 1),
	(1, 6),
	(2, 2),
	(3, 3),
	(4, 4),
	(4, 5),
	(5, 8),
	(6, 7);

INSERT INTO Album(name, production_year)
VALUES
	('Мяу кисс ми', 2001),
	('I Dont Wanna Know - Single', 2020),
	('Хлопья летят наверх - Single', 2018),
	('Простым - ЕР', 2020),
	('Кредо', 2019),
	('Просвистела', 1994),
	('Indigo (Extend)', 2019),
	('The Massacre', 2005),
	('Come and Get You', 2018),
	('Криолит', 2022);

INSERT INTO SingerAlbum(album_id, singer_id)
VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 8),
	(9, 8),
	(10, 4);

INSERT INTO SingerAlbum(album_id, singer_id)
VALUES
	(8, 7),
	(5, 3);

INSERT INTO Track(album_id, length, name)
VALUES
	(1, 412, 'Мой рок-н-ролл'),
	(2, 175, 'I Dont Wanna Know'),
	(3, 248, 'Хлопья летят наверх'),
	(4, 191, 'Сирень'),
	(5, 179, 'До встречи на танцполе'),
	(6, 492, 'Это все...'),
	(7, 202, 'Under the influence'),
	(8, 256, 'Just a Lil Bit'),
	(6, 264, 'В последнюю осень'),
	(6, 304, 'Дождь'),
	(6, 289, 'Еду я на Родину'),
	(5, 202, 'Кредо'),
	(5, 209, 'Не ради радио'),
	(9, 83, 'Simply the Best'),
	(9, 159, 'Robbery 2'),
	(4, 158, 'M5'),
	(4, 178, 'My na na');

UPDATE Track SET album_id = 10 WHERE id = 16;

UPDATE Track SET album_id = 10 WHERE id = 17;

INSERT INTO Collection(name, production_year)
VALUES
	('Ку ку', 2003),
	('Осень...', 1999),
	('Dancing', 2021),
	('Niggers', 2020),
	('Новое поколение', 2022),
	('Рок-н-рол', 2000),
	('50', 2007),
	('Summmer dance', 2020);
	
INSERT INTO TrackCollection(collection_id, track_id)
VALUES
	(1, 1),
	(1, 10),
	(2, 6),
	(2, 9),
	(3, 2),
	(3, 7),
	(4, 7),
	(4, 14),
	(4, 15),
	(5, 3),
	(5, 17),
	(5, 16),
	(6, 6),
	(7, 14),
	(7, 15),
	(7, 8),
	(8, 2),
	(8, 5);

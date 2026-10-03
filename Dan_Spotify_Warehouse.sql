/* Data Warehouse Creation */


create database spotify;


create table country (countryid int identity(1,1) primary key, name varchar(255));


create table users (userid int identity(1,1) primary key, name varchar(255), age int, countryid int,
    foreign key (countryid) references country(countryid));


create table artist (artistid int identity(1,1) primary key, name varchar(255));


create table genre (genreid int identity(1,1) primary key, name varchar(255));


create table album (albumid int identity(1,1) primary key, name varchar(255), releasedate date, artistid int, 
    foreign key (artistid) references artist(artistid));


create table song (songid int identity(1,1) primary key, name varchar(255), artistid int, albumid int, genreid int,
    foreign key (artistid) references artist(artistid),
    foreign key (albumid) references album(albumid),
    foreign key (genreid) references genre(genreid));


create table time (timeid int identity(1,1) primary key, date date, hour int, day varchar(20), month varchar(20), year int);


create table stream (streamid int identity(1,1) primary key, userid int, username varchar(255), songid int, songname varchar(255),
    artistid int, artistname varchar(255), albumid int, albumname varchar(255), genreid int, genrename varchar(255), timeid int,
    date date, hour int, countryid int, countryname varchar(255),
    foreign key (userid) references users(userid),
    foreign key (songid) references song(songid),
    foreign key (artistid) references artist(artistid),
    foreign key (albumid) references album(albumid),
    foreign key (genreid) references genre(genreid),
    foreign key (timeid) references time(timeid),
    foreign key (countryid) references country(countryid));


insert into country (name) values ('Cote d''Ivoire'), ('France'), ('United States'), ('Nigeria'), ('United Kingdom');


insert into users (name, age, countryid) values ('Dan', 28, 1), ('Kouakou', 21, 2), ('Arturo', 24, 3), ('Sarah', 20, 4), ('Yao', 22, 5),
    ('Boniface', 19, 1), ('Emma', 23, 2), ('Lazare', 25, 3), ('Grace', 21, 4), ('Kevin', 20, 1);


insert into artist (name) values ('Drake'), ('The Weeknd'), ('Rema'), ('Travis Scott'), ('Future'), ('Burna Boy');


insert into genre (name) values ('Hip Hop'), ('R&B'), ('Afrobeats'), ('Trap');


insert into album (name, releasedate, artistid) values ('For All The Dogs', '2023-10-06', 1), ('After Hours', '2020-03-20', 2),
    ('Heis', '2024-06-19', 3), ('Utopia', '2023-07-28', 4), ('I Never Liked You', '2022-04-29', 5), ('African Giant', '2019-07-26', 6);


insert into song (name, artistid, albumid, genreid) values ('Virginia Beach', 1, 1, 1), ('Blinding Lights', 2, 2, 2), ('Calm Down', 3, 3, 3),
    ('FEIN', 4, 4, 4), ('WAIT FOR U', 5, 5, 4), ('Anybody', 6, 6, 3);


insert into time (date, hour, day, month, year) values 
('2026-10-01', 8, 'Thursday', 'October', 2026), ('2026-10-01', 12, 'Thursday', 'October', 2026),
('2026-10-01', 18, 'Thursday', 'October', 2026), ('2026-10-01', 20, 'Thursday', 'October', 2026),
('2026-10-02', 10, 'Friday', 'October', 2026), ('2026-10-02', 15, 'Friday', 'October', 2026),
('2026-10-02', 19, 'Friday', 'October', 2026), ('2026-10-02', 21, 'Friday', 'October', 2026),
('2026-10-03', 9, 'Saturday', 'October', 2026), ('2026-10-03', 20, 'Saturday', 'October', 2026);


insert into stream (userid, username, songid, songname, artistid, artistname, albumid, albumname, genreid, genrename, timeid, date, hour,
    countryid, countryname) values

(1, 'Dan', 1, 'Virginia Beach', 1, 'Drake', 1, 'For All The Dogs', 1, 'Hip Hop', 1, '2026-10-01', 8, 1, 'Cote d''Ivoire'),
(2, 'Kouakou', 2, 'Blinding Lights', 2, 'The Weeknd', 2, 'After Hours', 2, 'R&B', 2, '2026-10-01', 12, 2, 'France'),
(3, 'Arturo', 2, 'Blinding Lights', 2, 'The Weeknd', 2, 'After Hours', 2, 'R&B', 3, '2026-10-01', 18, 3, 'United States'),
(4, 'Sarah', 3, 'Calm Down', 3, 'Rema', 3, 'Heis', 3, 'Afrobeats', 4, '2026-10-01', 20, 4, 'Nigeria'),
(5, 'Yao', 4, 'FEIN', 4, 'Travis Scott', 4, 'Utopia', 4, 'Trap', 5, '2026-10-02', 10, 5, 'United Kingdom'),
(6, 'Boniface', 3, 'Calm Down', 3, 'Rema', 3, 'Heis', 3, 'Afrobeats', 6, '2026-10-02', 15, 1, 'Cote d''Ivoire'),
(7, 'Emma', 2, 'Blinding Lights', 2, 'The Weeknd', 2, 'After Hours', 2, 'R&B', 7, '2026-10-02', 19, 2, 'France'),
(8, 'Lazare', 5, 'WAIT FOR U', 5, 'Future', 5, 'I Never Liked You', 4, 'Trap', 8, '2026-10-02', 21, 3, 'United States'),
(9, 'Grace', 6, 'Anybody', 6, 'Burna Boy', 6, 'African Giant', 3, 'Afrobeats', 9, '2026-10-03', 9, 4, 'Nigeria'),
(10, 'Kevin', 3, 'Calm Down', 3, 'Rema', 3, 'Heis', 3, 'Afrobeats', 10, '2026-10-03', 20, 1, 'Cote d''Ivoire'),

(1, 'Dan', 2, 'Blinding Lights', 2, 'The Weeknd', 2, 'After Hours', 2, 'R&B', 3, '2026-10-01', 18, 1, 'Cote d''Ivoire'),
(2, 'Kouakou', 3, 'Calm Down', 3, 'Rema', 3, 'Heis', 3, 'Afrobeats', 4, '2026-10-01', 20, 2, 'France'),
(3, 'Arturo', 4, 'FEIN', 4, 'Travis Scott', 4, 'Utopia', 4, 'Trap', 5, '2026-10-02', 10, 3, 'United States'),
(4, 'Sarah', 2, 'Blinding Lights', 2, 'The Weeknd', 2, 'After Hours', 2, 'R&B', 7, '2026-10-02', 19, 4, 'Nigeria'),
(5, 'Yao', 3, 'Calm Down', 3, 'Rema', 3, 'Heis', 3, 'Afrobeats', 8, '2026-10-02', 21, 5, 'United Kingdom'),
(6, 'Boniface', 2, 'Blinding Lights', 2, 'The Weeknd', 2, 'After Hours', 2, 'R&B', 10, '2026-10-03', 20, 1, 'Cote d''Ivoire'),
(7, 'Emma', 6, 'Anybody', 6, 'Burna Boy', 6, 'African Giant', 3, 'Afrobeats', 3, '2026-10-01', 18, 2, 'France'),
(8, 'Lazare', 4, 'FEIN', 4, 'Travis Scott', 4, 'Utopia', 4, 'Trap', 4, '2026-10-01', 20, 3, 'United States'),
(9, 'Grace', 3, 'Calm Down', 3, 'Rema', 3, 'Heis', 3, 'Afrobeats', 7, '2026-10-02', 19, 4, 'Nigeria'),
(10, 'Kevin', 1, 'Virginia Beach', 1, 'Drake', 1, 'For All The Dogs', 1, 'Hip Hop', 8, '2026-10-02', 21, 1, 'Cote d''Ivoire');


/* Queries */

/* Most streamed songs */
select songname, count(*) as streams
from stream
group by songname
order by streams desc;


/* Most popular artists */
select artistname, count(*) as streams
from stream
group by artistname
order by streams desc;


/* Most listened genres */
select genrename, count(*) as streams
from stream
group by genrename
order by streams desc;


/* Countries with the most streams */
select countryname, count(*) as streams
from stream
group by countryname
order by streams desc;


/* Most popular listening hours */
select hour, count(*) as streams
from stream
group by hour
order by streams desc;


/* Users with the most streams */
select username, count(*) as streams
from stream
group by username
order by streams desc;


/* Streams by day */
select date, count(*) as streams
from stream
group by date
order by date;


/* Songs by country */
select countryname, songname, count(*) as streams
from stream
group by countryname, songname
order by countryname, streams desc;


/* Artists by country */
select countryname, artistname, count(*) as streams
from stream
group by countryname, artistname
order by countryname, streams desc;


/* Genres by country */
select countryname, genrename, count(*) as streams
from stream
group by countryname, genrename
order by countryname, streams desc;

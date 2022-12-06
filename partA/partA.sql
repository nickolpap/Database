/*						CREATE TABLE						*/
/*Movies_metadata */

create table "Movies_Metadata"(
   adult varchar(10),
   belongs_to_collection varchar(190),
   budget int,
   genres varchar(270),
   homepage varchar(250),
   id int,
   imdb_id varchar(10),
   original_language varchar(10),
   original_title varchar(110),
   overview varchar(1000),
   popularity varchar(10),
   poster_path varchar(40),
   production_companies varchar(1260),
   production_countries varchar(1040),
   release_date date,
   revenue int,
   runtime varchar(10),
   spoken_languages varchar(770),
   status varchar(20),
   tagline varchar(300),
   title varchar(110),
   video varchar(10),
   vote_average varchar(10),
   vote_count int
);

/* Keywords */

create table "Keywords"(
   id int,
   keywords text
);


/* Links */

create table "Links"(
   movieId int,
   imdbId int,
   tmdbId int
); 

/* Ratings_small */

create table "Ratings_Small"(
   userId int,
   movieId int,
   rating varchar(10),
   timestamp int
);

/* Credits */

create table "Credits" (
   "cast" text,
   crew text,
   id int
);

/*						Επεξεργασία δεδομένων						*/				
/*					Movies_metadata					 */
/* Τύποι δεδομένων */
ALTER TABLE "Movies_Metadata"
ALTER COLUMN revenue TYPE VARCHAR(255);

/* Διπλότυπα */
create table "Movies_Metadata2"(
   id int,
   adult varchar(10),
   belongs_to_collection varchar(190),
   budget int,
   genres varchar(270),
   homepage varchar(250),
   imdb_id varchar(10),
   original_language varchar(10),
   original_title varchar(110),
   overview varchar(1000),
   popularity varchar(10),
   poster_path varchar(40),
   production_companies varchar(1260),
   production_countries varchar(1040),
   release_date date,
   revenue int,
   runtime varchar(10),
   spoken_languages varchar(770),
   status varchar(20),
   tagline varchar(300),
   title varchar(110),
   video varchar(10),
   vote_average varchar(10),
   vote_count int
);
/*****************/
INSERT INTO "Movies_Metadata2"
SELECT DISTINCT id
FROM "Movies_Metadata";
	
/***********************/	
UPDATE "Movies_Metadata2"
SET 
   adult = "Movies_Metadata".adult,
   belongs_to_collection = "Movies_Metadata".belongs_to_collection,
   budget = "Movies_Metadata".budget,
   genres = "Movies_Metadata".genres,
   homepage = "Movies_Metadata".homepage,
   imdb_id = "Movies_Metadata".imdb_id ,
   original_language = "Movies_Metadata".original_language,
   original_title =  "Movies_Metadata".original_title ,
   overview = "Movies_Metadata".overview,
   popularity = "Movies_Metadata".popularity,
   poster_path = "Movies_Metadata".poster_path,
   production_companies = "Movies_Metadata".production_companies ,
   production_countries = "Movies_Metadata".production_countries,
   release_date = "Movies_Metadata".release_date,
   revenue = "Movies_Metadata".revenue ,
   runtime =  "Movies_Metadata".runtime ,
   spoken_languages = "Movies_Metadata".spoken_languages,
   status =  "Movies_Metadata".status,
   tagline = "Movies_Metadata".tagline,
   title = "Movies_Metadata".title,
   video = "Movies_Metadata".video,
   vote_average = "Movies_Metadata".vote_average ,
   vote_count =  "Movies_Metadata".vote_count 
FROM "Movies_Metadata"
WHERE "Movies_Metadata2".id = "Movies_Metadata".id


/* Primary Key */

ALTER TABLE "Movies_Metadata"
ADD PRIMARY KEY (id) ;

/*					Credits 					*/

/* Διπλότυπα */


create table "Credits2" (
	id int
   "cast" text,
   crew text,
   id int
); 
/**************/
INSERT INTO "Credits2"
SELECT DISTINCT id
FROM "Credits";

/*********************/
UPDATE "Credits3"
SET 
	"cast" = "Credits".cast,
	crew = "Credits".crew
FROM "Credits"
WHERE "Credits".id = "Credits3".id 


/* Primary Key */

ALTER TABLE "Credits3"
ADD PRIMARY KEY (id);

/*Foreign Key */
ALTER TABLE "Credits3"
ADD FOREIGN KEY (id) REFERENCES
"Movies_Metadata"(id);


/*					Keywords					 */

/* Primary Key */
ALTER TABLE "Keywords"
ADD PRIMARY KEY (id) ;

/*Foreign Key*/

ALTER TABLE "Keywords"
ADD FOREIGN KEY (id) REFERENCES
"Movies_Metadata"(id);

/* Διπλότυπα */
create table "Keywords2"(
   id int,
   keywords text
);
/******************/
INSERT INTO "Keywords2"
SELECT DISTINCT id
FROM "Keywords";
/**********************/
UPDATE "Keywords2"
SET 
	keywords = "Keywords".keywords
FROM "Keywords"
WHERE "Keywords2".id = "Keywords".id

/*					Links 					*/

/*Primary Key */

ALTER TABLE "Links"
ADD PRIMARY KEY (movieid);

/* Foreign Key */

ALTER TABLE "Links"
ADD FOREIGN KEY(tmdbid) REFERENCES
"Movies_Metadata"(id);


	
/* 					Ratings_Small					*/

/*Primary Key */
ALTER TABLE "Ratings_small"
ADD PRIMARY KEY (movieid , userid);

/* Foreign Key */

ALTER TABLE "Ratings_small"
ADD FOREIGN KEY(movieid) REFERENCES
"Movies_Metadata"(id);


/*				Διαγραφή δεδομένων που δεν ανήκουν στο Movies_Metadata					*/


/*Links*/

CREATE TABLE "Links3"
AS( 
	SELECT "Links".movieid , "Links".imdbid , "Links".tmdbid
	FROM "Links"
	INNER JOIN "Movies_Metadata"
	ON "Links".tmdbid = "Movies_Metadata".id
	WHERE "Links".tmdbid = "Movies_Metadata".id);

/*Ratings_Small*/

CREATE TABLE "Ratings_small2"
AS( 
	SELECT "Ratings_small".movieid ,"Ratings_small".userid ,"Ratings_small".rating
	FROM "Ratings_small"
	INNER JOIN "Movies_Metadata"
	ON "Ratings_small".movieid = "Movies_Metadata".id
	WHERE "Ratings_small".movieid = "Movies_Metadata".id);







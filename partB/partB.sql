/*					 Αριθμός ταινιών ανά χρόνο					 */

SELECT "Movies_Metadata".release_date ,
	    COUNT("Movies_Metadata".title)
FROM "Movies_Metadata"
GROUP BY "Movies_Metadata".release_date;


/* 					Αριθμός ταινιών ανά είδος(genre) 			 */

SELECT "Movies_Metadata".genres ,
	    COUNT("Movies_Metadata".title)
FROM "Movies_Metadata"
GROUP BY "Movies_Metadata".genres;


/* 					Αριθμός ταινιών ανά είδος(genre) και ανά χρόνο*/

SELECT "Movies_Metadata".genres ,"Movies_Metadata".release_date,
	    COUNT("Movies_Metadata".title)
FROM "Movies_Metadata"
GROUP BY "Movies_Metadata".genres ,"Movies_Metadata".release_date;

/* 					Μέση βαθμολογία (rating) ανά είδος (ταινίας)   */

SELECT "Movies_Metadata".genres ,AVG("Ratings_small".rating)
	FROM "Movies_Metadata" 
	INNER JOIN "Ratings_small"
	ON "Ratings_small".movieid = "Movies_Metadata".id
	GROUP BY "Movies_Metadata".genres

/*					 Αριθμός από ratings ανά χρήστη				  */

SELECT "Ratings_small".userId ,
	    COUNT("Ratings_small".rating)
FROM "Ratings_small"
GROUP BY "Ratings_small".userId ;

/*					 Μέση βαθμολογία (rating) ανά χρήστη 		*/
 
SELECT "Ratings_small".userid ,
		AVG("Ratings_small".rating)
FROM "Ratings_small"
GROUP BY "Ratings_small".userid ;

/* View Table : αποθήκευση αριθμού ratings και μέση βαθμολογία που έχει βάλει 
				κάθε χρήστης */

CREATE VIEW V AS
	SELECT "Ratings_small".userId ,
			AVG ("Ratings_small".rating) , 
			COUNT("Ratings_small".rating)
	FROM "Ratings_small"
	GROUP BY "Ratings_small".userId 
	
	

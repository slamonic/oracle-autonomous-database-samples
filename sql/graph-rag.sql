

CREATE TABLE MOVIE (
    MOVIE_ID        NUMBER,
    TITLE           VARCHAR2(400),
    GENRES          JSON,
    SUMMARY         VARCHAR2(16000)
);

CREATE TABLE MOVIE_CUSTOMER (
    CUST_ID        NUMBER,
    FIRSTNAME      VARCHAR(200),
    LASTNAME       VARCHAR(200)
);

CREATE TABLE WATCHED_MOVIE (
    DAY_ID            TIMESTAMP(6),      
    MOVIE_ID          NUMBER,
    PROMO_CUST_ID     NUMBER
);

INSERT INTO MOVIE (MOVIE_ID, TITLE, GENRES, SUMMARY) VALUES
    (1, 'Inception', '{"Action": "Sci-Fi"}', 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.'),
    (2, 'The Matrix', '{"Action": "Sci-Fi"}', 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.'),
    (3, 'The Godfather', '{"Drama": "Crime"}', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.'),
    (4, 'Titanic', '{"Romance": "Drama"}', 'A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.'),
    (5, 'Toy Story', '{"Animation": "Adventure"}', 'A cowboy doll is profoundly threatened and jealous when a new spaceman figure supplants him as top toy in a boy''s room.');

INSERT INTO MOVIE_CUSTOMER (CUST_ID, FIRSTNAME, LASTNAME) VALUES
    (101, 'John', 'Doe'),
    (102, 'Jane', 'Smith'),
    (103, 'Sam', 'Wilson'),
    (104, 'Emily', 'Clark'),
    (105, 'Michael', 'Johnson');

INSERT INTO WATCHED_MOVIE (DAY_ID, MOVIE_ID, PROMO_CUST_ID) VALUES
    (TO_TIMESTAMP('2024-10-30 12:34:56', 'YYYY-MM-DD HH24:MI:SS'), 1, 101),
    (TO_TIMESTAMP('2024-10-31 12:34:56', 'YYYY-MM-DD HH24:MI:SS'), 2, 101),
    (TO_TIMESTAMP('2024-09-31 12:34:56', 'YYYY-MM-DD HH24:MI:SS'), 3, 101),
    (TO_TIMESTAMP('2024-10-31 09:15:23', 'YYYY-MM-DD HH24:MI:SS'), 2, 102),
    (TO_TIMESTAMP('2024-11-01 16:45:12', 'YYYY-MM-DD HH24:MI:SS'), 3, 103),
    (TO_TIMESTAMP('2024-11-02 18:22:43', 'YYYY-MM-DD HH24:MI:SS'), 4, 104),
    (TO_TIMESTAMP('2024-11-03 20:01:00', 'YYYY-MM-DD HH24:MI:SS'), 5, 105);    

CREATE PROPERTY GRAPH CUSTOMER_WATCHED_MOVIES
    VERTEX TABLES (
        MOVIES_CUSTOMER AS CUSTOMER
            KEY(CUST_ID),
        MOVIES AS MOVIE
            KEY(MOVIE_ID)
    )
    EDGE TABLES(
        WATCHED_MOVIE AS WATCHED
            KEY(DAY_ID, MOVIE_ID, PROMO_CUST_ID)
            SOURCE KEY (PROMO_CUST_ID) REFERENCES CUSTOMER(CUST_ID)
            DESTINATION KEY (MOVIE_ID) REFERENCES MOVIE(MOVIE_ID)
    );    

    SELECT * 
    FROM GRAPH_TABLE(CUSTOMER_WATCHED_MOVIES
    MATCH (c IS CUSTOMER) -[w IS WATCHED]-> (m IS MOVIE)
    COLUMNS(
        c.FIRSTNAME AS FIRSTNAME, 
        c.LASTNAME AS LASTNAME, 
        m.TITLE AS MOVIE_TITLE, 
        w.DAY_ID as DAY_WATCHED)
    );    
CREATE TABLE MOVIES (
    MOVIE_ID        NUMBER,
    TITLE           VARCHAR2(400),
    GENRES          JSON,
    SUMMARY         VARCHAR2(16000)
);

CREATE TABLE MOVIES_CUSTOMER (
    CUST_ID        NUMBER,
    FIRSTNAME      VARCHAR(200),
    LASTNAME       VARCHAR(200)
);

CREATE TABLE WATCHED_MOVIE (
    DAY_ID            TIMESTAMP(6),      
    MOVIE_ID          NUMBER,
    PROMO_CUST_ID     NUMBER
);

CREATE TABLE WATCHED_WITH (
    ID                NUMBER,
    WP_ID             NUMBER,
    WATCHER           NUMBER,
    WATCHED_WITH      NUMBER,
    DATE_WATCHED      TIMESTAMP(6),
    MOVIE_ID          NUMBER,
    WATCH_PARTY_NAME  VARCHAR(200)
);

INSERT INTO MOVIES (MOVIE_ID, TITLE, GENRES, SUMMARY) VALUES
    (1, 'Inception', '{"Action": "Sci-Fi"}', 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.'),
    (2, 'The Matrix', '{"Action": "Sci-Fi"}', 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.'),
    (3, 'The Godfather', '{"Drama": "Crime"}', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.'),
    (4, 'Titanic', '{"Romance": "Drama"}', 'A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.'),
    (5, 'Toy Story', '{"Animation": "Adventure"}', 'A cowboy doll is profoundly threatened and jealous when a new spaceman figure supplants him as top toy in a boy''s room.');

INSERT INTO MOVIES_CUSTOMER (CUST_ID, FIRSTNAME, LASTNAME) VALUES
    (101, 'John', 'Doe'),
    (102, 'Jane', 'Smith'),
    (103, 'Sam', 'Wilson'),
    (104, 'Emily', 'Clark'),
    (105, 'Michael', 'Johnson');

INSERT INTO WATCHED_MOVIE (DAY_ID, MOVIE_ID, PROMO_CUST_ID) VALUES
    (TO_TIMESTAMP('2024-10-30 12:34:56.123456', 'YYYY-MM-DD HH24:MI:SS.FF'), 1, 101),
    (TO_TIMESTAMP('2024-10-30 12:34:56.123456', 'YYYY-MM-DD HH24:MI:SS.FF'), 1, 102),
    (TO_TIMESTAMP('2024-10-30 12:34:56.123456', 'YYYY-MM-DD HH24:MI:SS.FF'), 1, 103),
    (TO_TIMESTAMP('2024-10-31 12:34:56.123456', 'YYYY-MM-DD HH24:MI:SS.FF'), 2, 101),
    (TO_TIMESTAMP('2024-09-30 12:34:56.123456', 'YYYY-MM-DD HH24:MI:SS.FF'), 3, 101),
    (TO_TIMESTAMP('2024-10-31 09:15:23.654321', 'YYYY-MM-DD HH24:MI:SS.FF'), 2, 102),
    (TO_TIMESTAMP('2024-11-01 16:45:12.987654', 'YYYY-MM-DD HH24:MI:SS.FF'), 3, 103),
    (TO_TIMESTAMP('2024-11-02 18:22:43.123456', 'YYYY-MM-DD HH24:MI:SS.FF'), 4, 104),
    (TO_TIMESTAMP('2024-11-03 20:01:00.000000', 'YYYY-MM-DD HH24:MI:SS.FF'), 5, 105);

INSERT INTO WATCHED_WITH (ID, WP_ID, WATCHER, WATCHED_WITH, DATE_WATCHED, MOVIE_ID, WATCH_PARTY_NAME) VALUES 
    (1, 101, 101, 102, TO_TIMESTAMP('2024-10-30 12:34:56.123456', 'YYYY-MM-DD HH24:MI:SS.FF'), 1, 'New Year Party'),
    (2, 101, 101, 103, TO_TIMESTAMP('2024-10-30 12:34:56.123456', 'YYYY-MM-DD HH24:MI:SS.FF'), 1, 'New Year Party'),
    (3, 101, 102, 103, TO_TIMESTAMP('2024-10-30 12:34:56.123456', 'YYYY-MM-DD HH24:MI:SS.FF'), 1, 'New Year Party'),
    (4, 102, 101, 103, TO_TIMESTAMP('2024-10-30 12:34:56.123456', 'YYYY-MM-DD HH24:MI:SS.FF'), 3, 'Doe Watch Party'),
    (5, 102, 101, 103, TO_TIMESTAMP('2024-10-30 12:34:56.123456', 'YYYY-MM-DD HH24:MI:SS.FF'), 3, 'Doe Watch Party'),
    (6, 102, 104, 103, TO_TIMESTAMP('2024-10-30 12:34:56.123456', 'YYYY-MM-DD HH24:MI:SS.FF'), 3, 'Doe Watch Party'),
    (7, 102, 101, 104, TO_TIMESTAMP('2024-10-30 12:34:56.123456', 'YYYY-MM-DD HH24:MI:SS.FF'), 3, 'Doe Watch Party');


BEGIN
DBMS_CLOUD.CREATE_CREDENTIAL (
    credential_name => 'GRAPH_CREDENTIAL',
    user_ocid       => 'ocid1.user.oc1..aaaaaaaan4vamdkpzj4mcayzihhbdbty27bsomnlpmshu5hcy3w6ceqfwieq',
    tenancy_ocid    => 'ocid1.tenancy.oc1..aaaaaaaaj4ccqe763dizkrcdbs5x7ufvmmojd24mb6utvkymyo4xwxyv3gfa',
    private_key     => 'MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCDoD9ZzA5BMbtx
7wf/RnIKilbzhTNAtqMlbQD7s5SbxJkG8q5TfdZLFNFMa453czF6ArwmA5XEU2j1
5ndunsXNdWJdPUXIIg2E2B1xrvTQ2fK7yxpTzCpTQEIBKcPUrUdGIfP4wssOJJ1m
NUrR5a9CILWxj26E4OduPFLFSI05uMtXGz510u8MBJMBhcRW2OZPpAozwtJz0sOZ
hwCKDqZYQQTmFYjqZTdsMbuCef44EU1iuFg6rSMEZI3d65AQ4+beldVVu7iOVTvy
XoEZpedk8EPGjl9zhRMheOA5unoMfcKvGWPdqUIQXOSyUe5lPu2TlEflAkAyx55d
FfxSvdcfAgMBAAECggEADon51WpjvLHImaokgP8AA8gKGLYC1kgWN0EWFbddV+Nc
X9cYiGJi9EIlaEKNJwaTVX3N2IkW1uu7sUW2tYJWKP6pUdE9zwBr69uPTQpdQmCA
nlut2cm4dx+m6sf5OJm3QLjpYPXrRfGnbS2/yPWM6UoBp85HD+hjx9pj7iS4bMKj
LT+7CwNgicEw+J6N2omr5qeGaavyUlWQ4tSIZKhCKliBnk7CNvVkJ7z/ywugc9Ns
Z0vlCrhduP1VpsrvzcXmEIwGSP7Z+L7bTQUkULMtxOE/LXLtDFd/I/HO32qEgbT7
Bo0LDRvNC9+fthulJ3wRu1XpyNJm5RMtiywMIzHT0QKBgQC5eIghgjHRBVk3rEyr
40yTKv7Z+FJcQywsT146QpxpEeTJrCnPMoZwecVkGqkQUMWTwQpYU6dUBnLyqcMl
FVrrAoYfmvECeCjqWS11281WQCeYzdIDJ328T+wrFHh4RjFh4GmzQQVU6ZiS5iUT
ylTtaqH+jvdMkjLJXvbz4YUypwKBgQC1rfPSxF5ChFzSsW8LU/whVs/Mtf+LbxJ6
j2MeAqzzKng9rEZPP0r8qQmWGrUvsyx0ikslMJC88ZmG+JWHtVkbUVxQckpyfCIz
971AFLxLZ1+rjFdqAj124MsYndXUyJ16Lg+BShsiCDlair08YcsVt7k0aPS3vTlA
svOqb6qeyQKBgBlkzFayKbnxnoaF27WJGHnp4Bzd6ADj3Y9vino1lo64OXf3T34j
785Ejecn00/9jx+sxYrUYUua2nApGCPiqaEVpmF7aFYrN4bmkNfbMWEGxaUhQQjX
hlqbIr2/PsNQ8P/ypuY5F87JcO9j/V2ZTUl4WReuYWOlfLiffPZlQURvAoGAQqG9
3vsuJu8srAlvVJRE0GVqaQYG5zihalnUXFlW3QgieVwJnV71PZ0xat/4u7nXABcI
YGdjbiidyia5kMAuIhrA5LBGJZ7pXG3r9uij9nO/Xsdl9/dCW6suUaTxm8zIFNt3
zE9FjEG/5zkjFlY3iYuMXXBw8EJyEQyQ2V2DEiECgYB9NzPtecCBkcFVgvSaLlAy
hK4aQ4EFNe9tzK8v/J0UDNehJPHaapqfnc67o2dQaKdgW61R4IZTiR8B3GUB46Zm
JZGZDfyPVx/V2lo12vm+TaPntdgcvUBmvtCN/lW7qg3pmsiGOhaJ8Dq+JUkaqDpD
32uYReMIx+O7R6ua5rmuiA==',
fingerprint     => '5d:cf:7e:55:16:20:e1:60:f6:31:57:4d:ab:f7:35:98');
END;
/

BEGIN   
     -- drops the profile if it already exists
     DBMS_CLOUD_AI.drop_profile(profile_name => 'genai', force => true);

     -- Create an AI profile that uses the default LLAMA model on OCI
     dbms_cloud_ai.create_profile(
         profile_name => 'genai',
         attributes =>       
             '{"provider": "oci",
             "credential_name": "GRAPH_CREDENTIAL",
             "comments":"true",            
             "oci_compartment_id": "ocid1.compartment.oc1..aaaaaaaajlby3soifhkjobwner46lpjf5zvwugnzrmdfymtcdu6r2lvtti7a",
             "region":"us-chicago-1",
             "object_list": [
                 {"owner": "ADMIN", "name": "MOVIES"},
                 {"owner": "ADMIN", "name": "MOVIES_CUSTOMER"},
                 {"owner": "ADMIN", "name": "WATCHED_MOVIE"},
                 {"owner": "ADMIN", "name": "WATCHED_WITH"}
             ]
             }'
         );
 END;



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
                DESTINATION KEY (MOVIE_ID) REFERENCES MOVIE(MOVIE_ID),
            WATCHED_WITH
                KEY(ID)
                SOURCE KEY (WATCHER) REFERENCES CUSTOMER(CUST_ID)
                DESTINATION KEY (WATCHED_WITH) REFERENCES CUSTOMER(CUST_ID)
        );

-- Get the Movie title and summary for each movie a customer has watched
-- We can send this to an LLM as a Graph RAG solution to answer questions like 
--- "What is the genre of {movie} based on this summary"
SELECT DISTINCT MOVIE_TITLE, MOVIE_SUMMARY
    FROM GRAPH_TABLE( CUSTOMER_WATCHED_MOVIES
        MATCH (c1 IS CUSTOMER)-[e1 IS WATCHED]->(m IS MOVIE)
        COLUMNS (m.title as MOVIE_TITLE, m.summary as MOVIE_SUMMARY) 
    );

WITH prompt_document AS (
    SELECT
        JSON_OBJECT ('TASK' VALUE 'What is the genre of this movie based on this summary',
        MOVIE_TITLE,
        MOVIE_SUMMARY ) AS prompt_details
        FROM GRAPH_TABLE(CUSTOMER_WATCHED_MOVIES
        MATCH (c1 IS CUSTOMER)-[e1 IS WATCHED]->(m IS MOVIE)
        COLUMNS (m.title as MOVIE_TITLE, m.summary as MOVIE_SUMMARY) 
    )
)
SELECT 
    DBMS_LOB.SUBSTR(DBMS_CLOUD_AI.GENERATE(
        PROMPT => prompt_details,
        PROFILE_NAME => 'genai',
        ACTION       => 'chat'
    ), 4000, 1) AS Answer
FROM prompt_document;

-- Find customers who are connected through 2/3 watch party connections
SELECT DISTINCT *
    FROM GRAPH_TABLE( CUSTOMER_WATCHED_MOVIES
        MATCH (c1 IS CUSTOMER)-[e1 IS WATCHED_WITH]-{2,3}(c2 IS CUSTOMER)
        COLUMNS (c1.CUST_ID as c1_cust_id, c1.FIRSTNAME as c1_fist_name, c2.cust_id as c2_cust_id, c2.FIRSTNAME as c2_fist_name) 
    );

-- Find customers who have watched the same movie and are connected in 2/3 hops, excluding results where customer 1 and 2 are the same 
-- This can be sent to an LLM as part of a Graph RAG solution to answer questions like
-- "Based on this dataset of movies customers who are connected through friends of friends have watched, containing customer IDs, names, movie titles, genres and summaries. How would you describe the movie watching preferences of these users?"
SELECT DISTINCT *
    FROM GRAPH_TABLE(CUSTOMER_WATCHED_MOVIES
        MATCH (c1 IS CUSTOMER)-[e1 IS WATCHED_WITH]-{2,3}(c2 IS CUSTOMER) -[e2 is WATCHED]-> (m is MOVIE),
              (c1) -[e3 is WATCHED]-> (m is MOVIE)
        WHERE c1.cust_id <> c2.cust_id
        COLUMNS (c1.CUST_ID as c1_cust_id, c1.FIRSTNAME as c1_fist_name, c2.cust_id as c2_cust_id, c2.FIRSTNAME as c2_fist_name, m.title as movie_title, m.genres as movie_genre, m.summary as movie_summary) 
    );


-- Create the JSON object with task and result set
WITH prompt_document AS (
    SELECT
        JSON_OBJECT(
            'TASK' VALUE 'Based on this dataset of movies customers who are connected through friends of friends have watched, containing customer IDs, names, movie titles, genres and summaries. How would you describe the movie watching preferences of these users?',
            'PROMPT_DETAILS' VALUE JSON_ARRAYAGG(
                JSON_OBJECT(
                    'c1_cust_id' VALUE c1_cust_id,
                    'c1_fist_name' VALUE c1_fist_name,
                    'c2_cust_id' VALUE c2_cust_id,
                    'movie_title' VALUE movie_title,
                    'movie_genre' VALUE movie_genre,
                    'movie_summary' VALUE movie_summary
                ) RETURNING CLOB
            ) RETURNING CLOB
        ) AS prompt_details
    FROM GRAPH_TABLE(
        CUSTOMER_WATCHED_MOVIES
        MATCH (c1 IS CUSTOMER)-[e1 IS WATCHED_WITH]-{2,3}(c2 IS CUSTOMER) -[e2 is WATCHED]-> (m is MOVIE),
              (c1) -[e3 is WATCHED]-> (m is MOVIE)
        WHERE c1.cust_id <> c2.cust_id
        COLUMNS (c1.CUST_ID as c1_cust_id, c1.FIRSTNAME as c1_fist_name, c2.cust_id as c2_cust_id, c2.FIRSTNAME as c2_fist_name, m.title as movie_title, m.genres as movie_genre, m.summary as movie_summary) 
    )
)
SELECT 
    DBMS_LOB.SUBSTR(
        DBMS_CLOUD_AI.GENERATE(
            PROMPT => prompt_details,
            PROFILE_NAME => 'genai',
            ACTION       => 'chat'
        ),
        4000,
        1
    ) AS Answer
FROM prompt_document;

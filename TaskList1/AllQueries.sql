- 1) Functions and Enemies depend on no-one
-- 2) Bands depends on Cats (FK-dependency, alter table)
-- 3) Cats depends on Bands, Function and Cats (self-reference, alter table)
-- 4) Incidents depends on Cats and Enemies

-- Clean-up
DROP TABLE Incidents;
DROP TABLE Cats;
DROP TABLE Bands;
DROP TABLE Enemies;
DROP Table Functions;
-- select 'drop table '||table_name||' cascade constraints;' from user_tables; ?

-- Initialization
CREATE TABLE Functions (
    function VARCHAR2(10)
        CONSTRAINT function_pk PRIMARY KEY,
    min_mice NUMBER(3)
        CONSTRAINT min_mice_ch CHECK(min_mice > 5),
    max_mice NUMBER(3),
        CONSTRAINT max_mice_ch CHECK(200 > max_mice and max_mice >= min_mice)
);

CREATE TABLE Enemies (
    enemy_name VARCHAR2(15)
        CONSTRAINT enemy_name_pk PRIMARY KEY,
    hostility_degree NUMBER(2)
        CONSTRAINT hostility_degree_ch CHECK(hostility_degree >=1 and hostility_degree<=10),
    species VARCHAR2(15),
    bribe VARCHAR2(20)
);

CREATE TABLE Bands (
    band_no NUMBER(2)
        CONSTRAINT bands_no_pk PRIMARY KEY,
    name VARCHAR2(20) 
        CONSTRAINT bands_name_nn NOT NULL,
    site VARCHAR2(15)
        CONSTRAINT site_un UNIQUE,
    band_chief VARCHAR2(15)
        CONSTRAINT bands_chief_un UNIQUE
);

CREATE TABLE Cats (
    name VARCHAR2(10)
        CONSTRAINT cats_name_nn NOT NULL,
    gender VARCHAR2(1)
        CONSTRAINT gender_ch CHECK(gender IN ('D', 'M')),
    nickname VARCHAR2(15)
        CONSTRAINT nickname_pk PRIMARY KEY,
    function VARCHAR2(10),
        CONSTRAINT function_fk FOREIGN KEY (function) REFERENCES Functions(function),
    chief VARCHAR2(15),
        CONSTRAINT chief_fk FOREIGN KEY (chief) REFERENCES Cats(nickname),
    in_herd_since DATE DEFAULT (SYSDATE),
    mice_ration NUMBER(3),
    mice_extra NUMBER(3),
    band_no NUMBER(2),
        CONSTRAINT band_no_fk FOREIGN KEY (band_no) REFERENCES Bands(band_no)
);

CREATE TABLE Incidents (
    nickname VARCHAR2(15),
        CONSTRAINT nickname_fk FOREIGN KEY (nickname) REFERENCES Cats(nickname),
    enemy_name VARCHAR2(15),
        CONSTRAINT enemy_name_fk FOREIGN KEY (enemy_name) REFERENCES Enemies(enemy_name),
    incident_date DATE
        CONSTRAINT incident_date_nn NOT NULL,
    incident_desc VARCHAR2(50),
    CONSTRAINT incidents_pk PRIMARY KEY(nickname, enemy_name)
);
/*
Order of insertion must match the tables. Foreign keys with a value must link to an already-inserted record.
E.g., if the cat Patrick has a chief "TIGER", then "TIGER" must already be inserted into the Cats table.
Therefore we insert the independent tables (Functions and Enemies) first, and then the 'chief' cats (matching nickname and chief)
*/

-- Functions (function, min_mice, max_mice) 
INSERT INTO Functions (function, min_mice, max_mice) VALUES ('BOSS',90,110);
INSERT INTO Functions (function, min_mice, max_mice) VALUES ('THUG',70,90);
INSERT INTO Functions (function, min_mice, max_mice) VALUES ('CATCHING',60,70);
INSERT INTO Functions (function, min_mice, max_mice) VALUES ('CATCHER',50,60);
INSERT INTO Functions (function, min_mice, max_mice) VALUES ('CAT',40,50);
INSERT INTO Functions (function, min_mice, max_mice) VALUES ('NICE',20,30);
INSERT INTO Functions (function, min_mice, max_mice) VALUES ('DIVISIVE',45,55);
INSERT INTO Functions (function, min_mice, max_mice) VALUES ('HONORARY',6,25);

-- Enemies(enemy_name, hostility_degree, species, bribe) 
INSERT INTO Enemies (enemy_name, hostility_degree, species, bribe) VALUES ('KAZIO',10,'MAN','BOTTLE');
INSERT INTO Enemies (enemy_name, hostility_degree, species, bribe) VALUES ('STUPID SOPHIA',1,'MAN','BEAD');
INSERT INTO Enemies (enemy_name, hostility_degree, species, bribe) VALUES ('UNRULY DYZIO',7,'MAN','CHEWING GUM');
INSERT INTO Enemies (enemy_name, hostility_degree, species, bribe) VALUES ('DUN',4,'DOG','BONE');
INSERT INTO Enemies (enemy_name, hostility_degree, species, bribe) VALUES ('WILD BILL',10,'DOG',NULL);
INSERT INTO Enemies (enemy_name, hostility_degree, species, bribe) VALUES ('REKS',2,'DOG','BONE');
INSERT INTO Enemies (enemy_name, hostility_degree, species, bribe) VALUES ('BETHOVEN',1,'DOG','PEDIGRIPALL');
INSERT INTO Enemies (enemy_name, hostility_degree, species, bribe) VALUES ('SLYBOOTS',5,'FOX','CHICKEN');
INSERT INTO Enemies (enemy_name, hostility_degree, species, bribe) VALUES ('SLIM',1,'PINE',NULL);
INSERT INTO Enemies (enemy_name, hostility_degree, species, bribe) VALUES ('BASIL',3,'ROOSTER','HEN TO THE HERD');

-- Bands(band_no, name, site, band_chief*) . band_chief is a FK that references Cats, but we add that constraint after adding all Cats records.
-- All Bands are added first, so Cats records can reference it in their band_no
INSERT INTO Bands(band_no, name, site, band_chief) VALUES (1,'SUPERIORS','WHOLE AREA','TIGER');
INSERT INTO Bands(band_no, name, site, band_chief) VALUES (2,'BLACK KNIGHTS','FIELD','BALD');
INSERT INTO Bands(band_no, name, site, band_chief) VALUES (3,'WHITE HUNTERS','ORCHARD','ZOMBIES');
INSERT INTO Bands(band_no, name, site, band_chief) VALUES (4,'PINTO HUNTERS','HILLOCK','REEF');
INSERT INTO Bands(band_no, name, site, band_chief) VALUES (5,'ROCKERS','FARM',NULL);

-- Cats(name, gender, nickname, function, chief*, in_herd_since, mice_ration, mice_extra, band_no*) 
INSERT INTO Cats (name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) VALUES ('MRUCZEK','M','TIGER','BOSS',NULL,TO_DATE('2002-01-01','YYYY-MM-DD'),103,33,1); -- Chief-Chief
INSERT INTO Cats (name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) VALUES ('KOREK','M','ZOMBIES','THUG','TIGER',TO_DATE('2004-03-16','YYYY-MM-DD'),75,13,3); -- Sub-chief
INSERT INTO Cats (name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) VALUES ('BOLEK','M','BALD','THUG','TIGER',TO_DATE('2006-08-15','YYYY-MM-DD'),72,21,2); -- Sub-chief
INSERT INTO Cats (name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) VALUES ('PUCEK','M','REEF','CATCHING','TIGER',TO_DATE('2006-10-15','YYYY-MM-DD'),65,NULL,4); -- Sub-chief
INSERT INTO Cats (name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) VALUES ('PUNIA','D','HEN','CATCHING','ZOMBIES',TO_DATE('2008-01-01','YYYY-MM-DD'),61,NULL,3);-- Sub-chief
INSERT INTO Cats (name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) VALUES ('JACEK','M','CAKE','CATCHING','BALD',TO_DATE('2008-12-01','YYYY-MM-DD'),67,NULL,2);
INSERT INTO Cats (name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) VALUES ('BARI','M','TUBE','CATCHER','BALD',TO_DATE('2009-09-01','YYYY-MM-DD'),56,NULL,2);
INSERT INTO Cats (name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) VALUES ('MICKA','D','LOLA','NICE','TIGER',TO_DATE('2009-10-14','YYYY-MM-DD'),25,47,1);
INSERT INTO Cats (name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) VALUES ('LUCEK','M','ZERO','CAT','HEN',TO_DATE('2010-03-01','YYYY-MM-DD'),43,NULL,3);
INSERT INTO Cats (name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) VALUES ('SONIA','D','FLUFFY','NICE','ZOMBIES',TO_DATE('2010-11-18','YYYY-MM-DD'),20,35,3);
INSERT INTO Cats (name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) VALUES ('LATKA','D','EAR','CAT','REEF',TO_DATE('2011-01-01','YYYY-MM-DD'),40,NULL,4);
INSERT INTO Cats (name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) VALUES ('DUDEK','M','SMALL','CAT','REEF',TO_DATE('2011-05-15','YYYY-MM-DD'),40,NULL,4);
INSERT INTO Cats (name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) VALUES ('CHYTRY','M','BOLEK','DIVISIVE','TIGER',TO_DATE('2002-05-05','YYYY-MM-DD'),50,NULL,1);
INSERT INTO Cats (name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) VALUES ('ZUZIA','D','FAST','CATCHING','BALD',TO_DATE('2006-07-21','YYYY-MM-DD'),65,NULL,2);
INSERT INTO Cats (name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) VALUES ('RUDA','D','LITTLE','NICE','TIGER',TO_DATE('2006-09-17','YYYY-MM-DD'),22,42,1);
INSERT INTO Cats (name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) VALUES ('BELA','D','MISS','NICE','BALD',TO_DATE('2008-02-01','YYYY-MM-DD'),24,28,2);
INSERT INTO Cats (name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) VALUES ('KSAWERY','M','MAN','CATCHER','REEF',TO_DATE('2008-07-12','YYYY-MM-DD'),51,NULL,4);
INSERT INTO Cats (name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) VALUES ('MELA','D','LADY','CATCHER','REEF',TO_DATE('2008-11-01','YYYY-MM-DD'),51,NULL,4);

-- Incidents(nickname*, enemy_name*, incident_date, incident_desc)
INSERT INTO Incidents(nickname, enemy_name, incident_date, incident_desc) VALUES ('TIGER','KAZIO',TO_DATE('2004-10-13','YYYY-MM-DD'),'HE HAS TRYING TO STICK ON THE FORK');
INSERT INTO Incidents(nickname, enemy_name, incident_date, incident_desc) VALUES ('ZOMBIES','UNRULY DYZIO',TO_DATE('2005-03-07','YYYY-MM-DD'),'HE FOOTED AN EYE FROM PROCAST');
INSERT INTO Incidents(nickname, enemy_name, incident_date, incident_desc) VALUES ('BOLEK','KAZIO',TO_DATE('2005-03-29','YYYY-MM-DD'),'HE CLEANED DOG');
INSERT INTO Incidents(nickname, enemy_name, incident_date, incident_desc) VALUES ('FAST','STUPID SOPHIA',TO_DATE('2006-09-12','YYYY-MM-DD'),'SHE USED THE CAT AS A CLOTH');
INSERT INTO Incidents(nickname, enemy_name, incident_date, incident_desc) VALUES ('LITTLE','SLYBOOTS',TO_DATE('2007-03-07','YYYY-MM-DD'),'HE RECOMMENDED HIMSELF AS A HUSBAND');
INSERT INTO Incidents(nickname, enemy_name, incident_date, incident_desc) VALUES ('TIGER','WILD BILL',TO_DATE('2007-06-12','YYYY-MM-DD'),'HE TRIED TO KILL');
INSERT INTO Incidents(nickname, enemy_name, incident_date, incident_desc) VALUES ('BOLEK','WILD BILL',TO_DATE('2007-11-10','YYYY-MM-DD'),'HE BITE THE EAR');
INSERT INTO Incidents(nickname, enemy_name, incident_date, incident_desc) VALUES ('MISS','WILD BILL',TO_DATE('2008-12-12','YYYY-MM-DD'),'HE BITCHED');
INSERT INTO Incidents(nickname, enemy_name, incident_date, incident_desc) VALUES ('MISS','KAZIO',TO_DATE('2009-01-07','YYYY-MM-DD'),'HE CAUGHT THE TAIL AND MADE A WIND');
INSERT INTO Incidents(nickname, enemy_name, incident_date, incident_desc) VALUES ('LADY','KAZIO',TO_DATE('2009-02-07','YYYY-MM-DD'),'HE WANTED TO SKIN OFF');
INSERT INTO Incidents(nickname, enemy_name, incident_date, incident_desc) VALUES ('MAN','REKS',TO_DATE('2009-04-14','YYYY-MM-DD'),'HE BARKED EXTREMELY RUDELY');
INSERT INTO Incidents(nickname, enemy_name, incident_date, incident_desc) VALUES ('BALD','BETHOVEN',TO_DATE('2009-05-11','YYYY-MM-DD'),'HE DID NOT SHARE THE PORRIDGE');
INSERT INTO Incidents(nickname, enemy_name, incident_date, incident_desc) VALUES ('TUBE','WILD BILL',TO_DATE('2009-09-03','YYYY-MM-DD'),'HE TOOK THE TAIL');
INSERT INTO Incidents(nickname, enemy_name, incident_date, incident_desc) VALUES ('CAKE','BASIL',TO_DATE('2010-07-12','YYYY-MM-DD'),'HE PREVENTED THE CHICKEN FROM BEING HUNTED');
INSERT INTO Incidents(nickname, enemy_name, incident_date, incident_desc) VALUES ('FLUFFY','SLIM',TO_DATE('2010-11-19','YYYY-MM-DD'),'SHE THREW CONES');
INSERT INTO Incidents(nickname, enemy_name, incident_date, incident_desc) VALUES ('HEN','DUN',TO_DATE('2010-12-14','YYYY-MM-DD'),'HE CHASED');
INSERT INTO Incidents(nickname, enemy_name, incident_date, incident_desc) VALUES ('SMALL','SLYBOOTS',TO_DATE('2011-07-13','YYYY-MM-DD'),'HE TOOK THE STOLEN EGGS');
INSERT INTO Incidents(nickname, enemy_name, incident_date, incident_desc) VALUES ('EAR','UNRULY DYZIO',TO_DATE('2011-07-14','YYYY-MM-DD'),'HE THREW STONES');

-- Insert data before adding this constraint
ALTER TABLE Bands
    ADD CONSTRAINT bands_chief_fk FOREIGN KEY (band_chief) REFERENCES Cats(nickname)
;
/*
Task 1. Find the names of enemies who participated in incidents in 2009.  
*/

SELECT enemy_name "Enemy", incident_desc "Fault description" FROM Incidents WHERE incident_date BETWEEN TO_DATE('2009-01-01','YYYY-MM-DD') AND TO_DATE('2009-12-31','YYYY-MM-DD');

/*
Result:
1   KAZIO	HE CAUGHT THE TAIL AND MADE A WIND
2   KAZIO	HE WANTED TO SKIN OFF
3   REKS	HE BARKED EXTREMELY RUDELY
4   BETHOVEN	HE DID NOT SHARE THE PORRIDGE
5   WILD BILL	HE TOOK THE TAIL
*/
-- https://stackoverflow.com/questions/2369222/oracle-date-between-query

/*
Task 2. Find all females cats who joined the herd between September 1, 2005. and July 
31, 2007.    
*/

SELECT 
    name "NAME", 
    function "FUNCTION", 
    TO_CHAR(in_herd_since,'YYYY-MM-DD') "WITH AS FROM" 
FROM Cats 
WHERE in_herd_since BETWEEN TO_DATE('2005-09-01', 'YYYY-MM-DD') 
                        AND TO_DATE('2007-07-31', 'YYYY-MM-DD');

/*
Result:
1   BOLEK	THUG	2006-08-15
2   PUCEK	CATCHING	2006-10-15
3   ZUZIA	CATCHING	2006-07-21
4   RUDA	NICE	2006-09-17
*/
-- Same source as task 1

/*
Task  3.  Display  the  names,  species  and  degrees  of  hostility  of  incorruptible  enemies. 
Results sort in ascending order of hostility degree.  
*/

SELECT enemy_name "ENEMY", species "SPECIES", hostility_degree "HOSTILITY DEGREE" FROM Enemies ORDER BY hostility_degree ASC;

/*
Results:
1   STUPID SOPHIA	MAN	1
2   BETHOVEN	DOG	1
3   SLIM	PINE	1
4   REKS	DOG	2
5   BASIL	ROOSTER	3
6   DUN	DOG	4
7   SLYBOOTS	FOX	5
8   UNRULY DYZIO	MAN	7
9   WILD BILL	DOG	10
10  KAZIO	MAN	10
*/
-- Chapter 1 and 2, page 27.

/*
Task 4. Display data on male cats collected in one column of the form:  
  
JACEK called CAKE (fun. CATCHING) has been catching mice in band 2 since 2008-
12-01  
  
The results should be ordered in descending order date entry to the herd. In the case of 
the same date joining the herd, sort the results alphabetically by nickname.  
*/

SELECT name||' called '||nickname||' (fun. '||function||') has been catching mice in band '||band_no||' since '||TO_CHAR(in_herd_since,'YYYY-MM-DD')
  FROM Cats WHERE gender='M' ORDER BY in_herd_since DESC, nickname;

/*
Results:
1 DUDEK called SMALL (fun. CAT) has been catching mice in band 4 since 2011-05-15
2 LUCEK called ZERO (fun. CAT) has been catching mice in band 3 since 2010-03-01
3 BARI called TUBE (fun. CATCHER) has been catching mice in band 2 since 2009-09-01
4 JACEK called CAKE (fun. CATCHING) has been catching mice in band 2 since 2008-12-01
5 KSAWERY called MAN (fun. CATCHER) has been catching mice in band 4 since 2008-07-12
6 PUCEK called REEF (fun. CATCHING) has been catching mice in band 4 since 2006-10-15
7 BOLEK called BALD (fun. THUG) has been catching mice in band 2 since 2006-08-15
8 KOREK called ZOMBIES (fun. THUG) has been catching mice in band 3 since 2004-03-16
9 CHYTRY called BOLEK (fun. DIVISIVE) has been catching mice in band 1 since 2002-05-05
10  MRUCZEK called TIGER (fun. BOSS) has been catching mice in band 1 since 2002-01-01
*/

-- Chapter 1 and 2, p. 22
-- https://stackoverflow.com/questions/7606745/how-to-change-the-date-format-from-mm-dd-yyyy-to-yyyy-mm-dd-in-pl-sql

/*
Task 5. Find the first occurrence of the letter A and the first occurrence of the letter L in 
each  nickname  and  then  replace  the  letters  found  with  #  and  %,  respectively.  Use 
functions that work on strings. Only consider nicknames that contain both letters.  
*/

SELECT nickname "NICKNAME", REPLACE(REPLACE(nickname, 'L', '%'), 'A', '#') "After replacing A and L" FROM Cats 
WHERE nickname LIKE '%A%L%' OR nickname LIKE '%L%A%'; 

/*
Result:
1   BALD	B#%D
2   LADY	%#DY
3   LOLA	%O%#
4   SMALL	SM#%%
*/
-- Where nickname is "string can be anything"-A-"anythin"-L or the reverse order.
-- Chapter 1 and 2, p. 26
-- https://stackoverflow.com/questions/19234164/matching-exactly-2-characters-in-string-sql
-- https://www.techonthenet.com/oracle/functions/replace.php 
-- https://stackoverflow.com/questions/83856/how-to-replace-multiple-strings-together-in-oracle 

/*
Task 6. Display the names of cats 
    with at least 11 years of experience (which additionally joined  the  herd  from  March  1  to  September  30),  
    dates  of  their  joining  the  herd,  
    initial ration of mice (current ration, due to its increase after half a year of joining of cat to the herd, is 10% higher than the initial ration), 
    the date of the mentioned increase by 10% 
    and the current mice ration. 
*/
-- [X] Function increasing date by 6 months
-- [X] Function decreasing mice_ration by 10%
-- [DONE] Function determining year to be 2014 or less, and month to be between 03 and 09. 
-- NVL to guard against null values

SELECT name, 
    TO_CHAR(in_herd_since,'YYYY-MM-DD') "In Herd", 
    ROUND(NVL(mice_ration/1.1,0)) "Ate", -- original_ration * 1.1 = mice_ration, means that original_ration = mice_ration/1.1 
    TO_CHAR(ADD_MONTHS(in_herd_since, 6),'YYYY-MM-DD') "Increase", -- 6 months after 'date of joining the herd'
    NVL(mice_ration,0) "Eat"
FROM Cats
WHERE in_herd_since <= ADD_MONTHS(TRUNC(SYSDATE), -12*11 ) -- Year <= 2014, 
    AND EXTRACT(MONTH FROM in_herd_since) BETWEEN 3 AND 9; -- and 03 =< Month <= 09.

/*
Result (Current date being 23rd October 2025):
1   KOREK	2004-03-16	68	2004-09-16	75
2   BOLEK	2006-08-15	65	2007-02-15	72
3   BARI	2009-09-01	51	2010-03-01	56
4   LUCEK	2010-03-01	39	2010-09-01	43
5   DUDEK	2011-05-15	36	2011-11-15	40
6   CHYTRY	2002-05-05	45	2002-11-05	50
7   ZUZIA	2006-07-21	59	2007-01-21	65
8   RUDA	2006-09-17	20	2007-03-17	22
9   KSAWERY	2008-07-12	46	2009-01-12	51
*/

-- https://stackoverflow.com/questions/28888848/how-to-subtract-years-from-sysdate
-- https://stackoverflow.com/questions/44994375/how-to-get-year-and-month-of-a-date-using-oracle 

/*
Task 7. Display names, quarterly mice rations, and quarterly rations extra of all cats in 
which the ration of mice is greater than twice the ration extra but not smaller than 55.  
*/

SELECT name, 
    mice_ration*3 "MICE QUARTERLY", 
    NVL(mice_extra,0)*3 "EXTRA QUARTERLY" 
FROM Cats 
WHERE mice_ration >=55 AND mice_ration > 2*NVL(mice_extra,0)
ORDER BY mice_ration DESC;

/*
Results:
1   MRUCZEK	309	99
2   KOREK	225	39
3   BOLEK	216	63
4   JACEK	201	0
5   PUCEK	195	0
6   ZUZIA	195	0
7   PUNIA	183	0
8   BARI	168	0
*/

/*
Task  8.  Display  for  each  cat  (name)  the  following  information  about  the  total  annual consumption of mice: 
    the value of total consumption if it exceeds 660, 
    'Limit' if it is equal to 660, 
    'Below 660' if it is less than 660. 

Do not use set operators (UNION , INTERSECT, MINUS).  
*/

SELECT name, 
       CASE 
            WHEN ((NVL(mice_ration,0)+NVL(mice_extra,0))*12) > 660 THEN TO_CHAR((NVL(mice_ration,0)+NVL(mice_extra,0))*12)
            WHEN ((NVL(mice_ration,0)+NVL(mice_extra,0))*12) = 660 THEN 'Limit'
            ELSE 'Below 660'
       END AS "Eats annually" 
FROM Cats 
ORDER BY name ASC;

/*
Results:
1   BARI	672
2   BELA	Below 660
3   BOLEK	1116
4   CHYTRY	Below 660
5   DUDEK	Below 660
6   JACEK	804
7   KOREK	1056
8   KSAWERY	Below 660
9   LATKA	Below 660
10  LUCEK	Below 660
11  MELA	Below 660
12  MICKA	864
13  MRUCZEK	1632
14  PUCEK	780
15  PUNIA	732
16  RUDA	768
17  SONIA	Limit
18  ZUZIA	780
*/
-- https://docs.oracle.com/en/database/oracle/oracle-database/26/sqlrf/CASE-Expressions.html#GUID-CA29B333-572B-4E1D-BA64-851FABDBAE96

/* OH MY GOD THE POLENGLISH.
Task 9. 
After a few months suspending the issuance of mice, caused by the crisis, 
the Tiger resumed today payments on a in accordance with the principle that cats 
that joined the herd in the first half of the month (with15 day) 
receive the first ration of mice (after the break) on last Wednesday of this month, 
while cats that joined the herd after 15 day of the month receive their first ration of mice (after the break) 
on the last Wednesday of the next month. 

In the following months, mice are issued to all cats on the last Wednesday of month. 
Display for each cat: 
    its nickname, 
    date of entry to the herd 
    and date of the first ration of mice after the break, 
assuming that the current date is October 27 and 29, 2020. 

*/
-- If they joined before the 15th day of the month, in 'in_herd_since', 
-- they get their ration on the last wednesday this month (if possible),
-- Else they get it on the last wednesday of next month

-- October 27 (Tuesday)
-- TO_DATE('2020-10-27','YYYY-MM-DD')
SELECT nickname "NICKNAME", 
        TO_CHAR(in_herd_since,'YYYY-MM-DD') "IN HERD",
        CASE WHEN TO_NUMBER(TO_CHAR(TO_DATE(in_herd_since,'DD-MM-YYYY'),'dd')) <= 15 THEN -- If they joined first half of month
            CASE WHEN NEXT_DAY(TO_DATE('2020-10-27','YYYY-MM-DD'),'WEDNESDAY') <= LAST_DAY(TO_DATE('2020-10-27','YYYY-MM-DD'))-- if next wednesday is less then last day of month (I.E. there is one)
                THEN -- This month
                    TO_CHAR(NEXT_DAY(TO_DATE('2020-10-27', 'YYYY-MM-DD'), 'WEDNESDAY'), 'YYYY-MM-DD')
                ELSE -- Next month
                    TO_CHAR(NEXT_DAY(LAST_DAY(ADD_MONTHS(TO_DATE('2020-10-27', 'YYYY-MM-DD'), 1)) - 7, 'WEDNESDAY'),'YYYY-MM-DD')
            END
        ELSE -- Next month
            TO_CHAR(NEXT_DAY(LAST_DAY(ADD_MONTHS(TO_DATE('2020-10-27', 'YYYY-MM-DD'), 1)) - 7, 'WEDNESDAY'),'YYYY-MM-DD')
        END AS "PAYMENT"
FROM Cats
ORDER BY in_herd_since;

/*
Results:
TIGER	2002-01-01	2020-10-28
BOLEK	2002-05-05	2020-10-28
ZOMBIES	2004-03-16	2020-11-25
FAST	2006-07-21	2020-11-25
BALD	2006-08-15	2020-10-28
LITTLE	2006-09-17	2020-11-25
REEF	2006-10-15	2020-10-28
HEN	2008-01-01	2020-10-28
MISS	2008-02-01	2020-10-28
MAN	2008-07-12	2020-10-28
LADY	2008-11-01	2020-10-28
CAKE	2008-12-01	2020-10-28
TUBE	2009-09-01	2020-10-28
LOLA	2009-10-14	2020-10-28
ZERO	2010-03-01	2020-10-28
FLUFFY	2010-11-18	2020-11-25
EAR	2011-01-01	2020-10-28
SMALL	2011-05-15	2020-10-28

*/

-- October 29 (Thursday)
-- TO_DATE('2020-10-29','YYYY-MM-DD')
SELECT nickname "NICKNAME", 
        TO_CHAR(in_herd_since,'YYYY-MM-DD') "IN HERD",
        CASE WHEN TO_NUMBER(TO_CHAR(TO_DATE(in_herd_since,'DD-MM-YYYY'),'dd')) <= 15 THEN -- If they joined first half of month
            CASE WHEN NEXT_DAY(TO_DATE('2020-10-29','YYYY-MM-DD'),'WEDNESDAY') <= LAST_DAY(TO_DATE('2020-10-29','YYYY-MM-DD'))-- if next wednesday is less then last day of month (I.E. there is one)
                THEN -- This month
                    TO_CHAR(NEXT_DAY(TO_DATE('2020-10-29', 'YYYY-MM-DD'), 'WEDNESDAY'), 'YYYY-MM-DD')
                ELSE -- Next month
                    TO_CHAR(NEXT_DAY(LAST_DAY(ADD_MONTHS(TO_DATE('2020-10-29', 'YYYY-MM-DD'), 1)) - 7, 'WEDNESDAY'),'YYYY-MM-DD')
            END
        ELSE -- Next month
            TO_CHAR(NEXT_DAY(LAST_DAY(ADD_MONTHS(TO_DATE('2020-10-29', 'YYYY-MM-DD'), 1)) - 7, 'WEDNESDAY'),'YYYY-MM-DD')
        END AS "PAYMENT"
FROM Cats
ORDER BY in_herd_since;

/*
Results:
TIGER	2002-01-01	2020-11-25
BOLEK	2002-05-05	2020-11-25
ZOMBIES	2004-03-16	2020-11-25
FAST	2006-07-21	2020-11-25
BALD	2006-08-15	2020-11-25
LITTLE	2006-09-17	2020-11-25
REEF	2006-10-15	2020-11-25
HEN	2008-01-01	2020-11-25
MISS	2008-02-01	2020-11-25
MAN	2008-07-12	2020-11-25
LADY	2008-11-01	2020-11-25
CAKE	2008-12-01	2020-11-25
TUBE	2009-09-01	2020-11-25
LOLA	2009-10-14	2020-11-25
ZERO	2010-03-01	2020-11-25
FLUFFY	2010-11-18	2020-11-25
EAR	2011-01-01	2020-11-25
SMALL	2011-05-15	2020-11-25
*/
-- https://stackoverflow.com/questions/14041200/how-to-convert-date-into-month-number
-- https://www.techonthenet.com/oracle/functions/next_day.php

/*
Task  10.  Attribute  named  nickname  in  the  Cats  table  is  the  primary  key  of  this  table. 
Check if all the nicknames are really different. Do the same for the attribute named chief.  
*/

SELECT nickname||' - '||
        CASE WHEN COUNT(*) = 1 THEN 'unique'  
             ELSE 'non-unique' 
        END AS "Uniqueness of the nickname" 
FROM Cats
GROUP BY nickname
ORDER BY nickname;
/*
Results:
BALD - unique
BOLEK - unique
CAKE - unique
EAR - unique
FAST - unique
FLUFFY - unique
HEN - unique
LADY - unique
LITTLE - unique
LOLA - unique
MAN - unique
MISS - unique
REEF - unique
SMALL - unique
TIGER - unique
TUBE - unique
ZERO - unique
ZOMBIES - unique
*/
SELECT chief||' - '||
        CASE WHEN COUNT(*) = 1 THEN 'unique'  
             ELSE 'non-unique' 
        END AS "Uniqueness of the chief" 
FROM Cats
WHERE chief IS NOT NULL
GROUP BY chief
ORDER BY chief;
/*
Results:
BALD - non-unique
HEN - unique
REEF - non-unique
TIGER - non-unique
ZOMBIES - non-unique
*/
-- https://docs.oracle.com/en/database/other-databases/nosql-database/20.3/sqlreferencefornosql/is-null-and-is-not-null-operators.html

/*
Task 11. Find nicknames of cats with at least two enemies.  
*/

SELECT nickname,
    COUNT(enemy_name) "Number of enemies"
FROM Incidents
GROUp BY nickname
HAVING COUNT(enemy_name) >=2
ORDER BY nickname;

-- chapter 1 and 2, page 29
/*
Results:
BOLEK	2
MISS	2
TIGER	2
*/

/*
Task 12. Find the maximum total ration (total ration = sum of mice ration and mice extra) 
of mice for all function groups (excluding BOSS function and male cats) in which have 
an average total ration of mice greater than 50.  
*/

SELECT 
'Number of cats = '|| COUNT(*)||
' hunts as '||function||
' and eats max. '||MAX(NVL(mice_ration,0)+NVL(mice_extra,0))||' mice per month' 
FROM Cats
WHERE function != 'BOSS' AND gender !='M'
GROUP BY function
HAVING AVG(NVL(mice_ration,0)+NVL(mice_extra,0)) > 50
ORDER BY function;

-- chapter 1 and 2, page 32
/*
Results:
Number of cats = 1 hunts as CATCHER and eats max. 51 mice per month
Number of cats = 2 hunts as CATCHING and eats max. 65 mice per month
Number of cats = 4 hunts as NICE and eats max. 72 mice per month
*/

/*
Task 13. Display the minimum ration of mice for each band by gender.  
*/

SELECT band_no "Band no",
       gender "Gender",
       MIN(NVL(mice_ration,0)) "Minimum Ration"
FROM Cats
GROUP BY band_no, gender
ORDER BY band_no, gender;

-- chapter 1 and 2, page 32
/*
Results:
1	D	22
1	M	50
2	D	24
2	M	56
3	D	20
3	M	43
4	D	40
4	M	40
*/


/*
Task. 14. 
Display information about male cats having in the hierarchy of superiors the male  chief  with  function  THUG  (also  display  the  data  of  this  supervisor).

The  data  of cats subordinate to a particular chief are to be displayed according to their place in the hierarchy of subordination.  
*/

SELECT level "Level",
    nickname "Nickname",
    function "Function",
    band_no "Band_no"
FROM Cats
WHERE gender = 'M'
CONNECT BY PRIOR nickname=chief
START WITH gender = 'M' AND function = 'THUG'
ORDER BY level;

-- chapter 1 and 2, page 34
/*
Results:
1	ZOMBIES	THUG	3
1	BALD	THUG	2
2	CAKE	CATCHING	2
2	TUBE	CATCHER	2
3	ZERO	CAT	3
*/


/*
Task 15. Present information about the subordination of cats possessing an extra payment 
(mice_extra)  so  that  the  name  of  the  cat  standing  highest  in  the  hierarchy  is  
displayed with the smallest indentation and the remaining names with the indentation appropriate 
to the place in the hierarchy.  
*/

SELECT  
    CASE WHEN (level-1)=0 THEN (level-1)||' '||name
         ELSE RPAD('===>',(level-1)*4,'===>')||(level-1)||' '||name
         END AS "Hierarchy",
        NVL(chief, 'Master yourself') "Nickname of the chief",
        function "Function"
FROM Cats
WHERE mice_extra > 0
CONNECT BY PRIOR nickname=chief
START with chief IS NULL
ORDER BY level;

-- chapter 1 and 2, page 34
-- https://stackoverflow.com/questions/31884233/repeat-function-equivalent-in-oracle

/*
Results:
0 MRUCZEK	Master yourself	BOSS
===>1 BOLEK	TIGER	THUG
===>1 KOREK	TIGER	THUG
===>1 MICKA	TIGER	NICE
===>1 RUDA	TIGER	NICE
===>===>2 BELA	BALD	NICE
===>===>2 SONIA	ZOMBIES	NICE
*/

/*
Task  16.  Display  the  path  of  all  chiefs    specified  by  nicknames,  from  concrete  cat 
nickname through all successive superiors to the main chief. Do it for male cats, without 
mice extra, belonging to herd more than eleven years. 
*/

SELECT LPAD('    ', (level-1)*4)||nickname "Path of chiefs"
FROM Cats
WHERE gender = 'M' 
    --AND (mice_extra = 0 OR mice_extra IS NULL)
    AND in_herd_since <= ADD_MONTHS(TRUNC(SYSDATE), -12*11 ) -- Year <= 2014, 
START WITH nickname IN ('BOLEK','CAKE','MAN','REEF')
CONNECT BY PRIOR chief=nickname;

-- chapter 1 and 2, page 34
-- https://www.techonthenet.com/oracle/functions/lpad.php
-- ´ORDER BY´ was a trap
-- If I added the mice_extra=0 constraint, Tiger and Bald wouldn't be included, since they receive extra

/*
Results:
BOLEK
    TIGER
CAKE
    BALD
        TIGER
MAN
    REEF
        TIGER
REEF
    TIGER
*/







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


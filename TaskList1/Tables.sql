-- 1) Functions and Enemies depend on no-one
-- 2) Bands depends on Cats (FK-dependency, alter table)
-- 3) Cats depends on Bands, Function and Cats (self-reference, alter table)
-- 4) Incidents depends on Cats and Enemies

-- Clean-up
DROP TABLE Incidents;
DROP TABLE Cats;
DROP TABLE Bands;
DROP Table Functions;
DROP TABLE Enemies;

-- Initialization
CREATE TABLE Functions (
    function VARCHAR2(10)
        CONSTRAINT function_pk PRIMARY KEY (function),
    min_mice NUMBER(3)
        CONSTRAINT min_mice_ch CHECK(min_mice > 5),
    max_mice NUMBER(3)
        CONSTRAINT max_mice_ch CHECK(200 > max_mice and max_mice >= min_mice)
);

CREATE TABLE Enemies (
    enemy_name VARCHAR2(15)
        CONSTRAINT enemy_name_pk PRIMARY KEY (enemy_name),
    hostility_degree NUMBER(2)
        CONSTRAINT hostility_degree_ch CHECK(hostility_degree >=1 and hostility_degree<=10),
    species VARCHAR2(15),
    bribe VARCHAR2(20)
);

CREATE TABLE Bands (
    band_no NUMBER(2)
        CONSTRAINT bands_no_pk PRIMARY KEY (band_no),
    name VARCHAR2(20) 
        CONSTRAINT name_nn NOT NULL,
    site VARCHAR2(15)
        CONSTRAINT site_un UNIQUE,
    band_chief VARCHAR2(15)
        CONSTRAINT bands_chief_un UNIQUE
);

CREATE TABLE Cats (
    name VARCHAR2(10)
        CONSTRAINT name_nn NOT NULL,
    gender VARCHAR2(1)
        CONSTRAINT gender_ch CHECK(gender IN ('D', 'M')),
    nickname VARCHAR2(15)
        CONSTRAINT nickname_pk PRIMARY KEY (nickname),
    function VARCHAR2(10)
        CONSTRAINT function_fk FOREIGN KEY (function) REFERENCES Functions(function),
    chief VARCHAR2(15)
        CONSTRAINT chief_fk FOREIGN KEY (chief) REFERENCES Cats(nickname),
    in_herd_since DATE DEFAULT (SYSDATE),
    mice_ration NUMBER(3),
    mice_extra NUMBER(3),
    band_no NUMBER(2)
        CONSTRAINT band_no_fk FOREIGN KEY (band_no) REFERENCES Bands(band_no)
);

CREATE TABLE Incidents (
    nickname VARCHAR2(15)
        CONSTRAINT nickname_fk FOREIGN KEY (nickname) REFERENCES Cats(nickname),
    enemy_name VARCHAR2(15)
        CONSTRAINT enemy_name_fk FOREIGN KEY (enemy_name) REFERENCES Enemies(enemy_name),
    incident_date DATE
        CONSTRAINT incident_date_nn NOT NULL,
    incident_desc VARCHAR2(50),
    CONSTRAINT incidents_pk PRIMARY KEY(nickname, enemy_name)
);

-- Insert data before adding this constraint
ALTER TABLE Bands
    ADD CONSTRAINT bands_chief_fk FOREIGN KEY (band_chief) REFERENCES Cats(nickname)
;

/*
Task 13. Display the minimum ration of mice for each band by gender.  
  
Band No                Gender Minimum ration           
---------------------- ------ ----------------------   
3                       M      43                       
4                       W      40                       
4                       M      40                       
1                       M      50                       
2                       M      56                       
1                       W      22                       
2                       W      24                       
3                       W      20   
*/

SELECT band_no "Band no",
       gender "Gender",
       MIN(NVL(mice_ration,0)) "Minimum Ration"
FROM Cats
GROUP BY band_no, gender
ORDER BY band_no, gender;

-- chapter 1 and 2, page 32
/*
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
*/
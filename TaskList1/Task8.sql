/*
Task  8.  Display  for  each  cat  (name)  the  following  information  about  the  total  annual consumption of mice: 
    the value of total consumption if it exceeds 660, 
    'Limit' if it is equal to 660, 
    'Below 660' if it is less than 660. 

Do not use set operators (UNION , INTERSECT, MINUS).  
  
NAME            Eats annually                              
--------------- ----------------------------------------   
BARI            672                                        
BELA            Below 660                                  
BOLEK           1116                                       
CHYTRY          Below 660                                  
DUDEK           Below 660                                  
JACEK           804                                        
KOREK           1056                                       
KSAWERY         Below 660                                  
LATKA           Below 660                                  
LUCEK           Below 660                                  
MELA            Below 660                                  
MICKA           864                                        
MRUCZEK         1632                                       
PUCEK           780                                        
PUNIA           732                                        
RUDA            768                                        
SONIA           Limit                                      
ZUZIA           780  
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


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
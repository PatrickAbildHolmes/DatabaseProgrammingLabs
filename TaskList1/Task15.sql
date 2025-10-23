/*
Task 15. Present information about the subordination of cats possessing an extra payment 
(mice_extra)  so  that  the  name  of  the  cat  standing  highest  in  the  hierarchy  is  
displayed with the smallest indentation and the remaining names with the indentation appropriate 
to the place in the hierarchy.  
  
Hierarchy                                Nickname of the chief Function     
---------------------------------------- --------------------- ----------   
0                MRUCZEK                 Master yourself       BOSS         
===>1                BOLEK               TIGER                 THUG         
===>===>2                BELA            BALD                  NICE         
===>1                RUDA                TIGER                 NICE         
===>1                MICKA               TIGER                 NICE         
===>1                KOREK               TIGER                 THUG         
===>===>2                SONIA           ZOMBIES               NICE  
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

-- https://stackoverflow.com/questions/31884233/repeat-function-equivalent-in-oracle
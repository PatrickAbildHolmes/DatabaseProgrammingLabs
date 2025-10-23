/*
Task  16.  Display  the  path  of  all  chiefs    specified  by  nicknames,  from  concrete  cat 
nickname through all successive superiors to the main chief. Do it for male cats, without 
mice extra, belonging to herd more than eleven years (in the solution below, the current 
date is assumed  as 06.04.2020). 
Path of chiefs 
------------------------------   
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

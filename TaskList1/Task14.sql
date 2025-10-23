/*
Task. 14. 
Display information about male cats having in the hierarchy of superiors the male  chief  with  function  THUG  (also  display  the  data  of  this  supervisor).

The  data  of cats subordinate to a particular chief are to be displayed according to their place in the hierarchy of subordination.  
  
Level  Nickname        Function   Band No                  
------ --------------- ---------- ----------------------   
    1 BALD            THUG       2                        
    2 CAKE            CATCHING   2                        
    2 TUBE            CATCHER    2                        
    1 ZOMBIES         THUG       3                        
    3 ZERO            CAT        3                   
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
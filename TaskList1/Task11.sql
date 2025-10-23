/*
Task 11. Find nicknames of cats with at least two enemies.  
  
Nickname        Number of enemies        
--------------- ----------------------   
BOLEK           2                        
MISS            2                        
TIGER           2      
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
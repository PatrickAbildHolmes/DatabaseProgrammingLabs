/*
Task  10.  Attribute  named  nickname  in  the  Cats  table  is  the  primary  key  of  this  table. 
Check if all the nicknames are really different. Do the same for the attribute named chief.  
  
Uniqueness of the nickname   
--------------------------   
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

Uniqueness of the chief   
-----------------------   
      BALD - non-unique   
       HEN - unique       
      REEF - non-unique   
     TIGER - non-unique   
   ZOMBIES - non-unique  
*/

SELECT nickname||' - '||
        CASE WHEN COUNT(*) = 1 THEN 'unique'  
             ELSE 'non-unique' 
        END AS "Uniqueness of the nickname" 
FROM Cats
GROUP BY nickname
ORDER BY nickname;

SELECT chief||' - '||
        CASE WHEN COUNT(*) = 1 THEN 'unique'  
             ELSE 'non-unique' 
        END AS "Uniqueness of the chief" 
FROM Cats
WHERE chief IS NOT NULL
GROUP BY chief
ORDER BY chief;

-- https://docs.oracle.com/en/database/other-databases/nosql-database/20.3/sqlreferencefornosql/is-null-and-is-not-null-operators.html
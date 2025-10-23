/*
Task 2. Find all females cats who joined the herd between September 1, 2005. and July 
31, 2007.  
  
NAME            FUNCTION   WITH AS FROM                
--------------- ---------- -------------------------   
ZUZIA           CATCHING   2006-07-21                  
RUDA            NICE       2006-09-17            
*/

SELECT 
name "NAME", 
function "FUNCTION", 
TO_CHAR(in_herd_since,'YYYY-MM-DD') "WITH AS FROM" 
FROM Cats 
WHERE in_herd_since BETWEEN TO_DATE('2005-09-01', 'YYYY-MM-DD') 
                        AND TO_DATE('2007-07-31', 'YYYY-MM-DD');

/*
Result:
1   BOLEK	THUG	2006-08-15
2   PUCEK	CATCHING	2006-10-15
3   ZUZIA	CATCHING	2006-07-21
4   RUDA	NICE	2006-09-17
*/
-- Same as task 1
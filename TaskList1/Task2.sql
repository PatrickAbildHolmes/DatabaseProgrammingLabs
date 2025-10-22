/*
Task 2. Find all females cats who joined the herd between September 1, 2005. and July 
31, 2007.  
  
NAME            FUNCTION   WITH AS FROM                
--------------- ---------- -------------------------   
ZUZIA           CATCHING   2006-07-21                  
RUDA            NICE       2006-09-17            
*/

SELECT name, function, in_herd_since FROM Cats WHERE in_herd_since BETWEEN TO_DATE('2005-09-01', 'YYYY-MM-DD') AND TO_DATE('2007-07-31', 'YYYY-MM-DD');

/*
Result:
1   BOLEK	THUG	15-AUG-06
2   PUCEK	CATCHING	15-OCT-06
3   ZUZIA	CATCHING	21-JUL-06
3   RUDA	NICE	17-SEP-06
*/
-- Same as task 1
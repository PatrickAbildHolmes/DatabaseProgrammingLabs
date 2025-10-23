/*
Task 12. Find the maximum total ration (total ration = sum of mice ration and mice extra) 
of mice for all function groups (excluding BOSS function and male cats) in which have 
an average total ration of mice greater than 50.  
  
--------------- -- -------- ---------- ------------- ------ --------------   
Number of cats=  1 hunts as CATCHER    and eats max.  51.00 mice per month
Number of cats=  2 hunts as CATCHING   and eats max.  65.00 mice per month   
Number of cats=  4 hunts as NICE       and eats max.  72.00 mice per month
*/

SELECT 
'Number of cats = '|| COUNT(*)||
' hunts as '||function||
' and eats max. '||MAX(NVL(mice_ration,0)+NVL(mice_extra,0))||' mice per month' 
FROM Cats
WHERE function != 'BOSS' AND gender !='M'
GROUP BY function
HAVING AVG(NVL(mice_ration,0)+NVL(mice_extra,0)) > 50
ORDER BY function;

-- chapter 1 and 2, page 32
/*
Results:
Number of cats = 1 hunts as CATCHER and eats max. 51 mice per month
Number of cats = 2 hunts as CATCHING and eats max. 65 mice per month
Number of cats = 4 hunts as NICE and eats max. 72 mice per month
*/
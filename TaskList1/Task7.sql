/*
Task 7. Display names, quarterly mice rations, and quarterly rations extra of all cats in 
which the ration of mice is greater than twice the ration extra but not smaller than 55.  
  
NAME            MICE QARTERLY          EXTRA QARTERLY           
--------------- ---------------------- ----------------------   
MRUCZEK         309                    99                       
KOREK           225                    39                       
BOLEK           216                    63                       
JACEK           201                    0                        
PUCEK           195                    0                        
ZUZIA           195                    0                        
PUNIA           183                    0                        
BARI            168                    0  
*/

SELECT name, 
    mice_ration*3 "MICE QUARTERLY", 
    NVL(mice_extra,0)*3 "EXTRA QUARTERLY" 
FROM Cats 
WHERE mice_ration >=55 AND mice_ration > 2*NVL(mice_extra,0)
ORDER BY mice_ration DESC;

/*
Results:
1   MRUCZEK	309	99
2   KOREK	225	39
3   BOLEK	216	63
4   JACEK	201	0
5   PUCEK	195	0
6   ZUZIA	195	0
7   PUNIA	183	0
8   BARI	168	0
*/

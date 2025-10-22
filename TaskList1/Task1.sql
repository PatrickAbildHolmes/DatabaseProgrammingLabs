/*
Task 1. Find the names of enemies who participated in incidents in 2009.  
  
Enemy           Fault description                                    
--------------- ----------------------------------------------   
KAZIO           HE CAUGHT THE TAIL AND MADE A WIND                   
KAZIO           HE WANTED TO SKIN OFF                  
REKS            HE BARKED EXTREMELY RUDELY                           
BETHOVEN        HE DID NOT SHARE THE PORRIDGE WILD BILL HE TOOK THE TAIL 
*/

SELECT enemy_name, incident_desc FROM Incidents WHERE incident_date BETWEEN TO_DATE('2009-01-01','YYYY-MM-DD') AND TO_DATE('2009-12-31','YYYY-MM-DD');

/*
Result:
1   KAZIO	HE CAUGHT THE TAIL AND MADE A WIND
2   KAZIO	HE WANTED TO SKIN OFF
3   REKS	HE BARKED EXTREMELY RUDELY
4   BETHOVEN	HE DID NOT SHARE THE PORRIDGE
5   WILD BILL	HE TOOK THE TAIL
*/
-- https://stackoverflow.com/questions/2369222/oracle-date-between-query
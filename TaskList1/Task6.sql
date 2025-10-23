/*
Task 6. Display the names of cats 
    with at least 11 years of experience (which additionally joined  the  herd  from  March  1  to  September  30),  
    dates  of  their  joining  the  herd,  
    initial ration of mice (current ration, due to its increase after half a year of joining of cat to the herd, is 10% higher than the initial ration), 
    the date of the mentioned increase by 10% 
    and the current mice ration. 

Use appropriate functions working on dates. 
In the solution presented below, the current date is 04.04.2020.  
  
NAME          In herd         Ate          Increase        Eat                      
------------- --------------- ------------ --------------- ------------  
KOREK         2004-03-16      68           2004-09-16      75                       
BOLEK         2006-08-15      65           2007-02-15      72                       
ZUZIA         2006-07-21      59           2007-01-21      65                    
KSAWERY       2008-07-12      46           2009-01-12      51                       
CHYTRY        2002-05-05      45           2002-11-05      50                       
RUDA          2006-09-17      20           2007-03-17      22   
*/
-- [X] Function increasing date by 6 months
-- [X] Function decreasing mice_ration by 10%
-- [DONE] Function determining year to be 2014 or less, and month to be between 03 and 09. 
-- NVL to guard against null values

SELECT name, 
    TO_CHAR(in_herd_since,'YYYY-MM-DD') "In Herd", 
    ROUND(NVL(mice_ration/1.1,0)) "Ate", -- original_ration * 1.1 = mice_ration, means that original_ration = mice_ration/1.1 
    TO_CHAR(ADD_MONTHS(in_herd_since, 6),'YYYY-MM-DD') "Increase", -- 6 months after 'date of joining the herd'
    NVL(mice_ration,0) "Eat"
FROM Cats
WHERE in_herd_since <= ADD_MONTHS(TRUNC(SYSDATE), -12*11 ) -- Year <= 2014, 
    AND EXTRACT(MONTH FROM in_herd_since) BETWEEN 3 AND 9; -- and 03 =< Month <= 09.

/*
Result (Current date being 23rd October 2025):
1   KOREK	2004-03-16	68	2004-09-16	75
2   BOLEK	2006-08-15	65	2007-02-15	72
3   BARI	2009-09-01	51	2010-03-01	56
4   LUCEK	2010-03-01	39	2010-09-01	43
5   DUDEK	2011-05-15	36	2011-11-15	40
6   CHYTRY	2002-05-05	45	2002-11-05	50
7   ZUZIA	2006-07-21	59	2007-01-21	65
8   RUDA	2006-09-17	20	2007-03-17	22
9   KSAWERY	2008-07-12	46	2009-01-12	51
*/

-- https://stackoverflow.com/questions/28888848/how-to-subtract-years-from-sysdate
-- https://stackoverflow.com/questions/44994375/how-to-get-year-and-month-of-a-date-using-oracle 
/* OH MY GOD THE POLENGLISH.
Task 9. 
After a few months suspending the issuance of mice, caused by the crisis, 
the Tiger resumed today payments on a in accordance with the principle that cats 
that joined the herd in the first half of the month (with15 day) 
receive the first ration of mice (after the break) on last Wednesday of this month, 
while cats that joined the herd after 15 day of the month receive their first ration of mice (after the break) 
on the last Wednesday of the next month. 

In the following months, mice are issued to all cats on the last Wednesday of month. 
Display for each cat: 
    its nickname, 
    date of entry to the herd 
    and date of the first ration of mice after the break, 
assuming that the current date is October 27 and 29, 2020. 

NICKNAME        IN HERD                   PAYMENT 
*/
-- If they joined before the 15th day of the month, in in_herd_since, 
-- they get their ration on the last wednesday this month (if possible),
-- Else they get it on the last wednesday of next month

-- October 27 (Tuesday)
-- TO_DATE('2020-10-27','YYYY-MM-DD')
SELECT nickname "NICKNAME", 
        TO_CHAR(in_herd_since,'YYYY-MM-DD') "IN HERD",
        CASE WHEN TO_NUMBER(TO_CHAR(TO_DATE(in_herd_since,'DD-MM-YYYY'),'dd')) <= 15 THEN -- If they joined first half of month
            CASE WHEN NEXT_DAY(TO_DATE('2020-10-27','YYYY-MM-DD'),'WEDNESDAY') <= LAST_DAY(TO_DATE('2020-10-27','YYYY-MM-DD'))-- if next wednesday is less then last day of month (I.E. there is one)
                THEN -- This month
                    TO_CHAR(NEXT_DAY(TO_DATE('2020-10-27', 'YYYY-MM-DD'), 'WEDNESDAY'), 'YYYY-MM-DD')
                ELSE -- Next month
                    TO_CHAR(NEXT_DAY(LAST_DAY(ADD_MONTHS(TO_DATE('2020-10-27', 'YYYY-MM-DD'), 1)) - 7, 'WEDNESDAY'),'YYYY-MM-DD')
            END
        ELSE -- Next month
            TO_CHAR(NEXT_DAY(LAST_DAY(ADD_MONTHS(TO_DATE('2020-10-27', 'YYYY-MM-DD'), 1)) - 7, 'WEDNESDAY'),'YYYY-MM-DD')
        END AS "PAYMENT"
FROM Cats
ORDER BY in_herd_since;


-- October 29 (Thursday)
-- TO_DATE('2020-10-29','YYYY-MM-DD')
SELECT nickname "NICKNAME", 
        TO_CHAR(in_herd_since,'YYYY-MM-DD') "IN HERD",
        CASE WHEN TO_NUMBER(TO_CHAR(TO_DATE(in_herd_since,'DD-MM-YYYY'),'dd')) <= 15 THEN -- If they joined first half of month
            CASE WHEN NEXT_DAY(TO_DATE('2020-10-29','YYYY-MM-DD'),'WEDNESDAY') <= LAST_DAY(TO_DATE('2020-10-29','YYYY-MM-DD'))-- if next wednesday is less then last day of month (I.E. there is one)
                THEN -- This month
                    TO_CHAR(NEXT_DAY(TO_DATE('2020-10-29', 'YYYY-MM-DD'), 'WEDNESDAY'), 'YYYY-MM-DD')
                ELSE -- Next month
                    TO_CHAR(NEXT_DAY(LAST_DAY(ADD_MONTHS(TO_DATE('2020-10-29', 'YYYY-MM-DD'), 1)) - 7, 'WEDNESDAY'),'YYYY-MM-DD')
            END
        ELSE -- Next month
            TO_CHAR(NEXT_DAY(LAST_DAY(ADD_MONTHS(TO_DATE('2020-10-29', 'YYYY-MM-DD'), 1)) - 7, 'WEDNESDAY'),'YYYY-MM-DD')
        END AS "PAYMENT"
FROM Cats
ORDER BY in_herd_since;


/*
Results:
same as book

*/
-- https://stackoverflow.com/questions/14041200/how-to-convert-date-into-month-number
-- https://www.techonthenet.com/oracle/functions/next_day.php
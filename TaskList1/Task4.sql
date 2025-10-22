/*
Task 4. Display data on male cats collected in one column of the form:  
  
JACEK called CAKE (fun. CATCHING) has been catching mice in band 2 since 2008-
12-01  
  
The results should be ordered in descending order date entry to the herd. In the case of 
the same date joining the herd, sort the results alphabetically by nickname.  
  ALL_ABOUT_MALE_CATS                    
----------------------------------------------------------------------------------------------   
DUDEK called SMALL (fun. CAT) has been catching mice in band 4 since 2011-05-15                   
LUCEK called ZERO (fun. CAT) has been catching mice in band 3 since 2010-03-01                    
BARI called TUBE (fun. CATCHER) has been catching mice in band 2 since 2009-09-01                    
JACEK called CAKE (fun. CATCHING) has been catching mice in band 2 since 2008-12-01                
KSAWERY called MAN (fun. CATCHER) has been catching mice in band 4 since 2008-07-12                
PUCEK called REEF (fun. CATCHING) has been catching mice in band 4 since 2006-10-15               
BOLEK called BALD (fun. THUG) has been catching mice in band 2 since 2006-08-15               
KOREK called ZOMBIES (fun. THUG) has been catching mice in band 3 since 2004-03-16 
CHYTRY called BOLEK (fun. DIVISIVE) has been catching mice in band 1 since 2002-05-05 
MRUCZEK called TIGER (fun. BOSS) has been catching mice in band 1 since 2002-01-01  
*/

SELECT name||' called '||nickname||' (fun. '||function||') has been catching mice in band '||band_no||' since '||TO_CHAR(in_herd_since,'YYYY-MM-DD')
  FROM Cats WHERE gender='M' ORDER BY in_herd_since DESC, nickname;

/*
Results:
1 DUDEK called SMALL (fun. CAT) has been catching mice in band 4 since 2011-05-15
2 LUCEK called ZERO (fun. CAT) has been catching mice in band 3 since 2010-03-01
3 BARI called TUBE (fun. CATCHER) has been catching mice in band 2 since 2009-09-01
4 JACEK called CAKE (fun. CATCHING) has been catching mice in band 2 since 2008-12-01
5 KSAWERY called MAN (fun. CATCHER) has been catching mice in band 4 since 2008-07-12
6 PUCEK called REEF (fun. CATCHING) has been catching mice in band 4 since 2006-10-15
7 BOLEK called BALD (fun. THUG) has been catching mice in band 2 since 2006-08-15
8 KOREK called ZOMBIES (fun. THUG) has been catching mice in band 3 since 2004-03-16
9 CHYTRY called BOLEK (fun. DIVISIVE) has been catching mice in band 1 since 2002-05-05
10  MRUCZEK called TIGER (fun. BOSS) has been catching mice in band 1 since 2002-01-01
*/

-- Chapter 1 and 2, p. 22
-- https://stackoverflow.com/questions/7606745/how-to-change-the-date-format-from-mm-dd-yyyy-to-yyyy-mm-dd-in-pl-sql
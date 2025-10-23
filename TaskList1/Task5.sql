/*
Task 5. Find the first occurrence of the letter A and the first occurrence of the letter L in 
each  nickname  and  then  replace  the  letters  found  with  #  and  %,  respectively.  Use 
functions that work on strings. Only consider nicknames that contain both letters.  
  
NICKNAME        After replacing A and L                                           
--------------- -----------------------------------------------------------  
BALD            B#%D                                                              
LADY            %#DY                                                              
LOLA            %OL#                                                              
SMALL           SM#%L  
*/


SELECT nickname "NICKNAME", REPLACE(REPLACE(nickname, 'L', '%'), 'A', '#') "After replacing A and L" FROM Cats 
WHERE nickname LIKE '%A%L%' OR nickname LIKE '%L%A%'; 

/*
Result:
1   BALD	B#%D
2   LADY	%#DY
3   LOLA	%O%#
4   SMALL	SM#%%
*/
-- Where nickname is "string can be anything"-A-"anythin"-L or the reverse order.
-- Chapter 1 and 2, p. 26
-- https://stackoverflow.com/questions/19234164/matching-exactly-2-characters-in-string-sql
-- https://www.techonthenet.com/oracle/functions/replace.php 
-- https://stackoverflow.com/questions/83856/how-to-replace-multiple-strings-together-in-oracle 
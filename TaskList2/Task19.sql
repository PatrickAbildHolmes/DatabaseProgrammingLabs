/*
Task 19. For cats with function CAT and NICE, display the names of all their chiefs in order 
compatible of their hierarchy. Solve the task on three ways: 
a) using only joins, 
b) using a tree with CONNECT_BY_ROOT operator and pivot tables , 
c) using the tree with CONNECT_BY_ROOT operator and  
SYS_CONNECT_BY_PATH function. 
 
Ad. a., Ad. b. 
 Name           Function       Chief 1        Chief 2        Chief 3          
---------- --- ---------- --- ---------- --- ---------- --- -------------  
LUCEK       |  CAT         |  PUNIA       |  KOREK       |  MRUCZEK          
RUDA        |  NICE        |  MRUCZEK     |              |                   
MICKA       |  NICE        |  MRUCZEK     |              |                    
SONIA       |  NICE        |  KOREK       |  MRUCZEK     |                    
BELA        |  NICE        |  BOLEK       |  MRUCZEK     |                    
DUDEK       |  CAT         |  PUCEK       |  MRUCZEK     |                    
LATKA       |  CAT         |  PUCEK       |  MRUCZEK     |     

Ad. c. 
 Name         Function   Names of subsequent chiefs                                        
-------- --- ---------- ---------------------------------------------  
SONIA     |  NICE        | SONIA    | KOREK    | MRUCZEK                   
MICKA     |  NICE        | MICKA    | MRUCZEK                              
LUCEK     |  CAT         | LUCEK    | PUNIA    | KOREK    | MRUCZEK        
BELA      |  NICE        | BELA     | BOLEK    | MRUCZEK                   
DUDEK     |  CAT         | DUDEK    | PUCEK    | MRUCZEK                   
LATKA     |  CAT         | LATKA    | PUCEK    | MRUCZEK                   
RUDA      |  NICE        | RUDA     | MRUCZEK                             

*/


/*
Result:

*/

/*
Task  3.  Display  the  names,  species  and  degrees  of  hostility  of  incorruptible  enemies. 
Results sort in ascending order of hostility degree.  
  
ENEMY           SPECIES         HOSTILITY DEGREE         
--------------- --------------- ----------------------   
SLIM            PINE            1                        
WILD BILL       DOG             10  
*/

SELECT enemy_name "ENEMY", species "SPECIES", hostility_degree "HOSTILITY DEGREE" FROM Enemies ORDER BY hostility_degree ASC;

/*
Results:
1   STUPID SOPHIA	MAN	1
2   BETHOVEN	DOG	1
3   SLIM	PINE	1
4   REKS	DOG	2
5   BASIL	ROOSTER	3
6   DUN	DOG	4
7   SLYBOOTS	FOX	5
8   UNRULY DYZIO	MAN	7
9   WILD BILL	DOG	10
10  KAZIO	MAN	10
*/
-- Chapter 1 and 2, page 27.
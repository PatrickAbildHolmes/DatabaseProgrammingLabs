/*
Task 11. Find nicknames of cats with at least two enemies.  
  
Nickname        Number of enemies        
--------------- ----------------------   
BOLEK           2                        
MISS            2                        
TIGER           2      
*/

SELECT nickname,
    COUNT(enemy_name) "Number of enemies"
FROM Incidents
GROUp BY nickname
HAVING COUNT(enemy_name) >=2
ORDER BY nickname;


/*
CREATE TABLE Incidents (
    nickname VARCHAR2(15),
        CONSTRAINT nickname_fk FOREIGN KEY (nickname) REFERENCES Cats(nickname),
    enemy_name VARCHAR2(15),
        CONSTRAINT enemy_name_fk FOREIGN KEY (enemy_name) REFERENCES Enemies(enemy_name),
    incident_date DATE
        CONSTRAINT incident_date_nn NOT NULL,
    incident_desc VARCHAR2(50),
    CONSTRAINT incidents_pk PRIMARY KEY(nickname, enemy_name)
);

*/
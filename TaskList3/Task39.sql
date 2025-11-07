/*
Task 39. Write a PL/SQL block loading three parameters representing the band number, band 
name and hunting site. The script is to prevent entering existing parameter values by handling 
the appropriate exceptions. Entering the band number <= 0 is also an exceptional situation. In 
the  event  of  an  exceptional  situation,  an  appropriate  message  should  be  displayed  on  the 
screen.  If  the  parameters  are  correct,  create  a  new  band  in  the  Bands  relation.  The  change 
should be roll backed at the end. 
 
BAND_NO – 2 
BAND_NAME – BLACK KNIGHTS 
BAND_SITE – FIELD 
2, BLACK KNIGHTS, FIELD: already exists 
 
BAND_NO – 6 
BAND_NAME – SUPERIORS 
BAND_SITE – CELLAR 
SUPERIORS: already exists 
 
BAND_NO – 7 
BAND_NAME – PINTO HUNTERS 
BAND_SITE –HILLOCK 
PINTO HUNTERS, HILLOCK: already exists 
 
BAND_NO – 0 
BAND_NAME – NEW 
BAND_SITE – CELLAR 
Band No <=0 ! 
 
BAND_NO – 6 
BAND_NAME – NEW 
BAND_SITE – CELLAR 
Band NEW created 



*/


/*
Result:

*/

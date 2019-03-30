

/* PRINCO1.SAS  :  PRINCIPAL COMPONENT ANALYSIS OF CRIME DATA */
/* crime.csv */
PROC PRINCOMP data=crime  OUT=CRIMCOMP;     
RUN;
PROC SORT DATA=CRIMCOMP;
  BY PRIN1;
RUN;
PROC PRINT;
  ID STATE;                      
  VAR PRIN1 PRIN2 MURDER RAPE ROBBERY ASSAULT
       BURGLARY LARCENY AUTO;
  TITLE2 'STATES LISTED IN ORDER OF OVERALL CRIME RATE';
  TITLE3 'AS DETERMINED BY THE FIRST PRINCIPAL COMPONENT';
RUN;
PROC SORT;
  BY PRIN2;
PROC PRINT;
  ID STATE;                         
  VAR PRIN1 PRIN2 MURDER RAPE ROBBERY ASSAULT
       BURGLARY LARCENY AUTO;
  TITLE2 'STATES LISTED IN ORDER OF PROPERTY VS. VIOLENT CRIME';
  TITLE3 'AS DETERMINED BY THE SECOND PRINCIPAL COMPONENT';
RUN;
PROC PLOT;
  PLOT PRIN2*PRIN1=STATE / VPOS=23;  
  TITLE2 'PLOT OF THE FIRST TWO PRINCIPAL COMPONENTS';
RUN;
QUIT;





/*********************************************************************/


DATA SET1;
  INFILE 'z:/turtles.dat';
  INPUT SEX LENGTH WIDTH HEIGHT; run;
PROC SORT DATA=SET1; BY SEX;
PROC PRINT DATA=SET1; run;

*  COMPUTE PRINCIPAL COMPONENTS SEPARATELY FOR EACH SEX;

PROC PRINCOMP DATA=SET1 OUT=SCORE2 COV N=3 PREFIX=PRIN; BY SEX;
  VAR LENGTH WIDTH HEIGHT;  run;

goptions targetdevice=ps rotate=portrait;

axis1 label=(f=swiss h=3.0 )
      value=(f=triplex h=3.0)
      length= 5.2 in;

axis2 label=(f=swiss h=3.5 r=0 a=90)
      value=(f=swiss h=3.0)
      length = 5.2 in;

       SYMBOL1 V=circle H=2.5 l=1 w=3 i=none;
       SYMBOL2 V=square H=2.2 l=1 w=3 i=none;
	  

 PROC GPLOT DATA=score2;
   PLOT prin1*(prin2 prin3)=sex / vaxis=axis2 haxis=axis1;
   TITLE H=3.5 F=swiss "Male and Female Turtles";
   footnote ls=0.4in '  ';
   RUN;


PROC PLOT DATA=SCORE2 ; PLOT PRIN1*PRIN2 / HPOS=56; BY SEX; RUN;
PROC CORR DATA=SCORE2; BY SEX;
  VAR PRIN1 PRIN2 PRIN3 LENGTH WIDTH HEIGHT; RUN;

*  COMPUTE PRINCIPAL COMPONENTS FROM COVARIANCE MATRIX FOR COMBINED DATA;

PROC PRINCOMP DATA=SET1 OUT=SCORE3 COV N=3 PREFIX=PRIN;
  VAR LENGTH WIDTH HEIGHT;
  run;

/* Plot the principla component scores */

goptions targetdevice=ps rotate=portrait;

axis1 label=(f=swiss h=3.0 )
      value=(f=triplex h=3.0)
      length= 5.2 in;

axis2 label=(f=swiss h=3.5 r=0 a=90)
      value=(f=swiss h=3.0)
      length = 5.2 in;

       SYMBOL1 V=circle H=2.5 l=1 w=3 i=none;
       SYMBOL2 V=dot H=2.2 l=1 w=3 i=none;
	  

 PROC GPLOT DATA=score3;
   PLOT prin1*(prin2 prin3)=sex / vaxis=axis2 haxis=axis1;
   TITLE H=3.5 F=swiss "Male and Female Turtles";
   footnote ls=0.4in '  ';
   RUN;

PROC PLOT DATA=SCORE3;
  PLOT PRIN1*PRIN2=SEX /HPOS=56;
PROC CORR DATA=SCORE3;
  VAR PRIN1 PRIN2 PRIN3 LENGTH WIDTH HEIGHT;
RUN;








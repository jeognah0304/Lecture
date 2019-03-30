/*  FACTOR1.SAS :  FACTOR ANALYSIS OF EXAM SCORES   */
DATA STUDY  (TYPE=CORR);          
TITLE 'FACTOR ANALYSIS; EXAM SCORES OF N=220 MALE STUDENTS';
  _TYPE_='CORR'; INPUT _NAME_ $ X1-X6;
  LABEL
    X1='GAELIC' X2='ENGLISH' X3='HISTORY'
      X4='ARITHMETIC' X5='ALGEBRA' X6='GEOMETRY';
    CARDS;
X1    1.000   .      .      .      .      .
X2     .439  1.000   .      .      .      .
X3     .410   .351  1.000   .      .      .
X4     .288   .354   .164  1.000   .      .
X5     .329   .320   .190   .595  1.000   .
X6     .248   .329   .181   .470   .464  1.000
;
RUN;
PROC PRINT;                     
RUN;
PROC FACTOR  MSA PREPLOT ROTATE=VARIMAX PLOT;  
  TITLE2 'FACTOR ANALYSIS; EXAM SCORES OF STUDENTS';
RUN;
QUIT;



/* FACTOR2.SAS : FACTOR ANALYSIS FOR 10 PHYSICAL VARIABLES */
DATA PHYSICAL;
  INFILE 'Z:\PHYSICAL.txt' FIRSTOBS=2 MISSOVER;
  INPUT ID V1-V10;
  LABEL V1='신장' V2='총길이' V3='등길이' V4='화장' V5='소매길이'
        V6='바지길이' V7='밑위앞뒤' V8='가슴둘레' V9='허리둘레' 
       V10='엉덩이둘레';
RUN;
PROC FACTOR DATA=PHYSICAL SCREE PREPLOT     
             ROTATE=VARIMAX REORDER PLOT;    
  VAR V1-V10;
RUN;  QUIT;


/* FACTOR3.SAS : 임산부용 브래지어의 불만조사 */
DATA BRA;
  INFILE 'Z:\QUSTNAIR.txt';
  INPUT (Q1-Q9) (1.) +1 (Q10-Q18) (1.);
RUN;
PROC FACTOR DATA=BRA ROTATE=VARIMAX REORDER N=5;
RUN;


/* 내적 일치도 Cronbach alpha */
PROC CORR data=BRA NOSIMPLE NOCORR ALPHA;
VAR q12 q11 q13 q10 q9 q4;
RUN;


/* 내적 일치도 Cronbach alpha */
PROC CORR data=BRA NOSIMPLE NOCORR ALPHA;
VAR q15 q14 q16;
RUN;


/* 내적 일치도 Cronbach alpha */
PROC CORR data=BRA NOSIMPLE NOCORR ALPHA;
VAR q6 q5 q8 q7;
RUN;


/* 내적 일치도 Cronbach alpha */
PROC CORR data=BRA NOSIMPLE NOCORR ALPHA;
VAR q2 q1 q3;
RUN;


/* 내적 일치도 Cronbach alpha */
PROC CORR data=BRA NOSIMPLE NOCORR ALPHA;
VAR q17 q18;
RUN;

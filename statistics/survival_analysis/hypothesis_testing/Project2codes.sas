***Multiple Linear Regression On Project 2***
******Electric Bills*****;
PROC TEMPLATE;
   DEFINE STYLE STYLES.BIGFONT;
      PARENT = STYLES.HTMLBLUE;
      STYLE GRAPHFONTS FROM GRAPHFONTS /
	'GraphTitleFont' = ("<sans-serif>, <MTsans-serif>",20pt,bold) 
      	'GraphLabelFont' = ("<sans-serif>, <MTsans-serif>",14pt,bold)
       	'GraphValueFont' = ("<sans-serif>, <MTsans-serif>",10pt,bold)
	'GraphDataFont' = ("<sans-serif>, <MTsans-serif>",10pt);
END;
ODS HTML STYLE=BigFont;
RUN;
PROC IMPORT DATAFILE='H:\Desktop\stat530\Data Sets\project2.formatted.data.xlsx' 
			OUT = proj2
			DBMS=XLSX 
			REPLACE;
		    GETNAMES = yes;
RUN;

PROC PRINT DATA = proj2 (obs = 5);
RUN;

*Format Pump Variable;
PROC FORMAT;
	VALUE pumpF
	0 = "Old" 1 = "New";

*Numerical Summaries;
PROC MEANS DATA = proj2 n min max mean std MAXDEC = 2;
	VAR bill temp consumption;
RUN;
*Numerical Summaries;
PROC MEANS DATA = proj2 n min max mean std MAXDEC = 2;
	VAR bill temp consumption;
	CLASS pump;
	FORMAT pump pumpF.;
RUN;

*Make the matrix scatterplot;
TITLE 'Electric Bills';
PROC SGSCATTER DATA = proj2;
		MATRIX bill temp consumption pump / group = pump;
RUN;
************************************************************
USE ALL THE VARIABLES
************************************************************;
*Correlation;
PROC CORR DATA = proj2;
	VAR bill pump temp consumption;
RUN;
PROC TEMPLATE;
   DEFINE STYLE STYLES.BIGFONT;
      PARENT = STYLES.HTMLBLUE;
      STYLE GRAPHFONTS FROM GRAPHFONTS /
	 'GraphTitleFont' = ("<sans-serif>, <MTsans-serif>",24pt,bold) 
       'GraphLabelFont' = ("<sans-serif>, <MTsans-serif>",18pt,bold)
       'GraphValueFont' = ("<sans-serif>, <MTsans-serif>",14pt,bold)
	 'GraphDataFont' = ("<sans-serif>, <MTsans-serif>",14pt);
END;
ODS HTML STYLE=BigFont;
RUN;
*Compute Regression;
PROC REG DATA = proj2;
	TITLE "Least Squares Analysis";
	MODEL bill = temp pump consumption;
	PLOT STUDENT. * PREDICTED. / NOMODEL NOSTAT;
	PLOT STUDENT. * NQQ. / NOMODEL NOSTAT MODELlab= "QQ PLOT";
RUN;
************************************************************
REMOVE SOME VARIABLES------DOES NOT MATTER
TEMP OR CONSUMPTION, SAME EFFECT.
************************************************************;
*Correlation;
PROC CORR DATA = proj2;
	VAR bill pump consumption ;
RUN;

PROC TEMPLATE;
   DEFINE STYLE STYLES.BIGFONT;
      PARENT = STYLES.HTMLBLUE;
      STYLE GRAPHFONTS FROM GRAPHFONTS /
	 'GraphTitleFont' = ("<sans-serif>, <MTsans-serif>",24pt,bold) 
       'GraphLabelFont' = ("<sans-serif>, <MTsans-serif>",18pt,bold)
       'GraphValueFont' = ("<sans-serif>, <MTsans-serif>",14pt,bold)
	 'GraphDataFont' = ("<sans-serif>, <MTsans-serif>",14pt)
;
END;
ODS HTML STYLE=BigFont;
RUN;
*Compute Regression;
PROC REG DATA = proj2;
	TITLE "Least Squares Analysis";
	MODEL bill = consumption pump ;
	PLOT STUDENT. * PREDICTED. / NOMODEL NOSTAT;
	PLOT STUDENT. * NQQ. / NOMODEL NOSTAT MODELlab= "QQ PLOT";
RUN;

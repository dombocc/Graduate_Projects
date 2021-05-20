PROC TEMPLATE;
   DEFINE STYLE STYLES.BIGFONT;
      PARENT = STYLES.HTMLBLUE;
      STYLE GRAPHFONTS FROM GRAPHFONTS /
	 'GraphTitleFont' = ("<sans-serif>, <MTsans-serif>",28pt,bold) 
       'GraphLabelFont' = ("<sans-serif>, <MTsans-serif>",20pt,bold)
       'GraphValueFont' = ("<sans-serif>, <MTsans-serif>",14pt,bold)
	 'GraphDataFont' = ("<sans-serif>, <MTsans-serif>",14pt)
;
END;
ODS HTML STYLE=BigFont;

RUN;

*Import data;
PROC IMPORT DATAFILE = "H:\Desktop\stat530\final project\finalproject.data.xlsx"
	OUT = cancer
	DBMS = xlsx 
	REPLACE;
	GETNAMES = yes;
RUN;

*Check data;
PROC PRINT DATA = cancer (obs = 10);
RUN;

*format treatment;
PROC FORMAT;
VALUE treatmentF 0 = 'Standard'
					1 = 'Test';
RUN;

*Numerical Summaries;
PROC MEANS DATA = cancer n min max mean std MAXDEC = 2;
	VAR time cell age prior;
	FORMAT treatment treatmentF.;
RUN;
PROC MEANS DATA = cancer n min max mean std MAXDEC = 2;
	VAR time cell age prior;
	CLASS treatment;
	FORMAT treatment treatmentF.;
RUN;

*2 Sample T-test;
PROC TTEST DATA = cancer SIDES = 2 ALPHA = 0.05 H0=0;
 	TITLE "Two Sample T-test";
 	CLASS treatment; 
	VAR time cell age prior;
	FORMAT treatment treatmentF.;
RUN;

*compute semi-parametric;
PROC LIFETEST DATA = cancer CONFTYPE = linear METHOD = PL 
			PLOTS = SURVIVAL ALPHA = 0.05 OUTSURV = outdata;
	TIME time*status(0);
	STRATA treatment / TEST = (WILCOXON);
	TITLE 'Survival Estimate of VA Lung Cancer Patients';
	FORMAT treatment treatmentF.;
RUN;

*compute parametric;
PROC PHREG DATA = cancer;
	CLASS prior(ref = '0') treatment(ref = '0');
	MODEL time*status(0) = treatment age prior / TIES=exact;
	HAZARDRATIOS treatment/ ALPHA = 0.05;
	HAZARDRATIOS age/ ALPHA = 0.05;
	HAZARDRATIOS prior/ ALPHA = 0.05;
RUN;

DATA covs0;
INPUT treatment age prior;
DATALINES;
0 0 0
1 0 0
;

PROC PHREG DATA = cancer NOPRINT;
	MODEL time*status(0) = age treatment prior/ TIES = exact;
	BASELINE COVARIATES = covs0 OUT = base SURVIVAL = S/ NOMEAN;
RUN;
PROC PRINT DATA = base;
	TITLE1 "VA Lung Cancer Data: Predicted Survival";
RUN;

*GOPTIONS RESET=all;
GOPTIONS HTITLE=3 FTEXT=SWISSB HTEXT=3 ; 
SYMBOL1 c=red v=triangle h=.8 i=stepjll;
SYMBOL2 c=blue v=circle h=.8 i=stepjll;
LEGEND1 LABEL=NONE VALUE=(HEIGHT=2 FONT=SWISS 'Standard=0' 'Test=1') 
        POSITION=(TOP RIGHT INSIDE) MODE=SHARE CBORDER=black;
AXIS LABEL=( A=90 'Survival Probability');
PROC GPLOT DATA = base;
  PLOT S*time = treatment / OVERLAY LEGEND=legend1 VAXIS=axis1;
RUN;

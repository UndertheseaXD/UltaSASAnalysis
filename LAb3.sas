/* Generated Code (IMPORT) */
/* Source File: Spring 2024 Lab #3 Closing Prices.xlsx */
/* Source Path: /home/u63620296/sasuser.v94 */
/* Code generated on: 4/21/24, 12:53 PM */

%web_drop_table(WORK.IMPORT);


FILENAME REFFILE '/home/u63620296/sasuser.v94/Spring 2024 Lab #3 Closing Prices.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.price;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.price; RUN;


%web_open_table(WORK.IMPORT);



proc corr data=price;
var ULTA BBWI AMZN ETSY EXPE LULU MAR MGM NKE POOL RL ROST RCL SBUX TPR WYNN YUM;
run;


proc reg data=price;
model ULTA = BBWI AMZN ETSY EXPE LULU MAR MGM NKE POOL RL SBUX TPR WYNN YUM/selection=stepwise;
run;

proc reg data=price;
model ULTA = BBWI AMZN ETSY LULU MAR MGM NKE RL TPR WYNN YUM/VIF;
run;

proc reg data=price;
model ULTA = BBWI AMZN ETSY LULU MGM NKE RL TPR WYNN YUM/VIF;
run;

proc reg data=price;
model ULTA = BBWI ETSY LULU MAR MGM NKE RL TPR WYNN YUM/VIF;
run;
proc reg data=price;
model ULTA = BBWI ETSY LULU MGM NKE RL TPR WYNN YUM/VIF;
run;
proc reg data=price;
model ULTA = BBWI ETSY LULU MGM NKE RL WYNN YUM/VIF;
run;
/* R-Sq optmal*/
proc reg data=price;
model ULTA = BBWI ETSY LULU MGM NKE RL WYNN YUM/selction=stepwise;
run;
proc reg data=price;
model ULTA = YUM LULU WYNN MGM NKE RL BBWI;
run;
/* PRESS optmal*/
proc GLMselect data=price;
 model ULTA =  BBWI ETSY LULU MGM NKE RL WYNN YUM/selection=stepwise(choose=PRESS);
run;
proc reg data=price;
model ULTA = BBWI ETSY LULU MGM NKE RL WYNN YUM;
run;
/* CP optmal*/ 

proc reg data=price;
 model ULTA =  BBWI ETSY LULU MGM NKE RL WYNN YUM/selection=CP;
run;
proc reg data=price;
 model ULTA = BBWI LULU MGM NKE RL WYNN YUM;
 run;
/* R-sq adj optmal*/
proc reg data=price;
 model ULTA =  BBWI ETSY LULU MGM NKE RL WYNN YUM/selection=adjrsq;
run;

proc reg data=price;
 model ULTA = BBWI ETSY LULU MGM NKE RL WYNN YUM;
 run;

/* Final first order model*/
proc reg data=price;
model ULTA =  BBWI LULU MGM NKE RL WYNN YUM/r;
run;


data price_2;
set price;

 BBWI_sq = BBWI**2;
 LULU_sq = LULU**2;
 mgm_sq = mgm**2;
 nke_sq = nke**2;
 rl_sq = rl**2;
 wynn_sq = wynn**2;
 yum_sq = yum**2;
 
 LULU_NKE = LULU*NKE;
 MGM_WYNN = MGM*WYNN;
 

run;

proc reg data=price_2;
model ULTA =  BBWI LULU MGM NKE RL WYNN YUM BBWI_sq LUlU_sq mgm_sq nke_sq rl_sq wynn_sq yum_sq;
test BBWI_sq, LULU_sq ,mgm_sq ,nke_sq, wynn_sq, yum_sq;
run;

proc reg data=price_2;
model ULTA =  BBWI LULU MGM NKE RL WYNN YUM BBWI_sq mgm_sq nke_sq wynn_sq lulu_nke/r;
run;

proc GLM data=price_2;
	model ULTA= LULU | NKE/ solution;
	store GLMMODEL;
run;

proc PLM restore=GLMMODEL noinfo;
	effectplot slicefit(x=LULU sliceby=NKE);
	run;
proc GLM data=price_2;
	model ULTA= MGM | WYNN/ solution;
	store GLMMODEL;
run;

proc PLM restore=GLMMODEL noinfo;
	effectplot slicefit(x=MGM sliceby=WYNN);
	run;
	
proc reg data=price_2;
model ULTA =  BBWI LULU MGM NKE RL WYNN YUM BBWI_sq mgm_sq nke_sq wynn_sq lulu_nke MGM_WYNN;
run;












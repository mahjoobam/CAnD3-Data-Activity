version 18
*log using "GSS 2017Family,Cycle31Tables_Analysis.do", replace
************************************************************************
************************************************************************
* AUTHOR: Mahjoube AmaniChakani
* DATE STARTED: September , 2024
* FUNCTION: Family structure and household organization
* INPUT DATA: gss-12M0025-E-2017-c-31_F1
* OUTPUT DATA: 
************************************************************************
************************************************************************

clear all
 use "results.dta"
 
 
 *Multivariate linear regression
reg agegr10 Sex_of_Respondant Marital_Status Sex_of_Partner Self_Rated_health nSelf_Rated_Mental_health Shared_equally_division


* Bivariate logistic
logistic Shared_equally_division i.nSelf_Rated_Mental_health

logistic Shared_equally_division i.Self_Rated_health

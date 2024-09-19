version 18

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
log using "Analysis1.do", replace
cd "C:\Users\Mahjoob.Amani\Desktop\RRWM  Data Activity\GSS 2017 - Family, Cycle 31"
 use "results.dta"
 
 * Descriptive analysis
 codebook Marital_Status
 sum agec
 tab nSelf_Rated_Mental_health Shared_equally_division
 tab Shared_equally_division nSelf_Rated_Mental_health
 
 *Multivariate linear regression
reg agegr10 Sex_of_Respondant Marital_Status Sex_of_Partner Self_Rated_health nSelf_Rated_Mental_health Shared_equally_division


* Bivariate logistic
logistic Shared_equally_division i.nSelf_Rated_Mental_health

logistic Shared_equally_division i.Self_Rated_health

save"tables.dta", replace

log close

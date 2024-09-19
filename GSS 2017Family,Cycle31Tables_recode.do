

version 18.5
log using "GSS 2017Family,Cycle31Tables_Recode.do"
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

/* Reading the database */
cd "C:\Users\Mahjoob.Amani\Desktop\RRWM  Data Activity\GSS 2017 - Family, Cycle 31"
import delimited "C:\Users\Mahjoob.Amani\Desktop\RRWM  Data Activity\GSS 2017 - Family, Cycle 31\gss-12M0025-E-2017-c-31_F1.csv"

* Keeping Necessary variables : (Demographics, Groupe Organization and decision making within the household, Groupe SRH: Self Rated Health)

keep agec agegr10 sex marstat sexpr prtypec com_115 com_120 com_125 com_130 com_135 com_140 com_145 com_150 com_155 srh_110 srh_115 

*REmoving missing values 

drop if agec ==.
drop if agegr10 ==.
drop if sex ==.
drop if marstat ==.
drop if sexpr ==.

sum agec
tab sex
 tab sexpr
 sum marstat
 
 
 * Generating Shared_equally_division if more than half the chores are done equally between partners
 
gen count_3 = (com_115 == 3) + (com_120 == 3) + (com_125 == 3) + (com_130 == 3) + (com_135 == 3) + (com_140 == 3) + (com_145 == 3) + (com_150 == 3) + (com_155 == 3)

gen Shared_equally_division = 1 if count_3 >= 5
replace Shared_equally_division = 0 if count_3 < 5

tab Shared_equally_division


*Recoding
tostring sex, replace
replace sex = "male" if sex == "1"
replace sex = "female" if sex == "2"


tostring sexpr, replace
replace sexpr = "male" if sex == "1"
replace sexpr = "female" if sex == "2"

tostring srh_110, replace
replace srh_110 = "Excellent" if srh_110 == "1"
replace srh_110 = "Very good" if srh_110 == "2"
replace srh_110 = "Good" if srh_110 == "3"
replace srh_110 = "Fair" if srh_110 == "4"
replace srh_110 = "Poor" if srh_110 == "5"
replace srh_110 = "Valid skip" if srh_110 == "6"
replace srh_110 = "Don't know" if srh_110 == "7"
replace srh_110 = "Refusal" if srh_110 == "8"
replace srh_110 = "Not stated" if srh_110 == "9"



tostring srh_115, replace
replace srh_115 = "Excellent" if srh_115 == "1"
replace srh_115 = "Very good" if srh_115 == "2"
replace srh_115 = "Good" if srh_115 == "3"
replace srh_115 = "Fair" if srh_115 == "4"
replace srh_115 = "Poor" if srh_115 == "5"
replace srh_115 = "Valid skip" if srh_115 == "6"
replace srh_115 = "Don't know" if srh_115 == "7"
replace srh_115 = "Refusal" if srh_115 == "8"
replace srh_115 = "Not stated" if srh_115 == "9"



tostring marstat, replace  // Convert the numeric variable to string

replace marstat = "Married/Common-law" if marstat == "1"
replace marstat = "Previously Married" if marstat == "2"
replace marstat = "Single/Never Married" if marstat == "3"

tostring Shared_equally_division, replace
replace Shared_equally_division = "yes" if Shared_equally_division == "1"
replace Shared_equally_division = "no" if Shared_equally_division == "0"

rename sex Sex_of_Respondant
rename sexpr Sex_of_Partner
rename marstat Marital_Status
rename srh_110 Self_Rated_health
rename srh_115 nSelf_Rated_Mental_health

*Save results
save "results.dta", replace

log close







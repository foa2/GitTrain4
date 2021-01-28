/*
Study Title, Project, adapted by Daniel Alexander;
Created by Richard Ball
Last updated:  2018-09-18
ORCID Number
Hello
Author note to self: For questions other than RM

Publication citation (if published)

Written for Stata 14--SE, 64-bit, for Windows
*/

/*WHEN THIS DO-FILE IS RUN, STATA'S WORKING DIRECTORY 
SHOULD BE SET TO THE "Command-Files" FOLDER. */

clear
set more off

*IMPORT THE IMPORTABLE PEW DATA
import excel using ../Original-Data/original-wdi.xlsx, cellrange(A1:E15) firstrow


*DROP VARIABLE seriesname BECAUSE IT IS REDUNDANT WITH seriescode
drop SeriesName


*THE UNIT OF OBSERVATION IN THE WDI SPREADSHEET
*IS "COUNTRY/SERIES"
*RESHAPE THE SPREADSHEET SO THAT THE UNIT OF OBSERVATION
*IS "COUNTRY" AND EACH VARIABLE IS A SERIES
egen var_no=group(SeriesCode)
drop SeriesCode

rename YR2002 var

reshape wide var, i(CountryCode) j(var_no)

rename var1 exp 
label variable exp "Gov. cons., % of GDP"
rename var2 inc
label variable inc "GDP per capita (current [2002] $ US)"
 

*SO THAT WE CAN MERGE THIS WDI DATA WITH THE PEW DATA,
*GENERATE A VARIABLE country THAT CODES THE COUNTRIES
*IN THE SAME WAY AS THE PEW DATA.
gen country=8 if CountryCode=="CHN"
replace country=17 if CountryCode=="IND"
replace country=18 if CountryCode=="IDN"
replace country=27 if CountryCode=="PAK"
replace country=31 if CountryCode=="RUS"
replace country=40 if CountryCode=="USA"
replace country=45 if CountryCode=="JOR"


*BECAUSE WE HAVE CREATED THE VARIABLE country, 
*WE NO LtONGER NEED THE VARIABLE countrycode
*SO WE DROP IT
drop CountryCode 

*CREATE A TEMPORARY FOLDER IN WHICH 
*TO SAVE INTERMEDIATE DATA 
	*Give this folder the name "Temp", and put it  
	*in the "Replication-Docmentation" folder.

capture mkdir ../Temp

*SAVE THE MODIFIED DATA SET 
*IN THE Temp FOLDER,
*WITH THE NAME wdi.dta

save ../Temp/wdi.dta, replace

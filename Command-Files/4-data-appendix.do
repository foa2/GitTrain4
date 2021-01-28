/*
Created by Richard Ball
This version:  2017-07-11
Written for Stata 14--SE, 64-bit, for Windows
*/

/*WHEN THIS DO-FILE IS RUN, STATA'S WORKING DIRECTORY 
SHOULD BE SET TO THE "Command-Files" FOLDER. */

***********************************
*INDIVIDUAL-LEVEL ANALYSIS DATA
***********************************
clear
set more off
use ../Analysis-Data/individual-analysis.dta

*NUMBER OF RESPONDENTS IN EACH COUNTRY
tab CountryName

*VARIABLE: satis

	*Frequency table:
	tab satis
	
	*Relative frequency chart:
	quietly tab satis, gen(sat_)
	graph bar sat_*
	drop sat_*

*VARIABLE: age

	*Summary statistics:
	tabstat age, stat(mean sd min p25 p50 p75 max)
	
	*Histogram:
	histogram age, percent



***********************************
*COUNTRY-LEVEL ANALYSIS DATA
***********************************
clear
set more off
use ../Analysis-Data/country-analysis.dta

*VARIABLE: cm_satis

	*Summary statistics:
	tabstat cm_satis, stat(mean sd min p25 p50 p75 max)
	
	*Histogram:
	histogram cm_satis,  percent bin(3)

*VARIABLE: exp

	*Summary statistics:
	tabstat exp, stat(mean sd min p25 p50 p75 max)
	
	*Histogram:
	histogram exp,  percent bin(4)


*VARIABLE: inc

	*Summary statistics:
	tabstat inc, stat(mean sd min p25 p50 p75 max)
	
	*Histogram:
	histogram inc,  percent bin(4)






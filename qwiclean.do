import delimited using "qwi_raw.csv", clear

cap drop version
cap drop semp
cap drop spayroll
cap drop ownercode
cap drop agegrp
cap drop race
cap drop ethnicity
cap drop education
cap drop firmage
cap drop sex
cap drop periodicity
cap drop seasonadj



assert (geo_level == "N") == (geography == 0)
cap drop geo_level

assert (ind_level == "A") == (industry == "00")
cap drop ind_level

compress
save "qwi.dta", replace
export delimited using "qwi.csv", replace

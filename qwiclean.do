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


reshape wide emp payroll, i(geography industry year quarter) j(firmsize)

rename emp0 emp_total
rename payroll0 payroll_total

rename emp5 emp_gt500
rename payroll5 payroll_gt500

gen emp_lt500 = emp_total - emp_gt500
gen payroll_lt500 = payroll_total - payroll_gt500

compress

save "qwi.dta", replace
export delimited using "qwi.csv", replace

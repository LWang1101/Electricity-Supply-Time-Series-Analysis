cls
clear all
cd "D:/state do"  	//open the folder
capture log close   
log using 1.log,text replace
use data.dta,clear
tsset YEAR
//YEAR stands for number, forming a pseudo chronological system
/*
data resource:"Returns to Scale in Electricity Supply" by Marc Nerlove, Stanford University, Group E
outputbillionkwh:the number of out put fuel
capitalpriceindex:a apprasial used to show the price of the fuel
*/
dfuller outputbillionkwh
dfuller capitalpriceindex
dfgls capitalpriceindex, notrend
pperron capitalpriceindex


ac capitalpriceindex, lags(10) level(95) generate(New_ac)
graph save Graph Fig01_AC.gph, replace
graph export Fig01_AC.png, as(png) replace


pac capitalpriceindex, lags(10) level(95) generate(New_pac) 
graph save Graph Fig01_PAC.gph, replace
graph export Fig01_PAC.png, as(png) replace


graph combine ///www
	Fig01_AC.gph ///www
	Fig01_PAC.gph ///www
	, rows(2) altshrink ////www
	title("AC and PAC of D.capitalpriceindex", size(medium))
	

************************ARIMAModel************************
arima outputbillionkwh, arima(1,1,0)
predict outputbillionkwh_RES, resid 
corrgram outputbillionkwh_RES 
wntestq outputbillionkwh_RES, lag(10) //White noise null hypothesis - Q test [P>0.05, n<=12 in lag (n) is sufficient]
predict outputbillionkwh_HAT
label variable outputbillionkwh_HAT "predicted capitalpriceindex"

tsline D.productioncostsmillion outputbillionkwh_HAT, lcolor(blue red) lwidth(medium medithic)
	xtitle("") xlabel(, grid gmax gmin) ytitle("outputbillionkwh")
	ylabel(, grid gmax gmin) ylabel(0. lcolor(gs12))

log close//close

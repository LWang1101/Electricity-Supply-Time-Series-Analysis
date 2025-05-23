# Electricity Supply Time Series Analysis

This repository contains a time series econometric analysis based on the dataset from **"Returns to Scale in Electricity Supply"** by Marc Nerlove (Stanford University, Group E). The analysis is implemented in **Stata** and focuses on stationarity testing, autocorrelation analysis, and ARIMA modeling for electricity supply data.

## 📂 Project Structure

- `data.dta`: Main dataset used in the analysis.
- `1.log`: Stata log file recording outputs from all commands.
- `Fig01_AC.gph`, `Fig01_PAC.gph`: Graphs of ACF and PACF.
- `Fig01_AC.png`, `Fig01_PAC.png`: Exported PNG versions of the graphs.
- `ARIMA_analysis.do`: Stata do-file containing all analysis steps.

## 📊 Objective

To assess the statistical properties of the variables related to electricity production, particularly:

- **`outputbillionkwh`**: Output in billion kilowatt-hours.
- **`capitalpriceindex`**: Price index representing capital/fuel prices.

The goal is to model `outputbillionkwh` using ARIMA techniques and evaluate the stationarity and autocorrelation properties of the time series data.

## 🧪 Methods and Steps

1. **Initial Setup**:
   - Load data and set time-series structure with `tsset`.

2. **Stationarity Tests**:
   - Augmented Dickey-Fuller (`dfuller`)
   - DF-GLS (`dfgls`)
   - Phillips-Perron (`pperron`)

3. **Autocorrelation Analysis**:
   - ACF and PACF with 95% confidence bounds.
   - Visualized and saved as `.gph` and `.png`.

4. **Model Estimation**:
   - Fit ARIMA(1,1,0) model.
   - Predict residuals and check for white noise using `wntestq`.

5. **Forecasting and Visualization**:
   - Generate in-sample predictions.
   - Compare predictions against actual data using `tsline`.

## 📁 How to Reproduce

To run this project:

1. Open Stata.
2. Set the working directory:
   ```stata
   cd "D:/state do"
3. Run the script:
   ```stata
   do ARIMA_analysis.do
Make sure data.dta is in the directory and all necessary packages/functions are available in your Stata environment.

## 📚 Data Source

**Marc Nerlove** – *Returns to Scale in Electricity Supply*, Stanford University, Group E.  
The data captures historical electricity output and capital price indices relevant to production analysis.

## 📌 Notes

- This project uses pseudo time (`YEAR`) as the time index.
- Residual diagnostics are performed to validate ARIMA assumptions.
- Visual outputs are exported in both `.gph` and `.png` formats.

## 📜 License

This project is for academic and research purposes.  
If you use it, please cite the original data source and this repository (following the MIT licence).

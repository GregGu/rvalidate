---
title: "rvalidate"
date: "2020-01-27"
output:
  html_document:
    keep_md: TRUE
    
---




## Table of Contents
1. [Introduction](#intro)
2. [Error tables](#2)
3. [Coverage tables](#3)
4. [Statistics for multiple observations per group](#4)
  
## <a name="intro"></a>
## Introduction
rvalidate computes validation statistics for models and draw up aesthetic tables and plots. Supports error, coverage, and Probability integral transforms. Input data should be formated as our simulated data. See `rvalidate::rv_data` below

```r
library(rvalidate)
rv_data %>% head() %>% kableExtra::kable()
```

<table>
 <thead>
  <tr>
   <th style="text-align:right;"> country_code </th>
   <th style="text-align:right;"> year </th>
   <th style="text-align:left;"> source </th>
   <th style="text-align:right;"> observed_value </th>
   <th style="text-align:right;"> total_sd </th>
   <th style="text-align:right;"> 2.5% </th>
   <th style="text-align:right;"> 10% </th>
   <th style="text-align:right;"> 50% </th>
   <th style="text-align:right;"> 90% </th>
   <th style="text-align:right;"> 97.5% </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 452 </td>
   <td style="text-align:right;"> 1968 </td>
   <td style="text-align:left;"> DHS </td>
   <td style="text-align:right;"> 9.978187 </td>
   <td style="text-align:right;"> 0.0076347 </td>
   <td style="text-align:right;"> 11.216954 </td>
   <td style="text-align:right;"> 11.876886 </td>
   <td style="text-align:right;"> 13.105444 </td>
   <td style="text-align:right;"> 14.44993 </td>
   <td style="text-align:right;"> 15.07335 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 460 </td>
   <td style="text-align:right;"> 2012 </td>
   <td style="text-align:left;"> MCS </td>
   <td style="text-align:right;"> 10.004454 </td>
   <td style="text-align:right;"> 0.0069228 </td>
   <td style="text-align:right;"> 11.363874 </td>
   <td style="text-align:right;"> 11.983092 </td>
   <td style="text-align:right;"> 13.232552 </td>
   <td style="text-align:right;"> 14.58292 </td>
   <td style="text-align:right;"> 15.24793 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 400 </td>
   <td style="text-align:right;"> 1989 </td>
   <td style="text-align:left;"> DHS </td>
   <td style="text-align:right;"> 9.950544 </td>
   <td style="text-align:right;"> 0.0059009 </td>
   <td style="text-align:right;"> 8.177640 </td>
   <td style="text-align:right;"> 8.864203 </td>
   <td style="text-align:right;"> 10.177068 </td>
   <td style="text-align:right;"> 11.53340 </td>
   <td style="text-align:right;"> 12.18274 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 452 </td>
   <td style="text-align:right;"> 1987 </td>
   <td style="text-align:left;"> MCS </td>
   <td style="text-align:right;"> 9.986848 </td>
   <td style="text-align:right;"> 0.0148777 </td>
   <td style="text-align:right;"> 6.967247 </td>
   <td style="text-align:right;"> 7.752201 </td>
   <td style="text-align:right;"> 8.996949 </td>
   <td style="text-align:right;"> 10.28428 </td>
   <td style="text-align:right;"> 11.06708 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 410 </td>
   <td style="text-align:right;"> 1975 </td>
   <td style="text-align:left;"> DHS </td>
   <td style="text-align:right;"> 10.102261 </td>
   <td style="text-align:right;"> 0.0112292 </td>
   <td style="text-align:right;"> 9.581199 </td>
   <td style="text-align:right;"> 10.318207 </td>
   <td style="text-align:right;"> 11.609877 </td>
   <td style="text-align:right;"> 12.83488 </td>
   <td style="text-align:right;"> 13.35034 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 400 </td>
   <td style="text-align:right;"> 1961 </td>
   <td style="text-align:left;"> MCS </td>
   <td style="text-align:right;"> 9.904521 </td>
   <td style="text-align:right;"> 0.0102033 </td>
   <td style="text-align:right;"> 8.473300 </td>
   <td style="text-align:right;"> 9.210177 </td>
   <td style="text-align:right;"> 10.478661 </td>
   <td style="text-align:right;"> 11.74164 </td>
   <td style="text-align:right;"> 12.39988 </td>
  </tr>
</tbody>
</table>


## <a name="2"></a>
## Error tables

```r
rv_error(data = rv_data, 
           parameter = "observed_value", 
           estimate = "50%", 
           total_standard_error = "totalerror_sd",
           subset = "source")  %>%
  kableExtra::kable() %>%
  kableExtra::column_spec(1:2, bold = T) %>%
  kableExtra::collapse_rows(columns = 1:2, valign = "top") 
```

<table>
 <thead>
  <tr>
   <th style="text-align:left;"> . </th>
   <th style="text-align:left;"> source </th>
   <th style="text-align:right;"> mean </th>
   <th style="text-align:right;"> absolute_mean </th>
   <th style="text-align:right;"> median </th>
   <th style="text-align:right;"> absolute_median </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;font-weight: bold;vertical-align: top !important;" rowspan="2"> adjusted error </td>
   <td style="text-align:left;font-weight: bold;"> DHS </td>
   <td style="text-align:right;"> -0.2837196 </td>
   <td style="text-align:right;"> 0.8720215 </td>
   <td style="text-align:right;"> -0.1992226 </td>
   <td style="text-align:right;"> 0.8571875 </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> MCS </td>
   <td style="text-align:right;"> 0.2500652 </td>
   <td style="text-align:right;"> 0.8797457 </td>
   <td style="text-align:right;"> 0.1215124 </td>
   <td style="text-align:right;"> 0.9800043 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;vertical-align: top !important;" rowspan="2"> error </td>
   <td style="text-align:left;font-weight: bold;"> DHS </td>
   <td style="text-align:right;"> -0.5485532 </td>
   <td style="text-align:right;"> 1.8826515 </td>
   <td style="text-align:right;"> -0.4233111 </td>
   <td style="text-align:right;"> 1.7560879 </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> MCS </td>
   <td style="text-align:right;"> -0.2701325 </td>
   <td style="text-align:right;"> 1.1126110 </td>
   <td style="text-align:right;"> -0.3205814 </td>
   <td style="text-align:right;"> 0.8441630 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;vertical-align: top !important;" rowspan="2"> standard error </td>
   <td style="text-align:left;font-weight: bold;"> DHS </td>
   <td style="text-align:right;"> -0.0577201 </td>
   <td style="text-align:right;"> 1.0927518 </td>
   <td style="text-align:right;"> 0.0044907 </td>
   <td style="text-align:right;"> 0.9971874 </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> MCS </td>
   <td style="text-align:right;"> 0.5045546 </td>
   <td style="text-align:right;"> 1.4174942 </td>
   <td style="text-align:right;"> 0.2505769 </td>
   <td style="text-align:right;"> 1.0648596 </td>
  </tr>
</tbody>
</table>

## <a name="3"></a>
## Coverage tables
If provided a subset column name, coverage will be calculate for each subset.

```r
rv_coverage(data = rv_data, 
         parameter = "observed_value", 
         lower = "2.5%", 
         upper = "97.5%", 
         subset = "source")  %>%
  kableExtra::kable() %>%
  kableExtra::column_spec(1, bold = T)
```

<table>
 <thead>
  <tr>
   <th style="text-align:left;"> source </th>
   <th style="text-align:right;"> coverage </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;font-weight: bold;"> DHS </td>
   <td style="text-align:right;"> 0.79 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> MCS </td>
   <td style="text-align:right;"> 0.81 </td>
  </tr>
</tbody>
</table>

## <a name="4"></a>
## Statistics for data with multiple observations within a grouping
For data containing multiple observations per group (e.g. country-year you) we compute statistics for all unique permutations of the data where there is only one observation from each group in each permutation. Note the run time will increase substantially as the number of multiple observations increase.

### Error

```r
rv_error_multiple(data = rv_data, 
           parameter = "observed_value", 
           estimate = "50%", 
           total_standard_error = "total_sd",
           subset = "source",
           group_to_check = c("country_code", "year"))  %>%
  kableExtra::kable() %>%
  kableExtra::column_spec(1:2, bold = T) %>%
  kableExtra::collapse_rows(columns = 1:2, valign = "top") 
```

<table>
 <thead>
  <tr>
   <th style="text-align:left;"> statistic </th>
   <th style="text-align:left;"> source </th>
   <th style="text-align:left;"> mean </th>
   <th style="text-align:left;"> absolute_mean </th>
   <th style="text-align:left;"> median </th>
   <th style="text-align:left;"> absolute_median </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;font-weight: bold;vertical-align: top !important;" rowspan="2"> adjusted error </td>
   <td style="text-align:left;font-weight: bold;"> DHS </td>
   <td style="text-align:left;"> 0 (3e-04) </td>
   <td style="text-align:left;"> 0.02 (3e-04) </td>
   <td style="text-align:left;"> 0 (8e-04) </td>
   <td style="text-align:left;"> 0.01 (5e-04) </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> MCS </td>
   <td style="text-align:left;"> 0 (8e-04) </td>
   <td style="text-align:left;"> 0.01 (6e-04) </td>
   <td style="text-align:left;"> 0 (7e-04) </td>
   <td style="text-align:left;"> 0.01 (7e-04) </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;vertical-align: top !important;" rowspan="2"> error </td>
   <td style="text-align:left;font-weight: bold;"> DHS </td>
   <td style="text-align:left;"> -0.48 (0.0455) </td>
   <td style="text-align:left;"> 1.79 (0.033) </td>
   <td style="text-align:left;"> -0.38 (0.0687) </td>
   <td style="text-align:left;"> 1.78 (0.024) </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> MCS </td>
   <td style="text-align:left;"> 0.2 (0.0691) </td>
   <td style="text-align:left;"> 1.51 (0.0425) </td>
   <td style="text-align:left;"> -0.03 (0.0695) </td>
   <td style="text-align:left;"> 1.42 (0.1626) </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;vertical-align: top !important;" rowspan="2"> standard error </td>
   <td style="text-align:left;font-weight: bold;"> DHS </td>
   <td style="text-align:left;"> -0.22 (0.0228) </td>
   <td style="text-align:left;"> 0.83 (0.007) </td>
   <td style="text-align:left;"> -0.18 (0.0316) </td>
   <td style="text-align:left;"> 0.82 (0.0072) </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> MCS </td>
   <td style="text-align:left;"> 0.1 (0.0369) </td>
   <td style="text-align:left;"> 0.78 (0.0104) </td>
   <td style="text-align:left;"> -0.02 (0.0358) </td>
   <td style="text-align:left;"> 0.74 (0.0763) </td>
  </tr>
</tbody>
</table>

### Coverage

```r
rv_coverage_multiple(data = rv_data, 
         parameter = "observed_value", 
         lower = "2.5%", 
         upper = "97.5%", 
         subset = "source",
         group_to_check = c("country_code", "year"))  %>%
  kableExtra::kable() %>%
  kableExtra::column_spec(1:2, bold = T) %>%
  kableExtra::collapse_rows(columns = 1, valign = "top")
```

<table>
 <thead>
  <tr>
   <th style="text-align:left;"> source </th>
   <th style="text-align:left;"> coverage </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;font-weight: bold;"> DHS </td>
   <td style="text-align:left;font-weight: bold;"> 0.78 (0.0076) </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> MCS </td>
   <td style="text-align:left;font-weight: bold;"> 0.81 (0.0078) </td>
  </tr>
</tbody>
</table>


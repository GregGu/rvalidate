---
title: "rvalidate"
output:
   html_document:
      self_contained: false
      keep_md: true
---




## Table of Contents
1. [Introduction](#intro)
2. [Error tables](#2)
3. [Coverage tables](#3)
  
## <a name="intro"></a>
## Introduction
rvalidate computes validation statistics for models and draw up aesthetic tables and plots. Supports error, coverage, and Probability integral transforms. Input data should be formated as our simulated data. See `rvalidate::rv_data`

```r
rv_data %>% head()
```

```
##   country_code year source observed_value    total_sd      2.5%       10%
## 1          200 1990    MCS       9.924525 0.006920953 11.175506 11.765141
## 2          489 1989    DHS       9.970061 0.012325664 12.914963 13.595645
## 3          410 1970    DHS      10.000659 0.012731858  5.060417  5.702596
## 4          152 1993    DHS       9.979608 0.009354583  5.014258  5.684676
## 5          410 1971    DHS      10.094780 0.011888622  7.482698  8.107003
## 6          400 1982    DHS       9.997259 0.011385378  7.498365  8.179479
##         50%       90%     97.5%
## 1 13.092352 14.405077 15.066427
## 2 14.850650 16.098937 16.898571
## 3  7.016706  8.224662  8.927396
## 4  6.897760  8.219465  8.885726
## 5  9.346270 10.641755 11.277598
## 6  9.401389 10.636436 11.384788
```


## <a name="2"></a>
## Error tables

```r
rv_error(data = simdata, 
           parameter = "observed_value", 
           estimate = "50%", 
           total_standard_error = "totalerror_sd",
           subset = "source")  %>%
  kableExtra::kable() %>%
  kableExtra::column_spec(1:2, bold = T) %>%
  kableExtra::collapse_rows(columns = 1:2, valign = "top")
```

```
## Warning in matrix(c(resid, resid/sd(resid), resid/(1/
## tempdata[[total_standard_error]])), : data length [106] is not a sub-
## multiple or multiple of the number of rows [36]
```

```
## Warning in matrix(c(resid, resid/sd(resid), resid/(1/
## tempdata[[total_standard_error]])), : data length [94] is not a sub-
## multiple or multiple of the number of rows [32]
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
   <td style="text-align:left;font-weight: bold;"> MCS </td>
   <td style="text-align:right;"> -0.0432962 </td>
   <td style="text-align:right;"> 0.7916478 </td>
   <td style="text-align:right;"> -0.1640615 </td>
   <td style="text-align:right;"> 0.7430697 </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> DHS </td>
   <td style="text-align:right;"> -0.2709536 </td>
   <td style="text-align:right;"> 0.8859954 </td>
   <td style="text-align:right;"> -0.3301602 </td>
   <td style="text-align:right;"> 0.7072134 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;vertical-align: top !important;" rowspan="2"> error </td>
   <td style="text-align:left;font-weight: bold;"> MCS </td>
   <td style="text-align:right;"> -0.0894602 </td>
   <td style="text-align:right;"> 1.6289228 </td>
   <td style="text-align:right;"> -0.4259961 </td>
   <td style="text-align:right;"> 1.4650967 </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> DHS </td>
   <td style="text-align:right;"> 0.2997512 </td>
   <td style="text-align:right;"> 1.5387435 </td>
   <td style="text-align:right;"> 0.2703691 </td>
   <td style="text-align:right;"> 1.2473561 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;vertical-align: top !important;" rowspan="2"> standard error </td>
   <td style="text-align:left;font-weight: bold;"> MCS </td>
   <td style="text-align:right;"> 0.0263740 </td>
   <td style="text-align:right;"> 1.0796893 </td>
   <td style="text-align:right;"> 0.2411630 </td>
   <td style="text-align:right;"> 0.8436846 </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> DHS </td>
   <td style="text-align:right;"> -0.8204266 </td>
   <td style="text-align:right;"> 1.4364130 </td>
   <td style="text-align:right;"> -0.5648850 </td>
   <td style="text-align:right;"> 0.9888324 </td>
  </tr>
</tbody>
</table>

## <a name="3"></a>
## Coverage tables
If provided a subset column name, coverage will be calculate for each subset.

```r
rv_coverage(data = simdata, 
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
   <td style="text-align:left;font-weight: bold;"> MCS </td>
   <td style="text-align:right;"> 0.85 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> DHS </td>
   <td style="text-align:right;"> 0.82 </td>
  </tr>
</tbody>
</table>



## <a name="3"></a>
## Coverage tables for data with multiple observations within a grouping

```r
rv_coverage_multiple(data = simdata, 
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
   <th style="text-align:left;"> statistic </th>
   <th style="text-align:left;"> source </th>
   <th style="text-align:right;"> coverage </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;font-weight: bold;vertical-align: top !important;" rowspan="2"> median </td>
   <td style="text-align:left;font-weight: bold;"> DHS </td>
   <td style="text-align:right;"> 0.8260870 </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> MCS </td>
   <td style="text-align:right;"> 0.8478261 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;vertical-align: top !important;" rowspan="2"> sd </td>
   <td style="text-align:left;font-weight: bold;"> DHS </td>
   <td style="text-align:right;"> 0.0122107 </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> MCS </td>
   <td style="text-align:right;"> 0.0054348 </td>
  </tr>
</tbody>
</table>


---
title: "cetable"
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
cetable is a package for calculating errors and coverage. Output is formated to produce tables. Use cetable::exampledata as a guide to format your data before using cetable.

## <a name="2"></a>
## Error tables

```r
error_data(data = simdata, 
           parameter = "truevalue", 
           estimate = "50%", 
           totalerror_sd = "totalerror_sd",
           subset = "source")  %>%
  kableExtra::kable() %>%
  kableExtra::column_spec(1:2, bold = T) %>%
  kableExtra::collapse_rows(columns = 1:2, valign = "top")
```

```
## Warning in matrix(c(resid, resid/sd(resid), resid/(1/
## tempdata[[totalerror_sd]])), : data length [106] is not a sub-multiple or
## multiple of the number of rows [36]
```

```
## Warning in matrix(c(resid, resid/sd(resid), resid/(1/
## tempdata[[totalerror_sd]])), : data length [94] is not a sub-multiple or
## multiple of the number of rows [32]
```

<table>
 <thead>
  <tr>
   <th style="text-align:left;"> source </th>
   <th style="text-align:left;"> . </th>
   <th style="text-align:right;"> mean </th>
   <th style="text-align:right;"> absolute_mean </th>
   <th style="text-align:right;"> median </th>
   <th style="text-align:right;"> absolute_median </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;font-weight: bold;vertical-align: top !important;" rowspan="3"> MCS </td>
   <td style="text-align:left;font-weight: bold;"> error </td>
   <td style="text-align:right;"> 0.0292395 </td>
   <td style="text-align:right;"> 0.7313942 </td>
   <td style="text-align:right;"> 0.0534767 </td>
   <td style="text-align:right;"> 0.6807314 </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> standard error </td>
   <td style="text-align:right;"> -0.0246233 </td>
   <td style="text-align:right;"> 0.7600482 </td>
   <td style="text-align:right;"> 0.1916678 </td>
   <td style="text-align:right;"> 0.6608762 </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> adjusted error </td>
   <td style="text-align:right;"> -0.0513414 </td>
   <td style="text-align:right;"> 0.8340206 </td>
   <td style="text-align:right;"> 0.0558395 </td>
   <td style="text-align:right;"> 0.6900759 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;vertical-align: top !important;" rowspan="3"> DHS </td>
   <td style="text-align:left;font-weight: bold;"> error </td>
   <td style="text-align:right;"> -0.1756114 </td>
   <td style="text-align:right;"> 0.7518174 </td>
   <td style="text-align:right;"> -0.3064459 </td>
   <td style="text-align:right;"> 0.6560292 </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> standard error </td>
   <td style="text-align:right;"> -0.1736374 </td>
   <td style="text-align:right;"> 0.7971844 </td>
   <td style="text-align:right;"> 0.0317236 </td>
   <td style="text-align:right;"> 0.7281736 </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> adjusted error </td>
   <td style="text-align:right;"> 0.0809473 </td>
   <td style="text-align:right;"> 0.7063890 </td>
   <td style="text-align:right;"> 0.1564543 </td>
   <td style="text-align:right;"> 0.7039856 </td>
  </tr>
</tbody>
</table>

## <a name="3"></a>
## Coverage tables
If provided a subset column name, coverage will be calculate for each subset.

```r
coverage(data = simdata, 
         parameter = "truevalue", 
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
   <td style="text-align:right;"> 0.97 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> DHS </td>
   <td style="text-align:right;"> 1.00 </td>
  </tr>
</tbody>
</table>



## <a name="3"></a>
## Coverage tables for data with multiple observations within a grouping

```r
coverage_multiple(data = simdata, 
         parameter = "truevalue", 
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
   <th style="text-align:left;"> Group.1 </th>
   <th style="text-align:right;"> coverage </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;font-weight: bold;vertical-align: top !important;" rowspan="2"> median </td>
   <td style="text-align:left;font-weight: bold;"> DHS </td>
   <td style="text-align:right;"> 1.0000000 </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> MCS </td>
   <td style="text-align:right;"> 0.9673913 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;vertical-align: top !important;" rowspan="2"> sd </td>
   <td style="text-align:left;font-weight: bold;"> DHS </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> MCS </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
</tbody>
</table>


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
error_data(data = exampledata, 
           parameter = "pcst", 
           estimate = "50%", 
           totalerror_sd = "totalerror_sd",
           subset = "agegroup")  %>%
  kableExtra::kable() %>%
  kableExtra::column_spec(1:2, bold = T) %>%
  kableExtra::collapse_rows(columns = 1:2, valign = "top")
```

<table>
 <thead>
  <tr>
   <th style="text-align:left;"> agegroup </th>
   <th style="text-align:left;"> . </th>
   <th style="text-align:right;"> mean </th>
   <th style="text-align:right;"> absolute_mean </th>
   <th style="text-align:right;"> median </th>
   <th style="text-align:right;"> absolute_median </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;font-weight: bold;vertical-align: top !important;" rowspan="3"> [15-19] </td>
   <td style="text-align:left;font-weight: bold;"> error </td>
   <td style="text-align:right;"> -0.0298172 </td>
   <td style="text-align:right;"> 0.0386107 </td>
   <td style="text-align:right;"> -0.0202038 </td>
   <td style="text-align:right;"> 0.0225240 </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> standard error </td>
   <td style="text-align:right;"> -0.5407674 </td>
   <td style="text-align:right;"> 0.7002489 </td>
   <td style="text-align:right;"> -0.3664186 </td>
   <td style="text-align:right;"> 0.4084981 </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> adjusted error </td>
   <td style="text-align:right;"> -34.1352784 </td>
   <td style="text-align:right;"> 38.2119313 </td>
   <td style="text-align:right;"> -20.4769160 </td>
   <td style="text-align:right;"> 21.7130519 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;vertical-align: top !important;" rowspan="3"> [20-24] </td>
   <td style="text-align:left;font-weight: bold;"> error </td>
   <td style="text-align:right;"> -0.0386909 </td>
   <td style="text-align:right;"> 0.0398491 </td>
   <td style="text-align:right;"> -0.0196006 </td>
   <td style="text-align:right;"> 0.0196006 </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> standard error </td>
   <td style="text-align:right;"> -0.6912598 </td>
   <td style="text-align:right;"> 0.7119534 </td>
   <td style="text-align:right;"> -0.3501893 </td>
   <td style="text-align:right;"> 0.3501893 </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> adjusted error </td>
   <td style="text-align:right;"> -42.6198346 </td>
   <td style="text-align:right;"> 44.1095916 </td>
   <td style="text-align:right;"> -23.8462122 </td>
   <td style="text-align:right;"> 23.8462122 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;vertical-align: top !important;" rowspan="3"> [25-29] </td>
   <td style="text-align:left;font-weight: bold;"> error </td>
   <td style="text-align:right;"> -0.0723830 </td>
   <td style="text-align:right;"> 0.0734995 </td>
   <td style="text-align:right;"> -0.0342033 </td>
   <td style="text-align:right;"> 0.0342033 </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> standard error </td>
   <td style="text-align:right;"> -0.8201928 </td>
   <td style="text-align:right;"> 0.8328449 </td>
   <td style="text-align:right;"> -0.3875678 </td>
   <td style="text-align:right;"> 0.3875678 </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> adjusted error </td>
   <td style="text-align:right;"> -85.9073069 </td>
   <td style="text-align:right;"> 87.4541139 </td>
   <td style="text-align:right;"> -47.1949096 </td>
   <td style="text-align:right;"> 47.1949096 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;vertical-align: top !important;" rowspan="3"> [30-34] </td>
   <td style="text-align:left;font-weight: bold;"> error </td>
   <td style="text-align:right;"> -0.1373201 </td>
   <td style="text-align:right;"> 0.1375212 </td>
   <td style="text-align:right;"> -0.0851305 </td>
   <td style="text-align:right;"> 0.0851305 </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> standard error </td>
   <td style="text-align:right;"> -1.0747056 </td>
   <td style="text-align:right;"> 1.0762794 </td>
   <td style="text-align:right;"> -0.6662550 </td>
   <td style="text-align:right;"> 0.6662550 </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> adjusted error </td>
   <td style="text-align:right;"> -169.3051984 </td>
   <td style="text-align:right;"> 169.5529490 </td>
   <td style="text-align:right;"> -104.0555741 </td>
   <td style="text-align:right;"> 104.0555741 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;vertical-align: top !important;" rowspan="3"> [35-39] </td>
   <td style="text-align:left;font-weight: bold;"> error </td>
   <td style="text-align:right;"> -0.2208698 </td>
   <td style="text-align:right;"> 0.2208698 </td>
   <td style="text-align:right;"> -0.1574512 </td>
   <td style="text-align:right;"> 0.1574512 </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> standard error </td>
   <td style="text-align:right;"> -1.3769020 </td>
   <td style="text-align:right;"> 1.3769020 </td>
   <td style="text-align:right;"> -0.9815502 </td>
   <td style="text-align:right;"> 0.9815502 </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> adjusted error </td>
   <td style="text-align:right;"> -286.0175012 </td>
   <td style="text-align:right;"> 286.0175012 </td>
   <td style="text-align:right;"> -207.5880585 </td>
   <td style="text-align:right;"> 207.5880585 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;vertical-align: top !important;" rowspan="3"> [40-44] </td>
   <td style="text-align:left;font-weight: bold;"> error </td>
   <td style="text-align:right;"> -0.3023197 </td>
   <td style="text-align:right;"> 0.3023197 </td>
   <td style="text-align:right;"> -0.2608168 </td>
   <td style="text-align:right;"> 0.2608168 </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> standard error </td>
   <td style="text-align:right;"> -1.7161152 </td>
   <td style="text-align:right;"> 1.7161152 </td>
   <td style="text-align:right;"> -1.4805245 </td>
   <td style="text-align:right;"> 1.4805245 </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> adjusted error </td>
   <td style="text-align:right;"> -411.4972270 </td>
   <td style="text-align:right;"> 411.4972270 </td>
   <td style="text-align:right;"> -342.5641788 </td>
   <td style="text-align:right;"> 342.5641788 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;vertical-align: top !important;" rowspan="3"> [45-49] </td>
   <td style="text-align:left;font-weight: bold;"> error </td>
   <td style="text-align:right;"> -0.3466214 </td>
   <td style="text-align:right;"> 0.3466214 </td>
   <td style="text-align:right;"> -0.3243611 </td>
   <td style="text-align:right;"> 0.3243611 </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> standard error </td>
   <td style="text-align:right;"> -1.8996195 </td>
   <td style="text-align:right;"> 1.8996195 </td>
   <td style="text-align:right;"> -1.7776244 </td>
   <td style="text-align:right;"> 1.7776244 </td>
  </tr>
  <tr>
   
   <td style="text-align:left;font-weight: bold;"> adjusted error </td>
   <td style="text-align:right;"> -472.2664619 </td>
   <td style="text-align:right;"> 472.2664619 </td>
   <td style="text-align:right;"> -419.6292047 </td>
   <td style="text-align:right;"> 419.6292047 </td>
  </tr>
</tbody>
</table>

## <a name="3"></a>
## Coverage tables
If provided a subset column name, coverage will be calculate for each subset.

```r
coverage(data = exampledata, 
         parameter = "pcst", 
         lower = "2.5%", 
         upper = "97.5%", 
         subset = "agegroup")  %>%
  kableExtra::kable() %>%
  kableExtra::column_spec(1, bold = T)
```

<table>
 <thead>
  <tr>
   <th style="text-align:left;"> agegroup </th>
   <th style="text-align:right;"> coverage </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;font-weight: bold;"> [15-19] </td>
   <td style="text-align:right;"> 0.9582909 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> [20-24] </td>
   <td style="text-align:right;"> 0.9654120 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> [25-29] </td>
   <td style="text-align:right;"> 0.9440488 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> [30-34] </td>
   <td style="text-align:right;"> 0.8911495 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> [35-39] </td>
   <td style="text-align:right;"> 0.8657172 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> [40-44] </td>
   <td style="text-align:right;"> 0.8585961 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> [45-49] </td>
   <td style="text-align:right;"> 0.8575788 </td>
  </tr>
</tbody>
</table>


```r
coverage(data = exampledata, 
         parameter = "pcst", 
         lower = "2.5%", 
         upper = "97.5%", 
         subset = "sourcename")  %>%
    kableExtra::kable()
```

<table>
 <thead>
  <tr>
   <th style="text-align:left;"> sourcename </th>
   <th style="text-align:right;"> coverage </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> dhs </td>
   <td style="text-align:right;"> 0.4211597 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> mics </td>
   <td style="text-align:right;"> 0.9196338 </td>
  </tr>
</tbody>
</table>

```r
# t <- coverage(exampledata, "pcst", "2.5%", "97.5%", subset = "sourcename")
```

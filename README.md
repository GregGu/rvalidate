cetable
================

## Table of Contents

1.  [Introduction](#intro)
2.  [Error tables](#2)
3.  [Coverage tables](#3)

## <a name="intro"></a>

## Introduction

cetable is a package for calculating errors and coverage. Output is
formated to produce tables. Use cetable::exampledata as a guide to
format your data before using cetable.

## <a name="2"></a>

## Error tables

``` r
error_data(exampledata, "pcst", "50%", "totalerror_sd")  %>%
    kableExtra::kable()
```

<table>

<thead>

<tr>

<th style="text-align:left;">

</th>

<th style="text-align:right;">

mean

</th>

<th style="text-align:right;">

absolute\_mean

</th>

<th style="text-align:right;">

median

</th>

<th style="text-align:right;">

absolute\_median

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

error

</td>

<td style="text-align:right;">

\-0.1642269

</td>

<td style="text-align:right;">

0.1658165

</td>

<td style="text-align:right;">

\-0.0982731

</td>

<td style="text-align:right;">

0.0986953

</td>

</tr>

<tr>

<td style="text-align:left;">

standard error

</td>

<td style="text-align:right;">

\-0.9301576

</td>

<td style="text-align:right;">

0.9391611

</td>

<td style="text-align:right;">

\-0.5566045

</td>

<td style="text-align:right;">

0.5589960

</td>

</tr>

<tr>

<td style="text-align:left;">

adjusted error

</td>

<td style="text-align:right;">

\-5.9224288

</td>

<td style="text-align:right;">

5.9587190

</td>

<td style="text-align:right;">

\-3.5017482

</td>

<td style="text-align:right;">

3.5017482

</td>

</tr>

</tbody>

</table>

## <a name="3"></a>

## Coverage tables

If provided a subset column name, coverage will be calculate for each
subset.

``` r
coverage(exampledata, "pcst", "2.5%", "97.5%", subset = "agegroup")  %>%
    kableExtra::kable()
```

<table>

<thead>

<tr>

<th style="text-align:left;">

</th>

<th style="text-align:right;">

coverage

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

\[15-19\]

</td>

<td style="text-align:right;">

0.9582909

</td>

</tr>

<tr>

<td style="text-align:left;">

\[20-24\]

</td>

<td style="text-align:right;">

0.9654120

</td>

</tr>

<tr>

<td style="text-align:left;">

\[25-29\]

</td>

<td style="text-align:right;">

0.9440488

</td>

</tr>

<tr>

<td style="text-align:left;">

\[30-34\]

</td>

<td style="text-align:right;">

0.8911495

</td>

</tr>

<tr>

<td style="text-align:left;">

\[35-39\]

</td>

<td style="text-align:right;">

0.8657172

</td>

</tr>

<tr>

<td style="text-align:left;">

\[40-44\]

</td>

<td style="text-align:right;">

0.8585961

</td>

</tr>

<tr>

<td style="text-align:left;">

\[45-49\]

</td>

<td style="text-align:right;">

0.8575788

</td>

</tr>

</tbody>

</table>

``` r
coverage(exampledata, "pcst", "2.5%", "97.5%", subset = "sourcename")  %>%
    kableExtra::kable()
```

<table>

<thead>

<tr>

<th style="text-align:left;">

</th>

<th style="text-align:right;">

coverage

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

dhs

</td>

<td style="text-align:right;">

0.4211597

</td>

</tr>

<tr>

<td style="text-align:left;">

mics

</td>

<td style="text-align:right;">

0.9196338

</td>

</tr>

</tbody>

</table>

``` r
# t <- coverage(exampledata, "pcst", "2.5%", "97.5%", subset = "sourcename")
```

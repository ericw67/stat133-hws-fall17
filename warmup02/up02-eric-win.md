Warmup2
================

``` r
load("nba2017-salary-points.RData")
```

``` r
summary(points)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##     0.0   156.0   432.0   546.6   780.0  2558.0

``` r
mean(points)
```

    ## [1] 546.6054

``` r
summary(experience)
```

    ##    Length     Class      Mode 
    ##       441 character character

``` r
mean(salary)
```

    ## [1] 6187014

``` r
sd(salary)
```

    ## [1] 6571890

``` r
min(salary)
```

    ## [1] 5145

``` r
max(salary)
```

    ## [1] 30963450

``` r
median(salary)
```

    ## [1] 3500000

``` r
quantile(salary)
```

    ##       0%      25%      50%      75%     100% 
    ##     5145  1286160  3500000  9250000 30963450

``` r
hist(salary)
```

![](up02-eric-win_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-5-1.png)

``` r
boxplot(salary)
```

![](up02-eric-win_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-5-2.png)

``` r
is.factor(position)
```

    ## [1] FALSE

``` r
position_factor <- factor(position)
frequencies <- table(position_factor) / 441
barplot(frequencies)
```

![](up02-eric-win_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-6-1.png)

``` r
C_salary <- salary[position == 'C']
PF_salary <- salary[position == 'PF']
PG_salary <- salary[position == 'PG']
SF_salary <- salary[position == 'SF']
SG_salary <- salary[position == 'SG']
```

``` r
hist(C_salary)
```

![](up02-eric-win_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-8-1.png)

``` r
hist(PF_salary)
hist(PF_salary)
```

![](up02-eric-win_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-8-2.png)

``` r
hist(SF_salary)
```

![](up02-eric-win_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-8-3.png)

``` r
hist(SG_salary)
```

![](up02-eric-win_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-8-4.png)

``` r
median(C_salary)
```

    ## [1] 3911380

``` r
median(PF_salary)
```

    ## [1] 3800000

``` r
median(PG_salary)
```

    ## [1] 3183526

``` r
median(SF_salary)
```

    ## [1] 3730653

``` r
median(SG_salary)
```

    ## [1] 3332940

``` r
max(C_salary)
```

    ## [1] 26540100

``` r
max(PF_salary)
```

    ## [1] 2.5e+07

``` r
max(PG_salary)
```

    ## [1] 26540100

``` r
max(SF_salary)
```

    ## [1] 30963450

``` r
max(SG_salary)
```

    ## [1] 26540100

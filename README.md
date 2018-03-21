pharmvis
================

# pharmavis

여기서 예제를 올리고 이를 응용해서 PK plot을 그려 나갈 예정입니다.

``` r
ggplot2::qplot(x=Time, y=Conc, group=ID, color = Race, 
               data=PKPDdatasets::sd_oral_richpk, 
               log = 'y',
               geom=c('line', 'point'))
```

    ## Warning: Transformation introduced infinite values in continuous y-axis
    
    ## Warning: Transformation introduced infinite values in continuous y-axis

![](README_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->

``` r
ggplot2::qplot(x=Time, y=Conc, group=ID, color = Race, 
               data=PKPDdatasets::sd_oral_richpk, 
               facets = Race ~ Gender,
               geom=c('line', 'point'))
```

![](README_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->

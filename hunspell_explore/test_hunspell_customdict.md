

```r
#
# Attempt at using a custom dictionary
# Created a small custom dictionary called test.dic with 4 words
# Created an empty file call test.aff
#

# read test.dic and print contents
setwd("~/Documents/tmp")
print(read.csv("~/Documents/tmp/test.dic", header = FALSE))
```

```
##               V1
## 1              4
## 2       methanol
## 3 methyl_alcohol
## 4        ethanol
## 5  ethyl_alcohol
```

```r
# load library hunspell
library(hunspell)

# set test dictionary
test = dictionary("~/Documents/tmp/test.dic")

# when I run this command it shows FALSE FALSE where I would have expected TRUE TRUE
hunspell_check(c("methanol", "ethanol"), dict = test)
```

```
## [1] FALSE FALSE
```

```r
# when I run this I would have thought it would suggest methanol
hunspell_suggest("methnol", dict = test)
```

```
## [[1]]
## [1] "pathname"
```

```r
sessionInfo()
```

```
## R version 3.3.1 (2016-06-21)
## Platform: x86_64-apple-darwin13.4.0 (64-bit)
## Running under: OS X 10.11.1 (El Capitan)
## 
## locale:
## [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
## [1] hunspell_2.3
## 
## loaded via a namespace (and not attached):
##  [1] backports_1.0.5 magrittr_1.5    rsconnect_0.7   rprojroot_1.2  
##  [5] htmltools_0.3.5 tools_3.3.1     Rcpp_0.12.7     stringi_1.1.1  
##  [9] rmarkdown_1.3   knitr_1.14      stringr_1.1.0   digest_0.6.10  
## [13] evaluate_0.9
```


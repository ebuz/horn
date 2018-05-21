```r
devtools::install_github('ebuz/horn')
library(horn)
horn()

horn(x <- 1)
'x' %in% ls() #TRUE

library(dplyr)

aLongTimeForNAs <- function(t, n){
  Sys.sleep(t)
  return(rep(NA, n))
}

data_frame(x = rnorm(10)) %>%
  horn() %>%
  mutate(y = aLongTimeForNAs(5, n())) %>%
  horn()
```

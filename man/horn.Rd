\name{horn}
\alias{horn}
\title{horn.}
\usage{
horn()
horn(x)
}
\description{
A horn and pipe.
}
\examples{
horn()
base::Sys.sleep(1)
horn()
base::Sys.sleep(.25)
horn()
base::Sys.sleep(.25)
horn()

horn(a <- 1)
'a' \%in\% ls() #TRUE

a <- horn(2)
a == 2 #TRUE

library(dplyr)
df <- data_frame(x = rnorm(5)) \%>\%
  horn() \%>\%
  mutate(y = rnorm(5))
}

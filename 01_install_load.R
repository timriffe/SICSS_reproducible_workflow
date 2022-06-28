

if (!"pacman" %in% rownames(installed.packages())){
  install.packages("pacman")
}
require(pacman)
cran_packages <- c("readr","readxl","tidyverse","janitor","countrycode","Hmisc")
p_isinstalled(cran_packages)
if(sum(!p_isinstalled(cran_packages)) > 0) {
  p_install(
    package = cran_packages[!p_isinstalled(cran_packages)], 
    character.only = TRUE
  )
}
p_load(cran_packages, character.only = TRUE)


# custom function used for linear interpolation in a tidy pipeline (with extrapolation)

my_interp <- function(chunk){
  who_time <- c(2000.5, 2010.5, 2015.5, 2019.5)
  
  approxExtrap(x = chunk$year, 
               y = chunk$e0, 
               xout = who_time) %>% 
    as_tibble() %>% 
    rename(year = x, e0 = y)
}



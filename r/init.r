# For Beginner of Data Mining, Visualization
chooseCRANmirror(graphics=false,ind=60) # You can use ind. by typing getCRANmirrors()

# install packages

install.packages('magrittr')
install.packages('dplyr')
install.packages('ggplot2')
install.packages('gapminder')
# install.packages(c('magrittr','dplyr','ggplot2','gapminder'))

#init packages

library(magrittr)
library(dplyr)
library(ggplot2)
library(gapminder)

# make function

i <- function(x) {
  str(x)
  glimpse(x)
 }

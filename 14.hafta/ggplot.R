# ggplot
library(dslabs)
data(murders)

library(tidyverse)
library(ggplot2)

murders %>% ggplot()  # ggplot(data = murders)

ggplot(data = murders) + geom_point(aes(x=population/10^6, y=total))

# 
ggplot(data = murders) +
  geom_point(aes(x=population/10^6, y=total)) +
  geom_text(aes(x=population/10^6, y=total, label = abb)) +
  geom_point(aes(x=population/10^6, y=total, col=region), size=3)

# 
library(ggExtra)

data("mtcars")
head(mtcars)

p = ggplot(data=mtcars, aes(x=wt, y=mpg, color=cyl, size=cyl)) +
  geom_point()+
  theme(legend.position="none")
  
ggMarginal(p, type="histogram")

ggMarginal(p, type="density")



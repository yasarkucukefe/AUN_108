# R'da paket yüklemek:
# install.packages("plyr") 
# install.packages("R_paketinin_ismi")

# Yüklü bir paketi R çalışma ortamında kullanabilmek için:
library(plyr) # library(R_paketinin_ismi) ! tırnak olmadan.

x <- cbind(x1 = 3, x2 = c(4:1, 2:5))

apply(x, 1, sum) # x matrisinin satırlarının (MARGIN=1) toplamı (sum)
apply(x, 2, sum) # x matrisinin kolonlarının (MARGIN=2) toplamı (sum)

adply(x, 1, mean) # => apply(x, 1, mean)

adply(state.x77, 2, mean) # kolonların ortalaması
adply(state.x77, 2, sd) # kolonların standart sapması


# Kendimiz fonksiyon oluşturup,birden fazla değer return edebiliriz.
mean.sd.max.min = function(x) {c("mean"=mean(x),"sd"=sd(x),"max"=max(x),"min"=min(x))}

# a*ply  => data array ise kullannılır
adply(state.x77,2,mean.sd.max.min) # d: dataframe
aaply(state.x77,2,mean.sd.max.min) # a: array

# l*ply => data liste ise kullanılır
liste = list(nums=rnorm(1000), harfler=letters, nufus=state.x77[,"Population"])
print(liste)
liste$harfler # liste'nin harfler alanının(veya grubunun)  değerleri

range(liste$harfler) # "a" "z"

laply(liste,range) # a: array
ldply(liste,range) # d: data frame
llply(liste,range) # l: list

# d*ply => data veri türü eğer "data frame" ise kullanılır
state.df = data.frame(state.x77, Region=state.region, Division=state.division)
head(state.df) # stat.df => bir data frame



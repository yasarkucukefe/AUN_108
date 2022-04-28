# SIMULASYONLAR (İSTATİSTİKİ)

# sample : bir listeden belirtilen sayı kadar(size) seçim yapılabilir.
sample(x=letters, size=5) # Seçilen harf tekrar seçilmez (varsayılan ayar)
# "x" "m" "k" "y" "i"
sample(x=letters, size=5, replace = TRUE) # seçilen bir harf tekrar seçilebilir(replace=TRUE)

sample(x=c(1,3,8), size=10, replace = TRUE) # 3 3 8 3 1 1 1 1 8 1

sample(x=seq(1,100,1), size=10, replace = TRUE)
sample(x=100, size=10, replace=TRUE) # x=100 => 1'den 100'e kadar (sample komutunda)

sample(x=6,size=1)

#Rasgele sayıların üretilmesi
rnorm() # Normal dağılım rasgele sayılar

n = 100 # 100 tane 
z = rnorm(n, mean=0, sd=1) # ortalaması 0, standart sapması 1
mean(z) # -0.1257732
sd(z) # 0.9299431

# ECDF: Empirical distribution function
# Bir veri setinin ne derece normal dağılım sergilediğini test eder
x = seq(-4,4,length=100)
ecdf.fun = ecdf(z)
plot(x,ecdf.fun(x),lwd=2,col="red",type="l",ylab="CDF",main="ECDF")
lines(x,pnorm(x),lwd=2)

n=1000
z = rnorm(n, mean=0, sd=1) # ortalaması 0, standart sapması 1
x = seq(-4,4,length=1000)
plot(x,ecdf.fun(x),lwd=2,col="red",type="l",ylab="CDF",main="ECDF")
lines(x,pnorm(x),lwd=2)

# 




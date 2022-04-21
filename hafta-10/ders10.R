# Plot (Grafik çizim)

n = 50
x = runif(n, min=-2, max=2) # -2 ve 2 arasında uniform dağılım 50 tane değer
x = sort(x) # sort fonksiyonu => küçükten büyüğe sıra
y = x^3 + rnorm(n) # xKüp + normal dağılım(ortalama 0, standart sapması 1)
# plot
plot(x,y) # grafik oluştur

plot(x,y,type="l") # line plot - çizgi grafiği

plot(x,y,type="p") # point plot(scatter) - nokta grafiği

plot(x, y, main="x ve y grafiği y=x^3+rnorm")

plot(x, y, main="x ve y grafiği y=x^3+rnorm", xlab="x ekseni", ylab="y ekseni")

plot(x, y, pch=19) # pch: nokta tipini belirler. http://www.sthda.com/english/wiki/r-plot-pch-symbols-the-different-point-shapes-available-in-r

plot(x, y, type="l", lty=2, lwd=3)

plot(x, y, pch=19, col="blue")


# Çoklu grafikler
par(mar=c(1,1,1,1))
par(mfrow=c(2,2)) # Grid elemanlarını belirle 2 satır, 2 kolon
plot(x,y, main="Plot-1", pch=20, col="red")
plot(x,y, main="Plot-2", pch=20, col="blue")
plot(rev(x),y, main="Plot-3", pch=20, col="blue")
plot(rev(x),y, main="Plot-4", pch=20, col="red")

# Grafiği dosya olarak saklamak için
png(filename = "grafik.png")
par(mfrow=c(2,2)) # Grid elemanlarını belirle 2 satır, 2 kolon
plot(x,y, main="Plot-1", pch=20, col="red")
plot(x,y, main="Plot-2", pch=20, col="blue")
plot(rev(x),y, main="Plot-3", pch=20, col="blue")
plot(rev(x),y, main="Plot-4", pch=20, col="red")
dev.off()

# Histogram
hist(x)

par(mfrow=c(1,1))
hist(x, col="blue", freq = TRUE)

plot(x,y)


# ggplot grafik kütüphanesi
# install.packages("ggplot2")
library(ggplot2) # python'daki import komutu gibi

data("midwest", package="ggplot2")

ggplot(midwest, aes(x=area, y=poptotal)) + geom_point() + xlim(c(0, 0.1)) + ylim(c(0, 1000000))

g = ggplot(midwest, aes(x=area, y=poptotal)) + geom_point(col="steelblue", size=3)
g = g + xlim(c(0, 0.1)) + ylim(c(0, 1000000))
g = g + ggtitle("Alan - Nüfus İlişkişi", subtitle = "Kaynak: Midwest verisi")
g = g + xlab("Alan") + ylab("Nüfus")
g # grafik çıktısını görmek için

# Eyaletlerin farklı renklerde gösterilmesi
g = ggplot(midwest, aes(x=area, y=poptotal)) + geom_point(aes(col=state), size=3)
g = g + xlim(c(0, 0.1)) + ylim(c(0, 1000000))
g = g + ggtitle("Alan - Nüfus İlişkişi", subtitle = "Kaynak: Midwest verisi")
g = g + xlab("Alan") + ylab("Nüfus")
g # grafik çıktısını görmek için


# 4 boyut veri içeren grafik
g = ggplot(midwest, aes(x=area, y=poptotal, size=percollege)) + geom_point(aes(col=state))
g = g + xlim(c(0, 0.1)) + ylim(c(0, 1000000))
g = g + ggtitle("Alan - Nüfus İlişkişi", subtitle = "Kaynak: Midwest verisi")
g = g + xlab("Alan") + ylab("Nüfus")
g # grafik çıktısını görmek için


# Başka bir örnek
data("mtcars") # araç bilgilerinin olduğu veri seti : mtcars

ggplot(mtcars, aes(x=cyl, y=mpg)) + geom_point(aes(col=gear))








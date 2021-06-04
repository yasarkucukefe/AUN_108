n = 50
x = sort(runif(50, min=-2, max=2))
y = x^3 + rnorm(n)

plot(x, y) # type belirtilmez ise scatter plot çizer

plot(x, y, type="l")

plot(x, y, main="R ile Grafik")

plot(x, y, main="R ile Grafik", xlab = "x-ekseni", ylab = "y-ekseni")

plot(x, y, pch = 19)

plot(x, y, type="l", lty=1, lwd=3)

plot(x, y, type="l", lty=2, lwd=3)

plot(x, y, type="l", lty=2, lwd=3, col="#EA24BF")

# Çoklu grafik
par(mfrow=c(1,2)) # 2x2 grafik (4 adet)
plot(x,y,main="Grafik-1",pch=20, col="red")
plot(x,y,main="Grafik-2",type="l",col="blue")

# Histogram hist

data = rnorm(1000)
par(mfrow=c(1,1))
hist(data,breaks = 5)

yogunluk = density(data)

hist(data, col="green")
lines(yogunluk)

# Isı haritası
mat = 1:5 %o% 6:10
image(mat)

phi = dnorm(seq(-2,2,length=50))
matris = phi %o% phi
image(matris)
image(matris, col = heat.colors(10, alpha = 0.8))
image(matris, col = terrain.colors(20, alpha = 0.8))

contour(matris)

# Eğri çizmek
x = seq(-5,5,length=20)
y = x^2
plot(x,y)
plot(x,y,type="l")

curve(x^2)
curve(x^2, from=-5, to=5, lwd=2, col="red")

# Aynı grafik üzerinde birden fazla figüre
n = 100
x = sort(runif(n, min=-3, max=3))
y = x^3 + rnorm(n)
plot(x,y)
curve(x^3, from=-3, to=3, col="red", lwd="3", add=TRUE)


# Üç boyulu yüzey grafiği: http://www.stat.cmu.edu/~ryantibs/statcomp/lectures/surface.R
surface = function(expr, from.x=0, to.x=1, from.y=0, to.y=1, n.x=30, 
                   n.y=30, col.list=rainbow(30), theta=5, phi=25, mar=c(1,1,1,1), ...) {
  # Build the 2d grid
  x = seq(from=from.x,to=to.x,length.out=n.x)
  y = seq(from=from.y,to=to.y,length.out=n.y)
  plot.grid = expand.grid(x=x,y=y)
  
  # Evaluate the expression to get matrix of z values
  uneval.expr = substitute(expr)
  z.vals = eval(uneval.expr,envir=plot.grid)
  z = matrix(z.vals,nrow=n.x)
  
  # Figure out margins
  orig.mar = par()$mar # Save the original margins
  par(mar=mar)
  col.grid = col.list[round((z[-1,-1]-min(z))/(max(z)-min(z))
                            * (length(col.list)-1) + 1)]
  r = persp(x,y,z,theta=theta,phi=phi,col=col.grid,...)
  par(mar=orig.mar) # Restore the original margins
  invisible(r) # Return the persp object invisibly
}

surface(x^3 + y^3, from.x=-3, to.x=3, from.y=-3, to.y=3)

# R Renk Paletleri
n = 50
plot(0, 0, type="n", xlim=c(1,n), ylim=c(1,6))
points(1:n, rep(6,n), col=gray.colors(n), pch=19)
points(1:n, rep(5,n), col=rainbow(n), pch=19)
points(1:n, rep(4,n), col=heat.colors(n), pch=19)
points(1:n, rep(3,n), col=terrain.colors(n), pch=19)
points(1:n, rep(2,n), col=topo.colors(n), pch=19)
points(1:n, rep(1,n), col=cm.colors(n), pch=19)

# Veri Analizi - Tidyverse
df = read.csv("https://raw.githubusercontent.com/benjaminleroy/36-350-summer-data/master/Week6/strikes.csv")
head(df)
dim(df) # data frame boyutları

#
df_italy = df %>% filter(country == "Italy") # İtalya verisi için filtre
dim(df_italy)
head(df_italy)

# gruplara ayırmak için
df_ulke = df %>% group_by(country) %>% nest()

head(df_ulke)

df_ulke$data[df_ulke$country == "Italy"]

# Doğrusal Regresyon
grev_issizlik_lm = function(data){
  formul = as.formula("strike.volume ~ unemployment")
  coef_tablo = broom::tidy(lm(formul, data=data))
  return (coef_tablo %>% select(term, estimate))
}

returnEstimate = function(lmodel){
  return (lmodel[2,]$estimate)[1]
}

model = grev_issizlik_lm(df_italy)

# Nest
df %>% group_by(country) %>%
  nest() %>% 
  mutate(lmodel = map(data, grev_issizlik_lm)) %>% 
  select(country, lmodel) %>% 
  unnest() %>%  
  ungroup() %>% 
  filter(term == "unemployment") %>% 
  select(country, estimate)
  
  
  















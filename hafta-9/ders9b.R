# DATA FRAME
df = data.frame(rakamlar=seq(1,10,by=1),
                harfler=letters[1:10],
                bools = sample(c(TRUE,FALSE),10,replace=TRUE))
View(df) # Değişmenler panelinden df adına mouse click

df[,"rakamlar"] # rakamlar kolonu
df[,1] # 1. kolon (rakamlar)
df$rakamlar # rakamlar kolonu

# Hazır bir matris: state.x77
print(state.x77)
class(state.x77)
is.matrix(state.x77)

head(state.x77) # ilk 6 değer
tail(state.x77) # son 6 değer

state.region # farklı matris
state.division # farklı matris

# 1 matrisi data frame'e dönüştürmek
df.state = data.frame(state.x77,bolge=state.region,div=state.division)
# mevcut bir data frame'e yeni bir kolon eklemek
df.state = data.frame(df.state, Soguk=sample(c(T,F),nrow(df.state),replace=TRUE)) # Yöntem-1
df.state$yeniKolon = sample(1:100, nrow(df.state), replace = FALSE) # yöntem-2
# Mevcut bir kolonu silmek
df.state$yeniKolon = NULL # Seçenek-1

# data frame filtrelemek
df.state.west = subset(df.state, bolge == "West") # bolge olarak West olan değerler

# apply() yöntemi
# apply => data frame, array veya matrix'in kolonlarına bir fonksiyon uygulamak için
# lapply => bir listenin veya vektörün kolonlarına bir fonksiyon uygulamak için

# apply
apply(state.x77, MARGIN=2, FUN=min) # state.x77 matrisinde KOLONLARIN (MARGIN=2 olduğu için) minimum değerlerini hesapla

apply(state.x77, MARGIN=2, FUN=max) # state.x77 matrisinde KOLONLARIN (MARGIN=2 olduğu için) minimum değerlerini hesapla

min.liste.ind = apply(state.x77, MARGIN=2, FUN=which.min) # state.x77 matrisinde KOLONLARIN (MARGIN=2 olduğu için) minimum değerlerini hesapla

# FONKSİYONLAR
ortalama_hesapla = function(v) {
  return (mean(v)) # return parentez içinde yapılmalı!
}

ortalama_hesapla(c(1,2,3,459,112,312))

# lapply()
x = list(nums=c(1,2,3,4,5,6,7),chars=letters[1:7])

lapply(x, FUN=ortalama_hesapla)



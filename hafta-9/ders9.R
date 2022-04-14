2 + 6 # Run veya Ctrl+Enter

7 > 5 # TRUE
6 < 4 # FALSE

7 == 7 # TRUE

7 != 7 # FALSE

6 >= 4 # TRUE

(7 > 5) & (4 == 4) # &: AND

(4 == 3) | (8 < 19) # | : OR

typeof(7) # typeof: veri türünü gösterir. 7:double
is.numeric(7) # sayısal değer kontrolü
typeof(7 == 8) # logical
is.na(8) # FALSE  is.na() => NULL değer kontrolü
is.na(0/0) # TRUE
is.na("ders") # FALSE
is.character("ders") # TRUE
is.character(10) # FALSE
as.numeric("7") # as.numeric => sayısal değere dönüştür
as.numeric("a") # NA (hata üretmez, uyarı mesajı üretir)

6 * as.numeric(as.character(5/6)) # 6 * 5/6 = 5

# DEĞİŞKENLER

a = 6 # 
b <- 2 # b=2 ile aynı ama artık çok nadir kullanılan bir yöntem

c = 8
a * b * c # 96

d = a - b # d=4

a.deger = 7 # değişken isimlerin . kullanılabilir. Değişken adı: a.deger

print(a) # a değerini konsola yazar

# VEKTÖRLER

x = c(1, 2, 3, 4, 9, 12) # x: vektör 
print(x)
is.vector(x)
is.vector(a)
c("a",1,2,TRUE) # "a" "1" "2" "TRUE"

y = c(-1, -2, 2, 5, 8, -10) # y: vektör
x + y # eleman bazlı toplam. 0 0 5 9 17 2

z = c(1) # z = 1 (1 eleman)
x + z # 2 3 4 5 10 13  hata üretmez. z vektörü boyutu artar mevcut değerli
# z = c(1,1,1,1,1,1)


2 * x # elaman bazlı işlem. 2 4 6 8 18 24

# VEKTÖR KARŞILAŞTIRMASI
# x = c(1, 2, 3, 4, 9, 12) # x: vektör 
x < 5 # Boolean vektör oluşturur. TRUE  TRUE  TRUE  TRUE FALSE FALSE

x1 = c(2,2,4,9)
x2 = c(2,2,4,9)

identical(x1,x2) # TRUE
all.equal(x1,x2) # TRUE

# Vektörlerde kullanılabilecek fonksiyonlar
max(x1) # 9 (maksimum)
min(x2) # 2 (minimum)
mean(x1) # 4.25 (ortalama)
median(x1) # 3
length(x1) # 4
sum(x1) # 17 (x1'in elemanlarının toplamı)
sd(x1) # 3.304038  (standard sapma)

# Vektör elemanlarına erişim. R dili 1 endekslidir.
x = c(15, 7, 3, 6, 9, 3) # x: vektör 
x[1] # 1. eleman => 15
x[c(1,5)] # 15 9 => 1. ve 5. elemanlar
x[1,5] # HATA VERİR! 

x.yeni = x[x>4] # print(x.yeni) => 15 7 6 9
print(x)
which(x>4) # which ile indeks numaralarına erişilebilir. 1 2 4 5

# ARRAY'LER
x = c(7, 8, 10, 45)
x.arr = array(x, dim=c(2,2))
print(x.arr)
dim(x.arr) # array boyutu 2 2
is.array(x) # FALSE x: vektör
is.array(x.arr) # TRUE

# MATRİS oluşturmak
z.mat = matrix(c(10,2,9,12), nrow=2) # matrix 2x2
print(z.mat)
is.matrix(z.mat) #TRUE

# LİSTELER
liste = list("elma","portakal",12,TRUE,13.4)
print(liste)
print(liste[2]) # portakal ! indekler 1'den başlıyor.
length(liste) # 5
names(liste) = c("meyve-1","meyve-2","Rakam","Logical","Decimal")
names(liste)
liste$`meyve-1` # elma
liste[["meyve-1"]] #elma


# R İLE İNDEKSLEME
# R programlama dilinde İndeksler 1'den başlar

x.vek = rnorm(5) # 0.80740568 -0.12826833  0.03210048  0.44148644  0.47673300
x.vek[3] # 3. eleman => 0.03210048
x.vek[c(2,4)] # 2 ve 4. elemanlar => -0.12826833 ve 0.44148644
x.vek[2:4] # 2,3,ve 4. elemanlar : sembolü olunca c() gerekmiyor. 4 dahil!
x.vek[-2] # 2.eleman HARİÇ, diğer elemanlar
x.vek[x.vek>0] # Sıfırdan büyük olan değerler
mean(x.vek)

# KOŞUL KONTROLÜ (if)

x = 0.5
if(x >= 0) {
  print("x sıfırdan büyüktür")
}else{
  print("x sıfırdan küçüktür")
}

x = -1
if(x*x > 0) {
  print("xKare > 0")
}else if(x < 0){
  print("x < 0")
}else{
  print("hiçbiri")
}

# Tek satırda değer kontrolü (Ternary)
x = -1;
y = ifelse( x < 0, 2, 3) # y = 2


# DÖNGÜLER for ve while
n = 10
log.vec = vector(length = n, mode="numeric")
print(log.vec) # 0 0 0 0 0 0 0 0 0 0
for(i in 1:n){ # python=> for i in range(1,(n+1))
  log.vec[i] = log(i)
}
print(log.vec)

# break ile bir döngüden çıkılabilir.
log.vec = vector(length = n, mode="numeric")
for(i in 1:n){ # python=> for i in range(1,(n+1))
  log.vec[i] = log(i)
  if(i>5){ # 1,2,3,4,5 değerleri için döngü çalışacak.
    break
  }
}
print(log.vec)

# in ile loop
for(kelime in c("Bugün","günlerden","Perşembe")){
  print(paste(kelime," >"))
}


# while döngüsü
i=1
log.vec = c()
while(i < 11){
  log.vec = c(log.vec, log(i))
  i = i + 1
}
print(log.vec)

# Seri oluşturmak
seq(0.1,1.0,by=0.1) # sec(başla,bitir,by=arttır) (bitir dahil!)
print(seq) # 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0









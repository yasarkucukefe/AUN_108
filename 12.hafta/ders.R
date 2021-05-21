
# Koşul kontrolleri
x = 0.9

if (x > 0) {
  # x>0 için işlemler
  print("x değeri sıfırdan büyüktür.")
} else if ( x == 0){
  # x = 0 için işlemler
  print("x değeri sıfıra eşittir")
} else {
  # diğer durumlar için
  print("x değeri sıfırdan küçüktür.")
}

# İki koşul kontrolü için
y = ifelse(x>0, x,-x)

# Çok sayıda durum kontrolü için switch kullanılır.
x.vec = rnorm(100,0,1)
islem = "medyan"

switch(islem, "ortalama" = mean(x.vec),"medyan" = median(x.vec), "hist" = histogram(x.vec),"listede yok")

# Koşul operatörleri
# & : AND
# || : OR
# && : TEMBEL işlem

x=1; y=2;

if(x>0 || y>3){print ("...")}

(x < 0) && (y<2)

# Döngüler
n = 10
x.vek = rnorm(n, 0, 1)

for (i in 1:n) {
  print(x.vek[i])
}

meyveler = c("elma", "muz", "erik", "şeftali")
for(meyve in meyveler){
  print(meyve)
}


# break ile for döngüsünden çıktılır.
for(deger in x.vek){
  if(deger < 0) {break}
  print(deger)
}

for(deger in x.vek){
  if(deger < 0) {next}
  print(deger)
}

# while
i=1
while(i<10){
  print(i)
  i = i+2
}

# repeat
repeat {
  print(i)
  if(i>20) {break;}
  i = i + 2
}





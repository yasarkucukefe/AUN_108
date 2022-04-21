# Fonksiyonlar

fonksiyon_adi = function(x){
  return (x*2) # return parantes içinde yapılmalı
}

fonksiyon_adi(3) # 6

ikiRakamTopla = function(a, b=3){
  return (a + b)
}

ikiRakamTopla(5,9) #14

ikiRakamTopla(2) # 5

x = 8
topla_func = function(y){
  x = x + y
  return(x)
}

topla_func(c(1,2,3))

global_deger_degistir =function(){
  x = 3
}

global_deger_degistir()
print(x)


# String birleştirme
str1 = "Elma"
str2 = "Portakal"
str = paste(str1,str2,sep=",") # Elma,Portakal
str = paste(str1,str2,sep="-") # Elma-Portakal





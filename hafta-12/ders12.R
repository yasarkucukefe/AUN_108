# install.packages("tidyverse")
# REFERANS
# https://www.tidyverse.org/
# https://www.amazon.com/Data-Science-Transform-Visualize-Model/dp/1491910399/ref=sr_1_1?crid=27U3A86PD6ZC2&keywords=R+for+data+science&qid=1651751510&sprefix=r+for+data+science%2Caps%2C168&sr=8-1

# ggplot2, dplyr, tidyr, readr, purrr, tibble, stingr, forcats

library(tidyverse) # Tidyverse paketlerini çalışma ortamına yükle

#   %>%  : Pipe operatörü

exp(1) # 2.71 - Neredeyse bütün programlama dillerinde bu yöntem kullanılır.

islem = function(a){
  return(2+a*3-a*a)
}

islem(4) # -2

1 %>% exp()  # epx(1) ile aynı 

# Geleneksel yöntem
print(islem(exp(2))) # Anlaşılması zor bir notasyon
# veya
deger = exp(2)
deger2 = islem(deger)
print(deger2) # -30.43
# 
2 %>% exp() %>% islem() %>% print() # tek satırda sıralı işlemler

# 1'den fazla argüman içeren fonksiyonlar için?
topla = function(a,b,c){
  return (a+b+c)
}

topla(3,5,8) # 16

3 %>% topla(5,8) # pipe ile gelen değer fonksiyonun birinci argümanı olarak işlem görür.

head(mtcars,4) # mtcars adlı data frame'in ilk 4 satırı

mtcars %>% head(4) # head(mtcars,4) ile aynı

# pipe operatör çıktısının yeni fonksiyonda hangi argüman olmasını istersek onun yerine . konulmalı.

islem2 = function(a,b,c){
  return(a+2*b+3*c)
}

islem2(3,1,7) # a=3, b=1, c=7 => 26

3 %>% islem2(1,7) # a=3, b=1, c=7 => 26

7 %>% islem2(3,1,.) # a=3, b=1, c=6 => 26

cumle = "bugün günlerderden Perşembe"
toupper(cumle)

cumle %>% toupper() # pipe operatörür kullanarak

cumle %>% strsplit(split=" ") %>% .[[1]] %>% nchar() %>% max # en uzun kelimenin harf sayısı

# dplyr
slice(mtcars,c(1,2)) # mtcars dataframe'inin 1 ve 2. SATIRLARI
select(mtcars,c(4,5)) # mtcars datarame'inin 4. ve 5. KOLONLARI
mtcars[c(4,5),] # select(mtcars,c(4,5))

# Pipe operatoru ile
mtcars %>% slice(c(1,2)) # # mtcars dataframe'inin 1 ve 2. SATIRLARI
mtcars %>% select(c(4,5)) # mtcars datarame'inin 4. ve 5. KOLONLARI
# %>% => Ctrl+Shift+M

mtcars %>% slice(-c(1,2)) # 1 ve 2. satırlar ÇIKARILIRMIŞ hali ile 
mtcars %>% slice(-c(1,2)) %>% nrow() # 2 satır çıktıktan sonra kalan kayıt sayısı
nrow(mtcars[-c(1,2),]) # mtcars %>% slice(-c(1,2)) %>% nrow()

# filter() : belirtilen koşulları sağlayan satırları filtreler
subset(mtcars, (mpg >= 22)) # yakıt tüketimi 22mpg ve üzeri olan araçlar
# dplyr ile:
mtcars %>% filter(mpg >= 22) # yakıt tüketimi 22mpg ve üzeri olan araçlar

mtcars %>% filter(mpg >= 22 & disp > 100)

# select() : belirtilen kolonları listeler
mtcars[,c("hp","disp","mpg")] # mtcars'ın hp, disp ve mpg kolonları

mtcars %>% select(hp,disp,mpg) # dplyr ile

# Base R ile
kume1 = subset(mtcars, (mpg >= 22 & disp > 100))
kume1[,c("hp")]
# dplyr ile
mtcars %>% filter(mpg >= 22 & disp > 100) %>% select(hp) # 

# dplyr
mtcars %>% select(starts_with("d")) # d ile başlayan kolon isimleri
mtcars %>% select(ends_with("yl")) # yl ile biten kolon isimleri

# R ile
d.ile.baslayan.kolon.isimleri = grep(x=colnames(mtcars), pattern="^d") # d ile başlayan kolon isimleri
mtcars[,d.ile.baslayan.kolon.isimleri]

mtcars %>% select(contains("ar")) # ar içeren kolon isimleri

# pull
mtcars %>% pull(hp) # vektör değer 
mtcars %>% select(hp) # data frame

# SORU: Beygir gücü (hp) en yüksek olan 2 araç hangileridir?
# Klasik R ile çözüm
hp_sirali = order(mtcars$hp, decreasing=TRUE)
head(mtcars[hp_sirali, c("hp","mpg")],2)

# birden fazla kolonu sıralamak için
# Vites sayısı azalarak, hp ise artarak listelensin
mtcars %>% arrange(desc(gear),hp) %>% head(4) # desc:descending, küçükten büyüğer sıralamalar için boş
mtcars %>% arrange(desc(gear),hp) %>% select(gear,hp) %>%  head(8)


# dplyr arrange()
mtcars %>% arrange(desc(hp)) %>% select(hp,mpg) %>% head(2) # önceki 2 satır ile aynı sonuç

hp_sirali = order(mtcars$hp, decreasing=TRUE)
head(mtcars[hp_sirali, c("hp","mpg")],2)

# mutate()
# PROBLEM: araçların hp ve ağırlık (wt) oranları => hp/wt
# araçların yakıt tüketimi (mpg) ve ağırlık (wt) oranları => mpg/wt
# Klasik R
colnames(mtcars)
mtcars$hp_wt = mtcars$hp / mtcars$wt # yeni hp_wt kolonu
mtcars$mpg_wt = mtcars$mpg / mtcars$wt # yeni mpg_wt
head(mtcars,2)
# dplyr
mtcars %>% mutate(hp_wt2 = hp/wt, mpg_wt2 = mpg/wt) %>% head(2) # aynı sonuc

mtcars = mtcars %>% mutate(hp_wt2 = hp/wt, mpg_wt2 = mpg/wt) # orjinal mtcars değişir
colnames(mtcars)

# mutate_at => kolonlara fonksiyon uygulamak için
mtcars$log_disp = log(mtcars$disp)

mtcars %>% mutate_at("disp",log) %>% head(2)

# rename() => Kolon isimlerini değiştirmek için
colnames(mtcars)[colnames(mtcars)=="cyl"] = "silindir_say"
colnames(mtcars)
mtcars %>% rename("cyl"="silindir_say") %>% colnames() # ilk değer değişecek değerdir.

# ggplot facet_wrap
ggplot(mtcars, aes(x=hp, y=mpg)) + geom_point()

ggplot(mtcars, aes(x=hp, y=mpg)) + geom_point() + facet_wrap(~gear)

ggplot(mtcars, aes(x=hp, y=mpg, color=gear)) + geom_point()

ggplot(mtcars, aes(x=hp)) + geom_histogram() + scale_x_log10()

mtcars %>% summarise(ortalama = mean(mpg), n=n())

# vites sayısına göre (gear) araçların ortalama yakıt tüketimi netir?

mtcars %>% group_by(gear) %>% summarise(ortalama = mean(mpg))




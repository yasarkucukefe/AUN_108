library(tidyverse)

# install.packages("tidyverse")

mtcars %>% filter((mpg >=14 & gear == 4)) %>% head(2) 

exp(2)

2 %>% exp() # exp(2)

# %>% kısayol: Ctrl+Shift+M

library(EDAWR)

EDAWR::cases %>% head(3)

# Tidy data dönüşümü
# Geniş tablo formatından uzun tablo formatına dönüştür
# pivot_longer
uzun_tablo = EDAWR::cases %>% pivot_longer(cols = c(2,3,4), names_to="Sene", values_to="Değer")
print(uzun_tablo)

# pivot_wider : Geniş tablo formatına dönüşüm için
genis_tablo = uzun_tablo %>% pivot_wider(names_from="Sene",values_from="Deger")
print(genis_tablo)

# separate() # Bir kolonu ayırma işlemi (özellikle tarihler için)
EDAWR::storms %>% head(3)
data_ymd = EDAWR::storms %>% separate(date, c("y","m","d"))

# unite() # kolonları birleştirmek için kullanılır
data_ymd %>% unite(date, d, m, y, sep=".") %>% head(2)


# group_by (Gruplama yapmak için - SQL Group by benzeri)
mtcars %>% summarise(ort_yakit = mean(mpg))
mtcars %>% group_by(cyl) %>% summarise(ort_yakit_by_cly = mean(mpg))

# pull
mtcars %>% pull(hp) %>% tapply(INDEX = mtcars$cyl, FUN = summary)


# JOIN işlemleri (iki farklı veri setinin birleştirilmesi)
sehirler_nufus = data.frame(sehir=c("Istanbul","Ankara","Adana"),nufus=c(16,5,2),stringsAsFactors = FALSE)
sehirler_gelir = data.frame(sehir=c("Istanbul","Ankara","Adana","Izmir"),gelir=c(10,6,5,8),stringsAsFactors = FALSE)

print(sehirler_nufus)
print(sehirler_gelir)

# INNER JOIN # her iki tabloda da yer alan kayıtlar listelenir. (Kesişim kümesi gibi)
inner_join(x=sehirler_nufus, y=sehirler_gelir, by="sehir")

# LEFT JOIN # birinci tablonun kayıtları + ikinci tablo ile ortak olanlar
left_join(x=sehirler_nufus, y=sehirler_gelir, by="sehir")

# RIGHT JOIN
right_join(x=sehirler_nufus, y=sehirler_gelir, by="sehir")

# FULL JOIN
full_join(x=sehirler_nufus, y=sehirler_gelir, by="sehir")


sehirler_gelir %>% print() # print(sehirler_gelir)

# ÖRNEK ÇALIŞMA
grevler_df = read.csv("https://raw.githubusercontent.com/benjaminleroy/36-350-summer-data/master/Week6/strikes.csv")

dim(grevler_df)

head(grevler_df)

grevler_df_italya = grevler_df %>% filter(country == "Italy")

# Grafik
ggplot(grevler_df_italya, aes(x=left.parliament, y=strike.volume)) + geom_jitter() 

# R ile regresyon analizi (linear model - doğrusal model oluştur)

italya_lm = lm(strike.volume ~ left.parliament, data=grevler_df_italya)

summary(italya_lm) # p-değeri : 0.156 => null hipotez geçerli 

# Yukarıdaki regresyon analizi sadece italya için geçerli.
butun_ulkeler_lm = lm(strike.volume ~ left.parliament, data=grevler_df)
summary(butun_ulkeler_lm)

grevler_df %>% distinct(country) %>% nrow() # 18 ülke var.

grev_lm = function(data) {
  formul = as.formula("strike.volume ~ left.parliament")
  katsayilar = broom::tidy(lm(formul, data=data))
  return(katsayilar %>% select(p.value))
}

summary(butun_ulkeler_lm)
broom::tidy(butun_ulkeler_lm) %>% select(p.value) %>% print()

grev_by_ulke = grevler_df %>% group_by(country) %>% nest()
class(grev_by_ulke)

print(grev_by_ulke)

grev_by_ulke$data[grev_by_ulke$country=="Italy"]

ulke_lm = grevler_df %>% group_by(country) %>% nest() %>% mutate(p.value = map(data, grev_lm))

ulke_lm %>% head(5)

ulke_lm %>% select(country,p.value) %>% unnest() %>% head(18)





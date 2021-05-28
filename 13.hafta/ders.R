# Tidyverse
# install.packages("tidyverse")
library(tidyverse)


exp(1)

# pipe operator: %>% 
# aktarma operatörü
1 %>% exp()  # => exp(1)

test_func = function(x) {
  print(x+2)
}

# %>% : Ctrl+Shift+M
2 %>% exp() %>% log() %>% sqrt() #  sqrt(log(exp(2)))

2 %>% exp() %>% log() %>% sqrt() %>% test_func() #  test_funct(sqrt(log(exp(2))))

# Örnek
state_df = data.frame(state.x77)
state_df$Frost %>% mean()  # mean(state_df$Frost)

# Önrek
x = "Aktarma operatörü çok kullanşlı."
x %>% strsplit(split=" ") %>% .[[1]] %>%  nchar() %>% max() %>% print()

# Geleneksel yöntem
x = "Aktarma operatörü çok kullanşlı."
arr = strsplit(x, split(" "))
arr_ = arr[[1]]
n_arr = nchar(arr_)
max_harf = max(n_arr)
print(max_harf)

# print(max(nchar(strsplit(x, split=' ')[[1]])))
# slice : satır numaraları ile seçim
mtcars %>% slice(c(7,8,10:12)) # slice(mtcars[c(7,8,10:12)])
mtcars %>% slice(-c(2:4,16:20)) %>% nrow() # nrow(slice(mtcars[c(-c(2:4,16:20))]))

# filter
mtcars %>% filter(mpg >= 14 & hp >100) %>% nrow
# R: 
nrow(subset(mtcars, (mpg >= 14 & hp >100)))

# select : kolonlar seçilir
mtcars[, c('hp','gear','cyl')] # Base R
mtcars %>% select(hp, gear, cyl) # Tidyverse (dplyr)

# d ile başlayan kolonları seç
# Base R
d_colnames = grep(x=colnames(mtcars),pattern="^d")
head(mtcars[,d_colnames],2)
# Tidyverse
mtcars %>% select(starts_with("d")) %>% head(2)

# yl ile biten kolon isimleri
mtcars %>% select(ends_with("t")) %>% head(2)

# pull : bir kolonun vektör olarak seçilmesi
mtcars %>% pull(mpg) %>% typeof
mtcars %>% select(c(mpg)) %>% typeof

# arrange : belirtilen kolona göre sıralama yapmak için
# Base T
mpg_idx = order(mtcars$mpg, decreasing = TRUE)
head(mtcars[mpg_idx, c('mpg','hp')],5)
# Tidyverse arrange
mtcars %>% arrange(desc(mpg)) %>% select(c(mpg,hp)) %>% head(5)

# birden fazla kolon sıralaması
mtcars %>% arrange(desc(gear), hp) %>% select(c(gear,hp)) %>% head(2)
# everything ile diğer kolonların tamamı eklenebilir
mtcars %>% arrange(desc(gear), hp) %>% select(c(gear,hp,everything())) %>% head(2)

# mutate : yeni kolonlar oluşturmak için
# Base R
mtcars$mpg_wt2 = mtcars$mpg/mtcars$wt
# tidyverse
mtcars %>% mutate(mpg_wt3 = mpg/wt) # mtcars aynı kalır
mtcars = mtcars %>% mutate(mpg_wt3 = mpg/wt) # mtcars'a yeni kolon eklenir

# mutate_at : bir ve birden fazla kolona fonksiyon uygulamak için
mtcars %>% mutate_at(c("hp","mpg"), log) %>% select(c(hp,mpg)) %>% head(2)

# rename: kolon isimlerini değiştirmek için
# Base R
colnames(mtcars)[colnames(mtcars) == "hp_wt"] = "hpWt"
# rename ile
mtcars = mtcars %>% rename(mpgWt = mpg_wt)

# devtools::install_github("rstudio/EDAWR")
library(EDAWR)

cases

# tablo dönüşümü-1 : kısa => uzun (pivot_longer)
cases %>% pivot_longer(names_to="Sene", values_to="Vaka",cols=2:4)
cases %>% pivot_longer(names_to="Sene", values_to="Vaka",-country)

yeni = cases %>% pivot_longer(names_to="Sene", values_to="Vaka",-country)
yeni %>% pivot_wider(names_from = "Sene", values_from="Vaka")

# tablo dönüşümü-2 : uzun => kısa (pivot_wider)
pollution
pollution %>% pivot_wider(names_from = "size", values_from = "amount")

# separate: bir kolonu çoklu kolonlara dönüştürmek
storms
firtinalar = storms %>% separate(date, c("sene","ay","gun"),sep="-") %>% head(2)

# unite : kolonları birleştirmek için
firtinalar %>% unite(tarih, gun, ay, sene, sep=".")

# GRUPLAMA
mtcars %>% group_by(cyl) %>% head(5) 

# summarize
mtcars %>% summarise(mpg = mean(mpg), hp=mean(hp))

# Silindir sayısına göre ortalama tüketim ve beygir gücü
mtcars %>% group_by(cyl) %>% summarise(ort_tuketim = mean(mpg), ort_bg = mean(hp))

# distinct: bir kolon için benzersiz değerleri listeler
mtcars %>% distinct(cyl)
mtcars %>% distinct(hp) %>% nrow()

# ungroup: grouplanmış bir veri setinden gruplamayı kaldırmak için kullanılır.
mtcars %>% group_by(cyl) %>% ungroup()

# İleri düzey:
summary(mtcars$hp)
mtcars %>% pull(hp) %>% tapply(INDEX = mtcars$cyl, FUN = summary)

# nest
mtcars %>% group_by(cyl) %>% nest() %>% mutate(ortalama = mean())






# Data frame
# kolonların eleman sayılarının aynı olması gerekiyor.
df = data.frame(rakam=c(1:10),harf=letters[1:10],bool=sample(c(T,F), 10, replace = TRUE))

#list için bu kısıt bulunmuyor.
liste = list(rakam=c(1:20),harf=letters[1:5],bool=sample(c(T,F), 10, replace = TRUE))

#matris => data frame
typeof(state.x77)
yeni_df = data.frame(state.x77)

# Yeni kolon eklemek
df$yeniKolon = sample(c(1,2,3),10,replace = TRUE)
df$not = sample(c("A","B","C"),10,replace = TRUE)
View(df)

# Kolon silmek
df$not = NULL
df$yeniKolon = NULL
View(df)
df$favoriRenk = sample(c("Siyah","Beyaz"),10,replace = TRUE)
df$random = runif(10, -1, 1)

# filtrelemek için subset kullanılır.
siyahlar = subset(df, favoriRenk == "Siyah")


# apply
veri = state.x77
colnames(veri)
# MARGIN=1 => satır değerleri için
# MARGIN=2 => kolon değerleri için
apply(veri, MARGIN = 2, FUN = min)
apply(veri, MARGIN = 2, FUN = max)

# FUN = which.<func> => index numarasını gösterir
min_index = apply(veri, MARGIN = 2, FUN = which.min)
rownames(veri)[min_index["Murder"]]

sadece_yuzde_80 = function(v) {
  q1 = quantile(v, prob=0.1)
  q2 = quantile(v, probs = 0.9)
  return (min(v[q1 < v & v < q2]))
}

min_80 = apply(veri, MARGIN = 2, FUN = sadece_yuzde_80)

veri[veri[,"Murder"] == min_80["Murder"]]

# lapply
liste = list(rakamlar=1:10, random=rnorm(10))
lapply(liste, FUN=mean)


# sapply
sapply(liste, FUN=mean)

sapply(liste, FUN=sadece_yuzde_80)

# tapply
tapply(state.x77[,"Frost"],INDEX=state.region, FUN=mean)


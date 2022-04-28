# csv dosyalarının okunması
# http://www.stat.cmu.edu/~ryantibs/statcomp/data/strikes.csv
# read.csv
df = read.csv("http://www.stat.cmu.edu/~ryantibs/statcomp/data/strikes.csv")
head(df)
sapply(df, class)

# read.table
df2 = read.table("http://www.stat.cmu.edu/~ryantibs/statcomp/data/anss.dat", sep="\t")
head(df2)

# 
df1 = read.csv("http://www.stat.cmu.edu/~ryantibs/statcomp/data/fha.csv",colClasses = c("character","double","double","double", na.strings="NA"))
nrow(df1) # bir dataframe'de kaç satır var
head(df1)

df2 = read.csv("http://www.stat.cmu.edu/~ryantibs/statcomp/data/ua.dat",sep = ";")
nrow(df2)
head(df2)

# PROBLEM: df1 dataframe=>500 şehir, df2 => 3600 "şehir bölgesi"
df_merged = merge(x=df1, y=df2, by.x="Population", by.y="POP")
head(df_merged)

# sample kullanarak sifre üret
# 8 karakter, 3 küçük, 3 büyük, 2 rakam
kucuk_harfler = sample(x=letters,size=3,replace = TRUE)
buyuk_harfler = sample(x=letters,size=3,replace = TRUE)
buyuk_harfler = laply(buyuk_harfler,toupper) # l*ply kullan, *=>a (array return)
rakamlar = sample(x=seq(0,9,1),size=2,replace=TRUE)
print(kucuk_harfler)
print(buyuk_harfler)
print(rakamlar)

sifre_ordered = c(kucuk_harfler,buyuk_harfler,rakamlar)
print(sifre_ordered)

sifre = sample(x=sifre_ordered, size=8,replace = FALSE)
print(sifre)

# Sifre üreten fonksiyon
sifre.uret = function(k,b,r){
  kucuk_harfler = sample(x=letters,size=k,replace = TRUE)
  buyuk_harfler = sample(x=letters,size=b,replace = TRUE)
  buyuk_harfler = laply(buyuk_harfler,toupper)
  rakamlar = sample(x=seq(0,9,1),size=r,replace=TRUE)
  sifre_ordered = c(kucuk_harfler,buyuk_harfler,rakamlar)
  sifre = sample(x=sifre_ordered, size=(k+b+r),replace = FALSE)
  return(sifre)
}

sifre.uret(4,2,3) # 4 küçük harf, 2 büyük harf, 3 rakam





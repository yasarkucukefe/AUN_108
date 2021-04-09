a = 1
b = 2
sonuc = a * b
print("Sonuc="+str(sonuc))

# Yorumlar için # kullanılır
a = "karakter dizini olabilir"
metin =("MAZERETLER BAŞARISIZLIĞIN KİBARCA İFADESİDİR")

longest = max(metin.split(), key=len)
print("En uzun kelime: ", longest)
print("harf sayısı: ", len(longest))
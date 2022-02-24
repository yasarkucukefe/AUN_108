def cift_sayi_mi(rakam):
    if rakam % 2 == 0:
        return True
    return False

def butun_sayilar_tek_mi(liste):
    for rakam in liste:
        print(rakam)
        if cift_sayi_mi(rakam):
            print(f"{rakam} => çift sayı")
            return False
        else:
            print(f"{rakam} => tek sayı")
    return True

liste = [1, 3, 4, 5, 7, 9] # fonksiyon false döndürmeli

sonuc = butun_sayilar_tek_mi(liste)
print(sonuc)
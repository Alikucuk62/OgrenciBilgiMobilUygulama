class Ogrenciler {
  int id;
  String ad;
  String soyisim;
  int notvize;
  int notfinal;
  int notbutunleme;
  double ortalama;
  String durum;
  String imgurl =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png";

  Ogrenciler(int id, String ad, String soyisim) {
    this.id = id;
    this.ad = ad;
    this.soyisim = soyisim;
  }
  Ogrenciler.withId(int id, String ad, String soyisim, int notvize,int notfinal, int notbutunleme) {
    this.id = id;
    this.ad = ad;
    this.soyisim = soyisim;
    this.notvize = notvize;
    this.notfinal = notfinal;
    this.notbutunleme = notbutunleme;
  }
  Ogrenciler.withfinal(int id, int notfinal) {
    this.id = id;
    this.notfinal = notfinal;
  }

  String get getdurum {
    String mesaj = "";
    if (this.notvize == null) {
      mesaj = "vize notu girilmedi";
      this.durum = mesaj;
      return this.durum;
    }
    if (this.notfinal == null) {
      mesaj = "Final notu bekleniyor";
      this.durum = mesaj;
      return this.durum;
    } else {
      this.ortalama = (this.notvize * 0.4) + (this.notfinal * 0.6);
      if (this.notfinal < 50) {
        if (this.notbutunleme == null) {
          this.durum = "Bütünleme";
          return this.durum;
        } else {
          this.ortalama = (this.notvize * 0.4) + (this.notbutunleme * 0.6);
        }
      }
      if (this.ortalama >= 90) {
        mesaj = "AA";
      } else if (this.ortalama >= 85) {
        mesaj = "BA";
      } else if (this.ortalama >= 80) {
        mesaj = "BB";
      } else if (this.ortalama >= 70) {
        mesaj = "CB";
      } else if (this.ortalama >= 60) {
        mesaj = "CC";
      } else if (this.ortalama >= 55) {
        mesaj = "DC";
      } else if (this.ortalama >= 50) {
        mesaj = "DD";
      } else if (this.ortalama >= 45) {
        mesaj = "FD";
      } else {
        mesaj = "FF";
      }
      this.durum = mesaj;
      return this.durum;
    }
  }
}

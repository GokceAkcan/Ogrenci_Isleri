class Ogrenci
  def initialize
    @ogrenciler = {
        :o2015001 => {
            :ad => 'Gökçe',
            :soyad => 'Akcan',
            :gorsel_adresi => 'https://s-media-cache-ak0.pinimg.com/236x/1d/dd/97/1ddd97b91e6f1a431c9c73fee8b79a70.jpg',
            :vize_puan => 87,
            :odev_puan => 67,
            :final_puan => 89
        },
        :o2015002 => {
            :ad => 'Selahattin',
            :soyad => 'Akcan',
            :gorsel_adresi => 'http://2.bp.blogspot.com/-gbHUg-K-VC8/U50w0q-j7GI/AAAAAAAABBk/tghIPLoBAys/s1600/7.png',
            :vize_puan => 98,
            :odev_puan => 78,
            :final_puan => 68
        }
    }
  end

  def ad_url_getir
    subOgrenci = []
    @ogrenciler.each do |numara, bilgiler|
      subOgrenci << {:numara => numara,
                     :ad => bilgiler[:ad],
                     :soyad => bilgiler[:soyad],
                     :url => bilgiler[:gorsel_adresi]
      }
    end
    return subOgrenci
  end

  def vize_getir
    subOgrenci = []
    @ogrenciler.each do |numara, bilgiler|
      subOgrenci << {:numara => numara,
                     :ad => bilgiler[:ad],
                     :soyad => bilgiler[:soyad],
                     :vize => bilgiler[:vize_puan],
                     :harf => harfe_cevir(bilgiler[:vize_puan])
      }
    end
    return subOgrenci
  end

  def odev_getir
    subOgrenci = []
    @ogrenciler.each do |numara, bilgiler|
      subOgrenci << {:numara => numara,
                     :ad => bilgiler[:ad],
                     :soyad => bilgiler[:soyad],
                     :odev => bilgiler[:odev_puan],
                     :harf => harfe_cevir(bilgiler[:odev_puan])
      }
    end
    return subOgrenci
  end

  def final_getir
    subOgrenci = []
    @ogrenciler.each do |numara, bilgiler|
      subOgrenci << {:numara => numara,
                     :ad => bilgiler[:ad],
                     :soyad => bilgiler[:soyad],
                     :final => bilgiler[:final_puan],
                     :harf => harfe_cevir(bilgiler[:final_puan])
      }
    end
    return subOgrenci
  end

  def tum_sonuclari_getir
    subOgrenci = []
    @ogrenciler.each do |numara, bilgiler|
      ortalama = ortalama_hesapla(bilgiler[:vize_puan], bilgiler[:odev_puan], bilgiler[:final_puan])
      subOgrenci << {:numara => numara,
                     :ad => bilgiler[:ad],
                     :soyad => bilgiler[:soyad],
                     :vize => bilgiler[:vize_puan],
                     :odev => bilgiler[:odev_puan],
                     :final => bilgiler[:final_puan],
                     :ortalama => ortalama,
                     :harf => harfe_cevir(ortalama)
      }
    end
    return subOgrenci
  end

  def ogrenci_getir(numara)
    subOgrenci = Hash.new
    subOgrenci = @ogrenciler[numara.to_s.to_sym]
    subOgrenci.store(:numara, numara)

    ortalama = ortalama_hesapla(subOgrenci[:vize_puan], subOgrenci[:odev_puan], subOgrenci[:final_puan])
    subOgrenci.store(:ortalama, ortalama)
    subOgrenci.store(:harf, harfe_cevir(ortalama))

    return subOgrenci
  end

  private
  def harfe_cevir(puan)
    return case puan
             when 90..100
               'AA'
             when 85..90
               'BA'
             when 75..85
               'BB'
             when 70..75
               'CB'
             when 60..70
               'CC'
             when 50..60
               'DC'
             when 0..50
               'FF'
             else 'Geçersiz değer!'
    end
  end

  def ortalama_hesapla(vize, odev, final)
    return vize * 0.25 + odev * 0.15 + final * 0.6
  end
end
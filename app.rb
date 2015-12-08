require 'sinatra'
require_relative 'Classes/ogrenci_class'

o = Ogrenci.new

get '/ogrenciler' do
  @ogrenciler = o.ad_url_getir
  erb :ogrenciler
end

get '/vize_sonuclari' do
  @ogrenciler = o.vize_getir
  erb :vize
end

get '/odev_sonuclari' do
  @ogrenciler = o.odev_getir
  erb :odev
end

get '/final_sonuclari' do
  @ogrenciler = o.final_getir
  erb :final
end

get '/tum_sonuclar' do
  @ogrenciler = o.tum_sonuclari_getir
  erb :tum_sonuclar
end

get '/ogrenci/:numara' do |numara|
  @ogrenci = o.ogrenci_getir(numara.to_s.delete!(':'))
  erb :ogrenci
end

post '/ogrenci' do
  @numara = params[:numara]
  p @numara
end
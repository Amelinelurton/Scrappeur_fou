
require 'rspec'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))


#names_array = page.css(names).map(&:text)
names_crypto = []

page.xpath("/html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[3]/div").each{|name|
    names_crypto.push(name.text)
}





valeur_crypto = []

page.xpath("/html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/div/a").each{|valeur|
    valeur_crypto.push(valeur.text)
}






array_crypto = names_crypto.zip(valeur_crypto).flatten.compact


print array_crypto


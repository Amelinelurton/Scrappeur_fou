
require 'rspec'
require 'nokogiri'
require 'open-uri'


def create_hash()


    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))


    names_crypto = []
    page.xpath("/html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[3]/div").each{|name|
        names_crypto.push(name.text)
    }



    valeur_crypto = []
    page.xpath("/html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/div/a").each{|valeur|
        valeur_crypto.push(valeur.text)
    }


    array_crypto = names_crypto.zip(valeur_crypto).map! { |k, v| { k => v}}

    puts array_crypto
    return array_crypto

end


create_hash

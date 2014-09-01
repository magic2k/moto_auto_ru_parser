require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://moto.auto.ru/motorcycle/used/yamaha/xv-1700-warrior/?currency_key=&price_usd%5B1%5D=&price_usd%5B2%5D=&year%5B1%5D=0&year%5B2%5D=0&client_id=0&region_id=89&stime=0&available_key='))

doc.css('table.list>tr').each do |l|
	l.each do |p|
		puts p
	end
	# puts l.css['.offer-list'].class
	puts '_______________________________--'	
	# puts l['href']	
	# offer = Nokogiri::HTML(open(l['href']))
	# offer.css('.cost').each do |c|
	# 	puts c.content
	# end
end
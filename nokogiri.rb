#moto.auto.ru parser

require 'nokogiri'
require 'open-uri'

# doc = Nokogiri::HTML(open('http://moto.auto.ru/motorcycle/used/yamaha/xv-1700-warrior/?currency_key=&price_usd%5B1%5D=&price_usd%5B2%5D=&year%5B1%5D=0&year%5B2%5D=0&client_id=0&region_id=89&stime=0&available_key='))
doc = Nokogiri::HTML(open('http://moto.auto.ru/motorcycle/used/honda/bros/')) do |options|
	options.strict.noblanks.nonet
end

offer_links = []

doc.css('table.list>tr').each do |l|
  #price in the first <nobr>
	l.css('nobr').each { |p| puts p.content; break;}

  #link to offer and bike name in the same class string
	l.css('.offer-list').each do |link|
		puts link.content
		puts link['href']
		offer_links << link['href']
	end
	puts '____________next >___________________--'
end

#inside the first offer...

offer = Nokogiri::HTML(open(offer_links[0]))
puts offer.css('#card-year').each {|y| puts y.content; break }
offer.css('.cost').each do |c|
	puts c.content
end

module Parser
  extend ActiveSupport::Concern
  require 'open-uri'
  require 'nokogiri'

  included do
    #relations, callbacks, validations, scopes and others...
  end

  #instance methods
  def parse(req_url, request_id)
    get_offers_from req_url, request_id
    save_offers
  end

  def get_offers_from(req_url, request_id)
    @new_offers = []
    doc = Nokogiri::HTML(open(req_url.to_s)) do |options|
      options.strict.noblanks.nonet
    end

    doc.css('table.list>tr').each do |l|
      offer_name  = nil
      offer_url   = nil
      offer_price = nil
      l.css('nobr').each { |p| offer_price = p.content; break; }

      #link to offer and bike name in the same class string
      l.css('.offer-list').each do |link|
        offer_name = link.content
        offer_url = link['href']
      end
      @new_offers << Offer.new(name: offer_name, url: offer_url, price: offer_price, request_id: request_id)
    end
    # @new_offers
  end

  def save_offers
    @new_offers.each do |offer|
      offer.save
    end
  end

  module ClassMethods
    #class methods
  end
end

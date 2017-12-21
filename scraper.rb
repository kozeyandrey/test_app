require 'HTTParty'
require 'nokogiri'
require 'open-uri'

class Scraper
  LINK = URI(
    'https://sdw.ecb.europa.eu/quickview.do?SERIES_KEY=120.EXR.D.USD.EUR.SP00.A'
  ).freeze

  def self.call
    page = HTTParty.get(LINK.to_s)
    parse_page = Nokogiri::HTML(page)

    links = parse_page.css('a')
    href = links.map do |link|
      link.attribute('href').to_s.gsub!('type=csv', 'type=csv')
    end

    open('http://' + LINK.host + href.compact.first)
  end
end

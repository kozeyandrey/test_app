require 'HTTParty'
require 'nokogiri'
require 'open-uri'

class Scraper
  def self
}    all
    # this is how we request the page we're going to scrape
    uri = URI(
      "https://sdw.ecb.europa.eu/quickview.do?SERIES_KEY=120.EXR.D.USD.EUR.SP00.A"
    )
    page = HTTParty.get(uri.to_s)

    # this is where we transform our http response into a nokogiri object
    # so that we can parse it
    parse_page = Nokogiri::HTML(page)

    links = parse_page.css('a')
    href = links.map do |link|
      link.attribute('href').to_s.gsub!('type=csv', 'type=csv')
    end

    open('http://' + uri.host + href.compact.first)
  end
end

require 'open-uri'
require 'nokogiri'
require 'pry'

class TakeoutFinder::Scraper

    def initialize(state, city)
       @state = state
       @city = city
       @site_url = "https://restaurantji.com/#{state}/#{city}/"
    end

    def scrape_categories
        doc = Nokogiri::HTML(URI.open(@site_url))
        category_array = []
        category_elements = doc.css(".strip.grid").children.css("figure").children.css("small")
        category_elements.each do | element |
            category_array << element.text
        end
        category_array.uniq.each do |category|
            TakeoutFinder::Category.new(category)
        end
    end

    def scrape_restaurant_details
        doc = Nokogiri::HTML(URI.open(@site_url))
        doc.css(".strip.grid").each do |restaurant|
            TakeoutFinder::Restaurant.new(
                restaurant.css("h3").children.css("a").text, #name
                restaurant.css("figure").children.css("small").text, #category
                restaurant.css(".wrapper").children.css("small").text, #address
                restaurant.css(".phone").text, #phone
                restaurant.css(".wrapper").children.css("p").text #description
            )
        end
    end
end
# responsible for storing data re: individual restaurants
# restaurants belong to a category
# should track restaurant objects by category


class TakeoutFinder::Restaurant
    attr_accessor :name, :category, :address, :phone, :description, :url

    @@all = []

    def initialize(name, category, address=nil, phone=nil, decription=nil, url=nil)
        @name = name
        @category = category
        @address = address
        @phone = phone
        @description = description
        @url = url
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        # find user's selected object
    end

    def address
        # address data from scraper
    end

    def phone
        # phone data from scraper
    end

    def description
        # description text from scraper
    end

    def url 
        # url data from scraper
    end
end
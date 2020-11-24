# responsible for storing data re: individual restaurants
# restaurants belong to a category
# should track restaurant objects by category


class TakeoutFinder::Restaurant
    attr_accessor :name, :category, :address, :phone, :description

    @@all = []

    def initialize(name, category, address=nil, phone=nil, description=nil)
        @name = name
        @category = category
        @address = address
        @phone = phone
        @description = description
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

end
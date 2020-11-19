class TakeoutFinder::Category
    attr_accessor :name, :restaurants

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def self.all
        @@all
    end

    def restaurants
        # creates array of restaurant objects with a category that match the category instance
        Restaurant.all.select {|restaurant| restaurant.category == self}
    end

    def save
        @@all << self
    end

    def puts_category
        # puts out all the restaurants in the category
        restaurants.each {|restaurant| puts restaurant.name}
    end
end
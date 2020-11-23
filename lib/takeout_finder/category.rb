# responsible for finding and returning all available restaurant categories in the user's provided location
# category has many restaurants
# should know of all category objects with no duplicates
# should know of all restaurants in each category

class TakeoutFinder::Category
    attr_accessor :name, :restaurant

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def restaurants
        # creates array of restaurant objects with a category that matches the category instance.
        Restaurant.all.select {|restaurant| restaurant.category == self}
    end

    def puts_category
        # puts out all the restaurants in the category
        restaurants.each {|restaurant| puts restaurant.name}
    end
end
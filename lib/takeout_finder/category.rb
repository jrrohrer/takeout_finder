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
        TakeoutFinder::Restaurant.all.select do |restaurant| 
            restaurant.category == self.name
        end
    end

    #def puts_category
        # puts out all the restaurants in the category
        #restaurants.each do |restaurant| 
            #puts restaurant.name
        #end
    #end
end
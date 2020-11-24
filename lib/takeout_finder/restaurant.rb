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

    def self.clear
        @@all.clear
    end
end
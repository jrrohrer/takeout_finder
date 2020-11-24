class TakeoutFinder::CLI

  def call
    puts "\nWelcome to Takeout Finder!".colorize(:light_blue)
    puts "\nPlease enter your two-letter state code:".colorize(:light_blue)
    state = gets.strip.downcase
    puts "\nPlease enter your city name (Don't forget to double-check your spelling!):".colorize(:light_blue)
    city = gets.strip.downcase.gsub(" ", "-")
    scraper = TakeoutFinder::Scraper.new(state, city)
    scraper.scrape_categories
    scraper.scrape_restaurant_details
    get_restaurant_category
    category_list
    get_category_selection
    
  end
=begin
these two methods are for debugging in vs code. they bypass the user input lines. 
  def call_debugging
    puts "\nWelcome to Takeout Finder!".colorize(:Green)
    puts "\nPlease enter your two-letter state code:".colorize(:light_blue)
    state = "pa"
    puts "\nPlease enter your city name:".colorize(:light_blue)
    city = "elizabethtown"

    query(state, city)
  end

  def query(state, city)
    scraper = TakeoutFinder::Scraper.new(state, city)
    scraper.scrape_categories
    scraper.scrape_restaurant_details
    puts "Please choose a restaurant category by number:".colorize(:light_blue)
    get_restaurant_category
    

    category_list
    get_category_selection

  end
=end
    
  def get_restaurant_category
    # gets category objects for local restaurants
    puts "\nPlease choose a restaurant category by number:".colorize(:light_blue)
    @category = TakeoutFinder::Category.all
  end
  
  def category_list
    # display list of restaurant categories
    @category.each_with_index do |cuisine, index|
      puts "#{index+1}. #{cuisine.name}"
    end
  end

  def valid_input(input, array)
    input.to_i <= array.length && input.to_i > 0
  end
  
  def get_category_selection
    # gets user's category selection and displays list of restaurants in chosen category if input is valid
    category_selection = gets.strip.to_i
    restaurant_list(category_selection) if valid_input(category_selection, @category)
  end

  def restaurant_list(category_selection)
    # lists restaurants in the user's chosen category
    category = @category[category_selection-1]
    category.restaurants
    puts "\nHere are the restaurants in that category:".colorize(:light_blue)
    category.restaurants.each_with_index do |restaurant, index|
      puts "#{index+1}. #{restaurant.name}"
    end
  end



  def restaurant_detail(restaurant_selection)
    # puts restaurant details (name, location, phone number, description)
    puts "Here are the details for your chosen restaurant:".colorize(:light_blue)
    puts "#{restaurant_selection.name}"
    puts "#{restaurant_selection.address}"
    puts "#{restaurant_selection.phone}"
    puts "#{restaurant_selection.description}"
    puts "#{restaurant_selection.url}"
  end
end
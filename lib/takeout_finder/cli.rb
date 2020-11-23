# responsible for user interface
# gets user input for URL to scrape
# returns list of available restaurant categories
# gets user choice of category
# returns list of restaurants in that category
# gets user choice of restaurant
# returns details for that restaurant (name, address, phone number, description, url?)
# asks if user would like to start over, or else exit

class TakeoutFinder::CLI
  def call
    puts "\nWelcome to Takeout Finder!".colorize(:Green)
    puts "\nPlease enter your two-letter state code:".colorize(:light_blue)
    state = gets.strip.downcase
    puts "\nPlease enter your city name:".colorize(:light_blue)
    city = gets.strip.downcase
    puts "Please choose a restaurant category by number:".colorize(:light_blue)
    get_restaurant_category
    category_list
    get_user_category
    restaurant_list(@category_selection)
    get_user_restaurant
    restaurant_detail
    puts "\nWhat would you like to do next?"
    puts  "\nEnter 'again' to start over or 'exit' if you are finished."
  end
    
  def get_restaurant_category
    # to be scraped later; gets category objects for local restaurants
    @category = TakeoutFinder::Category.all
    TakeoutFinder::Category.new("Burgers")
    TakeoutFinder::Category.new("Sushi")
    TakeoutFinder::Category.new("Tacos")

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
  
  def get_user_category
    # gets user's category selection and displays list of restaurants in chosen category if input is valid
    @category_selection = gets.strip.to_i
    restaurant_list(@category_selection) if valid_input(@category_selection, @category)
  end

  def restaurant_list(category_selection)
    cuisine = @category[@category_selection-1]
    puts "Please choose a restaurant by number:".colorize(:light_blue)
    @restaurants = TakeoutFinder::Category.restaurants
  end

  def get_user_restaurant
    # gets user's restaurant selection 
    restaurant_selection = gets.strip.to_i
    restaurant_detail(restaurant_selection) if valid_input(restaurant_selection, @restaurants)
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
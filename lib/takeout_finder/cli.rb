class TakeoutFinder::CLI
  def call
    puts "\nWelcome to Takeout Finder!".colorize(:blue)
    puts "\nPlease enter your two-letter state code:".colorize(:light_blue)
    state = gets.strip.downcase
    puts "\nPlease enter your city name:".colorize(:light_blue)
    city = gets.strip.downcase
    puts "Please choose a restaurant category by number:".colorize(:light_blue)
    get_restaurant_category
    category_list
    get_user_category
  end
    
  def get_restaurant_category
    # to be scraped later
    @category = TakeoutFinder::Category.all

  end
  
  def category_list
    # list restaurant objects by category
    @category.each_with_index do |cuisine, index|
      puts "#{index+1}. #{cuisine.name}"
    end
  end
  
  def get_user_category
    # gets user's category selection and displays list of restaurants in chosen category
    category_selection = gets.strip.to_i
    display_restaurants(category_selection) if valid_input(category_selection, @category)
  end
  
  def restaurant_detail
    # puts restaurant details (name, location, phone number, description)
  end
  
  def valid_input(input, array)
    input.to_i <= array.length && input.to_i > 0
  end

  def display_restaurants(category_selection)
    cuisine = @category[category_selection-1]
    puts "Here are the local #{cuisine.name} restaurants:"
  end
end
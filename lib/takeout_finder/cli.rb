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
    scraper = TakeoutFinder::Scraper.new(state, city)
    scraper.scrape_categories
    puts "Please choose a restaurant category by number:".colorize(:light_blue)

    #query(state, city)
  end

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
    puts "Please choose a restaurant category by number:".colorize(:light_blue)
    get_restaurant_category
    scraper.scrape_restaurant_details

    category_list
    get_user_category











  end

    
  def get_restaurant_category
    # to be scraped later; gets category objects for local restaurants
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
  
  def get_user_category
    # gets user's category selection and displays list of restaurants in chosen category if input is valid
    @category_selection = 5 # gets.strip.to_i
    restaurant_list(@category_selection) if valid_input(@category_selection, @category)
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
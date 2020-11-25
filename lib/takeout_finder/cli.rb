class TakeoutFinder::CLI

  def call
    @input = ""
    until @input == "exit"
      query
      restaurant_category
      category_list
      get_category_selection
      get_restaurant_selection
      what_next
    end
  end

  def query
    # gets user input and runs the scraper calls
    puts "\nWelcome to Takeout Finder!".colorize(:light_blue)
    puts "\nPlease enter your two-letter state code:".colorize(:light_blue)
    state = gets.strip.downcase
    exit if state == "exit"
    puts "\nPlease enter your city name (Don't forget to double-check your spelling!):".colorize(:light_blue)
    city = gets.strip.downcase.gsub(" ", "-")
    exit if city == "exit"
    scraper = TakeoutFinder::Scraper.new(state, city)
    scraper.scrape_categories
    scraper.scrape_restaurant_details
    if TakeoutFinder::Category.all == []
      begin
        raise SearchError
      rescue SearchError => error
        puts error.message
        exit
      end
    end
  end
    
  class SearchError < StandardError
    def message
      puts "\nThere was a problem with your search. Please check your state code and city name spelling and start again.".colorize(:light_blue)
    end
  end

  def restaurant_category
    # gets category objects for local restaurants
    puts "\nPlease choose a restaurant category by number:".colorize(:light_blue)
    @category = TakeoutFinder::Category.all
  end
  
  def category_list
    # display list of restaurant categories
    @category.each_with_index {|cuisine, index| puts "#{index+1}. #{cuisine.name}"}
  end

  def valid_input(input, array)
    exit if input == "exit"
    input.to_i <= array.length && input.to_i > 0
  end
  
  def get_category_selection
    # gets user's category selection and displays list of restaurants in chosen category if input is valid
    @input = gets.strip
    restaurant_list(@input.to_i) if valid_input(@input, @category)
  end

  def restaurant_list(category_selection)
    # lists restaurants in the user's chosen category
    category = @category[category_selection-1]
    @options = category.restaurants
    puts "\nHere are the restaurants in that category:".colorize(:light_blue)
    @options.each_with_index {|restaurant, index| puts "#{index+1}. #{restaurant.name}"}
  end

  def get_restaurant_selection
    # gets user's restaurant selection and displays details for that restaurant.
    puts "\nPlease select a restaurant by number for more details:".colorize(:light_blue)
    @input = gets.strip
    if valid_input(@input, @options)
      restaurant = @options[@input.to_i-1]
    end
    restaurant_detail(restaurant)
  end

  def restaurant_detail(restaurant)
    # puts restaurant details (name, location, phone number, description)
    puts "\nHere are the details for your chosen restaurant:".colorize(:light_blue)
    puts "Name: #{restaurant.name}"
    puts "Address: #{restaurant.address}"
    puts "Phone: #{restaurant.phone}"
    puts "Review: #{restaurant.description}"
  end

  def what_next
    puts "\nWould you like to start over? y/n".colorize(:light_blue)
    @input = gets.strip.downcase
    if @input == "y"
      TakeoutFinder::Restaurant.clear
      TakeoutFinder::Category.clear
      TakeoutFinder::CLI.new.call
    elsif @input == "n"
      puts "\nThanks for using Takeout Finder! Enjoy your meal!".colorize(:light_blue)
      exit
    elsif @input != "y" && @input != "n"
      puts "Please enter 'y' to start over or 'n' to exit.".colorize(:light_blue)
      what_next
    end
  end
end
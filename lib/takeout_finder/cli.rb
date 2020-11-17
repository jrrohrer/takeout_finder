class TakeoutFinder::CLI
  def call
    puts "\nWelcome to Takeout Finder!\n"
    puts "Please choose a restaurant category by number:"
    restaurant_category
    category_list
    user_category_selection
  end
    
  def restaurant_category
    #to be scraped later
    @category = ["Pizza", "Hamburgers & Hot Dogs", "Chinese", "Mexican", "Chicken Wings", "Latin American", "Brewpubs", "Sushi", "Italian", "Farmers Market", "Burgers", "Takeout", "Food Trucks"]
  end
  
  def category_list
    #list restaurant objects by category
    @category.each_with_index do |cuisine, index|
      puts "#{index+1}. #{cuisine}"
    end
  end
  
  def user_category_selection
    category_selection = gets.strip
    binding.pry
  end
  
  def restaurant_detail
    #puts restaurant details (name, location, phone number, description)
  end
  
  def valid_input(input, array)
    input.to_i <= array.length && input.to_i > 0
  end
end
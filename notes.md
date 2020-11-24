1) Flow
    User starts app
    User is presented with a greeting and asked for two inputs (state, city)
    New scraper is created with user input which collects data and creates category and restaurant objects
    User is presented with a list of restaurant categories
    User selects a category
    User is given a list of restaurants in that category
    User selects a restaurant
    User is given details for that restaurant (name, location, phone number, description)
    User is asked if they are done or if they want to start over. If done - exit, if start over - begin program again.

2) Classes    
    a. CLI - Interacts with user
        # responsible for user interface
        # gets user input for URL to scrape
        # returns list of available restaurant categories
        # gets user choice of category
        # returns list of restaurants in that category
        # gets user choice of restaurant
        # returns details for that restaurant (name, address, phone number, description, url?)
        # asks if user would like to start over, or else exit
    b. Restaurant - Stores data re: individual restaurants
        # responsible for storing data re: individual restaurants
        # restaurants belong to one category
        # should track restaurant objects by category
    c. Category - Stores category objects; knows about restaurants in each category
        # responsible for finding and returning all available restaurant categories in the user's provided location
        # category has many restaurants
        # should know of all category objects with no duplicates
        # should know of all restaurants in each category
    d. Scraper - Collects data from the website
        # responsible for scraping restaurantji.com for info on local restaurants offering takout or delivery
        # gets input from user for URL to scrape: https://restaurantji.com/#{state}/#{city}
        # scrapes URL for available restaurant categories
        # scrapes URL for restaurants in chosen category
require_relative "./takeout_finder/version"
require_relative "./takeout_finder/cli"
require_relative "./takeout_finder/restaurant"
require_relative "./takeout_finder/category"
require_relative "./takeout_finder/scraper"

require 'pry'
require 'colorize'

module TakeoutFinder
  class Error < StandardError; end
  # Your code goes here...
end

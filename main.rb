require 'nokogiri'
require 'open-uri'
require "./classes/sweet.rb"
require "./classes/category.rb"
require "./parsers/sweets_parser.rb"
require "./parsers/categories_parser.rb"

SWEETS_URL = 'https://www.chocolate.lviv.ua/uk/shop/candies/'
@@sweets_collection = []
@@categories_collection = []

sweetParser = SweetsParser.new(SWEETS_URL)
sweetParser.read_and_save
sweetParser.save_to_csv(File.join(File.dirname(__FILE__), "sweets.csv"))
sweetParser.save_to_json(File.join(File.dirname(__FILE__), "sweets.json"))
sweetParser.save_to_yml(File.join(File.dirname(__FILE__), "sweets.yaml"))


categoriesParser = CategoriesParser.new(SWEETS_URL)
categoriesParser.read_and_save
categoriesParser.save_to_csv(File.join(File.dirname(__FILE__), "categories.csv"))
categoriesParser.save_to_json(File.join(File.dirname(__FILE__), "categories.json"))
categoriesParser.save_to_yml(File.join(File.dirname(__FILE__), "categories.yaml"))






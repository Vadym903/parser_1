require 'nokogiri'
require 'open-uri'
require "./classes/sweet.rb"
require "./classes/category.rb"
require "./parsers/sweets_parser.rb"
require "./parsers/categories_parser.rb"

SWEETS_URL = 'https://www.chocolate.lviv.ua/uk/shop/candies/'
@@sweets_collection = []
@@categories_collection = []

SweetsParser.new(SWEETS_URL).read_and_save
CategoriesParser.new(SWEETS_URL).read_and_save






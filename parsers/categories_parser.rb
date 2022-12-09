require 'csv'

class CategoriesParser
    @@categories_collection = []

    def initialize(url)
        @url = url
    end
    

    def read_and_save()
        html = open(@url)
        doc = Nokogiri::HTML(html)
        doc.css('.wrFilterList .filterItem').each do |item|
            category = Category.new()
            category.id = item['curid']
            category.name = item.text
            @@categories_collection.push(category)
            p category.name
        end
        save_to_file
    end

    def save_to_file
        path = './files/categories.csv'
        File.new(path, "w")
            CSV.open(path, 'w', headers: ['Id', 'Name'], write_headers: true) do |csv|
                @@categories_collection.each do |category|
                    csv << [
                        category.id, 
                        category.name, 
                    ]
                end
            end
    end
end
require "terminal-table"

def list_products(products)
  table = Terminal::Table.new do |t|
    t.title = "Products"
    t.headings = ["ID", "Name", "Description", "Price", "Quantity"]
    products.each do |product|
      t << [product[:id], product[:name], product[:description], product[:price], product[:quantity]]
    end
  end
  puts table
end

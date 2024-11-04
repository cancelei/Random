require 'terminal-table'
require_relative '../../services/product_service'

def list_products
  table = Terminal::Table.new do |t|
    t.headings = ['ID', 'Name', 'Price', 'Quantity']
    t.rows = []
    
    ProductService.available_products.each do |product|
      t << [product[:id], product[:name], product[:price], product[:quantity]]
    end
  end

  puts table
  puts "\nPress Enter to continue..."
  gets
end

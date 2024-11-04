require 'terminal-table'
require_relative '../../services/product_service'

def list_products
  table = Terminal::Table.new do |t|
    t.headings = ['ID', 'Name', 'Description', 'Price', 'Quantity']
    t.rows = []
    
    products = ProductService.available_products
    if products.empty?
      t << ['No products found', '', '', '', '']
    else
      products.each do |product|
        t << [
          product.id,
          product.name,
          product.description,
          product.price,
          product.quantity
        ]
      end
    end
  end

  puts table
  puts "\nPress Enter to continue..."
  gets
end

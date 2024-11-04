require 'json'
require_relative 'infraestrutura/json_repository'
require_relative 'models/product'
require_relative 'services/product_service'
require_relative 'display/menu'

# Add some sample products
ProductService.add_product(Product.new(id: 1, name: "Product 1", description: "Description 1", price: 10, quantity: 100))
ProductService.add_product(Product.new(id: 2, name: "Product 2", description: "Description 2", price: 20, quantity: 200))

menu = Menu.new
menu.display_menu

require_relative 'display/menu'

menu = Menu.new
menu.display_menu

ProductService.add_product(Product.new(id: 1, name: "Product 1", description: "Description 1", price: 10, quantity: 100))
ProductService.add_product(Product.new(id: 2, name: "Product 2", description: "Description 2", price: 20, quantity: 200))
ProductService.add_product(Product.new(id: 3, name: "Product 3", description: "Description 3", price: 30, quantity: 300))
ProductService.add_product(Product.new(id: 4, name: "Product 4", description: "Description 4", price: 40, quantity: 400))
ProductService.add_product(Product.new(id: 5, name: "Product 5", description: "Description 5", price: 50, quantity: 500))
ProductService.add_product(Product.new(id: 6, name: "Product 6", description: "Description 6", price: 60, quantity: 600))


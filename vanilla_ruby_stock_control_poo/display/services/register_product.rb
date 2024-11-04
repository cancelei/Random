require_relative '../../services/product_service'
require_relative '../../models/product'

def register_product
  clear_screen
  puts "=== Register New Product ==="
  
  print "Product Name: "
  name = gets.chomp
  
  print "Product Description: "
  description = gets.chomp
  
  print "Product Price: "
  price = gets.chomp.to_f
  
  print "Product Quantity: "
  quantity = gets.chomp.to_i

  next_id = ProductService.next_available_id
  
  product = {
    'id' => next_id,
    'name' => name,
    'description' => description,
    'price' => price,
    'quantity' => quantity
  }
  
  if ProductService.add_product(product)
    message_green("Product registered successfully!")
  else
    message_red("Error registering product!")
  end
end

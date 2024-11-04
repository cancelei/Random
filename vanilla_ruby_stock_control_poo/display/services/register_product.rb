require_relative '../../services/product_service'

def register_product
  clear_screen
  puts "=== Register New Product ==="
  print "Product Name: "
  name = gets.chomp
  
  print "Product Price: "
  price = gets.chomp.to_f
  
  print "Product Quantity: "
  quantity = gets.chomp.to_i

  # Use ProductService to get next ID and register product
  next_id = ProductService.next_available_id
  
  product = {
    id: next_id,
    name: name,
    price: price,
    quantity: quantity
  }
  
  ProductService.add_product(product)
  message_green("Product registered successfully!")
end

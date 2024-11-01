def register_product(products)
  message_yellow("Initialize new product", true, true, 0.5)
  message_blue("Enter the product name:", false, false)
  name = gets.chomp

  clear_screen

  message("Product #{color_green(name)} added successfully", true, true, 0.5)

  message_blue("Product description (#{color_green(name)}):", false, false)
  description = gets.chomp

  message_green("Product description added successfully", true, true, 0.5)

  message_blue("Product price (#{color_green(name)}):", false, false)
  price = gets.chomp

  message_green("Product price added successfully", true, true, 0.5)

  message_blue("Product quantity (#{color_green(name)}):", false, false)
  quantity = gets.chomp

  message_green("Product quantity added successfully", true, true, 0.5)

  next_id = products.empty? ? 1 : products.max_by { |p| p[:id] }[:id] + 1
  products << { id: next_id, name: name, description: description, price: price, quantity: quantity }

  list_products(products)

  message("Product #{color_green(name)} added successfully", true, true, 3.5)

  clear_screen
end

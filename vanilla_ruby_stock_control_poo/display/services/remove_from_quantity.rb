def remove_from_quantity
  list_products
  message_blue("Enter the product id to remove from quantity:", false, false)
  id = gets.chomp.to_i

  product = ProductService.available_products.find { |p| p.id == id }
  return message_red("Product #{color_red(id)} not found", true, true, 2.5) if product.nil?

  message_blue("Enter the quantity to remove:", false, false)
  quantity = gets.chomp.to_i
  return message_red("Invalid quantity. Please enter a number greater than 0", true, true, 2.5) if quantity <= 0

  return message_red("Quantity #{color_red(quantity)} is greater than the available quantity", true, true, 2.5) if quantity > product.quantity

  product.quantity -= quantity
  
  if product.quantity < 0
    message_red("Cannot remove more than available quantity", true, true, 2.5)
    product.quantity += quantity
    return
  end

  message_green("Product #{color_green(id)} quantity removed successfully", true, true, 2.5)
  list_products
end

def remove_product
  list_products
  message_blue("Enter the product id to remove:", false, false)
  id = gets.chomp.to_i

  product_to_remove = ProductService.available_products.find { |product| product.id == id }

  if product_to_remove.nil?
    message_red("Product #{color_red(id)} not found", true, true, 2.5)
    return
  end

  if product_to_remove.quantity == 0
    message_yellow("Product quantity is 0. Would you like to remove it? (y/n)", false, false)
    answer = gets.chomp.downcase

    if answer == 'y'
      ProductService.available_products.delete(product_to_remove)
      message_green("Product #{color_green(id)} removed successfully", true, true, 2.5)
    else
      message_yellow("Operation cancelled", true, true, 2.5)
      return
    end
  else
    ProductService.available_products.delete(product_to_remove)
    message_green("Product #{color_green(id)} removed successfully", true, true, 2.5)
  end

  list_products
end

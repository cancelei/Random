require_relative '../../services/product_service'

def remove_product
  list_products
  print "\nEnter the product id to remove:\n\n"
  id = gets.chomp.to_i

  product_to_remove = ProductService.available_products.find { |product| product.id == id }

  if product_to_remove
    if ProductService.remove_product(id)
      message_green("Product removed successfully!")
    else
      message_red("Error removing product!")
    end
  else
    message_red("Product not found!")
  end
end

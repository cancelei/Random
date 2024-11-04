require_relative '../models/product'
require_relative '../infraestrutura/json_repository'

class ProductService
  PRODUCTS_FILE = 'data/products.json'

  class << self
    def available_products
      @products ||= load_products
    end

    def next_available_id
      return 1 if available_products.empty?
      max_id = available_products.map { |p| p.is_a?(Product) ? p.id : p['id'] }.max || 0
      max_id + 1
    end

    def add_product(product_data)
      @products ||= []
      product = if product_data.is_a?(Hash)
        Product.new(
          id: product_data['id'],
          name: product_data['name'],
          description: product_data['description'],
          price: product_data['price'],
          quantity: product_data['quantity']
        )
      else
        product_data
      end
      
      available_products << product
      save_products
      true
    end

    def remove_product(product_id)
      @products ||= load_products
      product = @products.find { |p| p.id == product_id }
      return false unless product

      @products.delete(product)
      save_products
      true
    rescue => e
      puts "Error removing product: #{e.message}"
      false
    end

    private

    def load_products
      data = JsonRepository.read(PRODUCTS_FILE) || []
      return [] if data.empty?
      
      data.map do |product_data|
        Product.new(
          id: product_data['id'],
          name: product_data['name'],
          description: product_data['description'],
          price: product_data['price'],
          quantity: product_data['quantity']
        )
      end
    rescue => e
      puts "Error loading products: #{e.message}"
      []
    end

    def save_products
      data = available_products.map do |product|
        {
          'id' => product.id,
          'name' => product.name,
          'description' => product.description,
          'price' => product.price,
          'quantity' => product.quantity
        }
      end
      JsonRepository.write(PRODUCTS_FILE, data)
    rescue => e
      puts "Error saving products: #{e.message}"
      false
    end
  end
end

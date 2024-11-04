class ProductService
  class << self
    def available_products
      @products ||= []
    end

    def next_available_id
      available_products.empty? ? 1 : available_products.max_by { |p| p[:id] }[:id] + 1
    end

    def add_product(product)
      available_products << product
    end
  end
end

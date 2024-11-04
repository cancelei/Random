class Product
    attr_accessor :id, :name, :quantity, :price, :description

    def initialize(product_data)
        self.id = product_data[:id]
        self.name = product_data[:name]
        self.description = product_data[:description]
        self.price = product_data[:price]
        self.quantity = product_data[:quantity]
    end
end
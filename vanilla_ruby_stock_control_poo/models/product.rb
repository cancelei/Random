class Product
    attr_accessor :id, :name, :description, :price, :quantity
  
    def initialize(id:, name:, description:, price:, quantity:)
      @id = id
      @name = name
      @description = description
      @price = price
      @quantity = quantity
    end
  end
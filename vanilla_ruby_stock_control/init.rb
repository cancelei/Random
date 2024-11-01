require_relative "./display/menu"
require_relative "./display/display_operations"
require_relative "./core/register_product"
require_relative "./core/list_products"
require_relative "./core/remove_product"
require_relative "./core/remove_from_quantity"

#with seed data for faster manual testing capabilities.
products = [
    { id: 1, name: "Product 1", description: "Description 1", price: 10, quantity: 100 },
    { id: 2, name: "Product 2", description: "Description 2", price: 20, quantity: 200 },
    { id: 3, name: "Product 3", description: "Description 3", price: 30, quantity: 300 },
    { id: 4, name: "Product 4", description: "Description 4", price: 40, quantity: 400 },
    { id: 5, name: "Product 5", description: "Description 5", price: 50, quantity: 500 },
    { id: 6, name: "Product 6", description: "Description 6", price: 60, quantity: 600 }
]


display_menu(products)

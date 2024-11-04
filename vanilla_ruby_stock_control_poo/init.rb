require 'json'
require_relative 'infraestrutura/json_repository'
require_relative 'models/product'
require_relative 'services/product_service'
require_relative 'display/menu'

menu = Menu.new
menu.display_menu

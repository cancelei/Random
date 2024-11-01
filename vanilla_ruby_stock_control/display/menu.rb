def display_menu(products = [])
  clear_screen
  loop do 
    puts message_yellow("======== Welcome to the Stock Control System ========", false, false)
    puts message_blue("1. #{color_green("Add a new item")}", false, false)
    puts message_blue("2. #{color_green("Remove an item")}", false, false)
    puts message_blue("3. #{color_green("List all items")}", false, false)
    puts message_blue("4. #{color_green("Remove from quantity")}", false, false)
    puts message_blue("5. #{color_green("Exit")}", false, false)

    print "Enter your choice: "
    choice = gets.chomp.to_i

    case choice
    when 1
      register_product(products)
    when 2
      remove_product(products)
    when 3
      list_products(products)
    when 4
      remove_from_quantity(products)
    when 5
      exit
    else
      message_red("Invalid choice. Please try again.", true, true, 2.5)
    end
  end
end

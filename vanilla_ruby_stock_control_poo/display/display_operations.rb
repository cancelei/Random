module DisplayOperations
  def clear_screen
    if RUBY_PLATFORM =~ /win32|win64|\.NET|windows|cygwin|mingw32/i
      system("cls")
    else
      system("clear")
    end
  end

  def message(message, use_clear_screen=true, use_timer=true, timer=5)
    clear_screen if use_clear_screen
    puts message
    sleep(timer) if use_timer
    clear_screen if use_clear_screen
  end

  def message_green(message, use_clear_screen=true, use_timer=true, timer=5)
    message = color_green(message)
    puts message(message, use_clear_screen, use_timer, timer)
  end

  def message_red(message, use_clear_screen=true, use_timer=true, timer=5)
    message = color_red(message)
    puts message(message, use_clear_screen, use_timer, timer)
  end

  def message_yellow(message, use_clear_screen=true, use_timer=true, timer=5)
    message = color_yellow(message)
    puts message(message, use_clear_screen, use_timer, timer)
  end

  def message_blue(message, use_clear_screen=true, use_timer=true, timer=5)
    message = color_blue(message)
    puts message(message, use_clear_screen, use_timer, timer)
  end

  def color_green(text)
    "\e[32m#{text}\e[0m"
  end

  def color_red(text)
    "\e[31m#{text}\e[0m"
  end

  def color_yellow(text)
    "\e[33m#{text}\e[0m"
  end

  def color_blue(text)
    "\e[34m#{text}\e[0m"
  end
end

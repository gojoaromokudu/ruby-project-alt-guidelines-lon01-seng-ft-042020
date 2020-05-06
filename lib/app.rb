require "tty-prompt"
class RestaurantApp
    def run
        welcome
        login
        main_menu
    end

    def welcome
        puts "Welcome to our app..."
        sleep(3)
        puts "...You are a restaurant..."
        sleep(2)
    end

    def login
        prompt = TTY::Prompt.new
        restaurant_name = prompt.ask('What is the name of your restaurant?')
        # => What is the name of your restaurant? (gbenga)
        user_name = prompt.ask('...and what can I call you?', default: ENV['USER'])
        sleep(1)
        puts "Thanks, #{user_name} - you are now signed in on behalf of #{restaurant_name}."
        #=> Thanks, user_name - you are now signed in on behalf of restaurant_name.
    end

    def main_menu
        prompt = TTY::Prompt.new
        choices = [
        {name: 'Bookings', value: 1},
        {name: 'Waiters', value: 2},
        {name: 'Hosts', value: 3},
        {name: 'Logout', value: 4}
        ]
      
        puts "This is the Main Menu"
        user_input = prompt.select("Which area would you like to explore?", choices)
        
        case user_input
        when 1
          puts "Let's go to the Booking Menu"
          booking_menu
        when 2
          puts "Let's go to the Waiter Menu"
          waiter_menu
        when 3
          puts "Let's go to the Host Menu"
          host_menu
        when 4
            logout
            sleep (2)
        end
    end

    def booking_menu
        prompt = TTY::Prompt.new
        choices = [
        {name: 'Assign Waiter', value: 1},
        {name: 'Change Waiter', value: 2},
        {name: 'Cancel Booking', value: 3},
        {name: 'View Total', value: 4},
        {name: 'Back to Main Menu', value: 5}
        ]
      
        puts "This is the Booking Menu"
        user_input = prompt.select("What would you like to do?", choices)
        
        case user_input
        when 1
          puts "Let's Assign a waiter"
          #assign_waiter
        when 2
            puts "Let's change the waiter for this booking"
           # change_waiter
        when 3
            puts "Let's cancel this booking"
           # cancel_booking
        when 4
            puts "Let's view the total for this booking"
           # show_total
        when 5
          puts "Going back to the Main Menu"
          main_menu
        end
    end

    def waiter_menu

    end

    def host_menu
    
    end

    def logout

    end
end
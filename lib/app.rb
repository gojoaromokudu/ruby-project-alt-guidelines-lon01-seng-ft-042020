require "tty-prompt"
require "pry"
class RestaurantApp
    def run
        readme
        welcome
        login
        main_menu
    end

    def readme
        puts ""
        puts ""
        puts ""
        puts ""
        puts ""
        puts ""
        puts "Welcome to GBD’s Booking Agent - Where the booking manages itself!
        Create your waiter profiles and have our expert algorithms allocate your waiters to a booking based on which host they will perform best with.
        Organise your bookings and update details of your hosts. 
        Have a database to store all your previous hosts data to make their next visit run smoother."
        puts ""
        puts ""
        puts ""
        puts ""
        puts ""
        puts ""
        puts ""
        puts ""
        puts ""
        puts "" 
        puts ""
        puts "**Coming soon:**
        - Hosts will be able to create a user account, upload their contact details to have an open line of communication with the restaurant and update or cancel their bookings
        - Waiter allocations will be more precise based of information provided by the host (i.e. out time, specific allergies, etc)
        - Use our analytics to to find out which waiters are meeting targets and which are performing below expectations
        - Create rota’s for waiters based on given constraints"
        puts ""
        puts ""
        puts ""
        puts ""
    end

    def welcome
        prompt = TTY::Prompt.new
        prompt.ok("Welcome to GBD’s Booking Agent - Where the booking manages itself!")

        prompt.keypress("Press any key to continue")
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
####### MAIN MENU 
    def booking_menu
        prompt = TTY::Prompt.new
        choices = [
        {name: 'Create Booking', value: 1},
        {name: 'View Booking Details', value: 2},
        {name: 'Assign Waiter', value: 3},
        {name: 'Change Waiter', value: 4},
        {name: 'Cancel Booking', value: 5},
        {name: 'View Total', value: 6},
        {name: 'Back to Main Menu', value: 7}
        ]
      
        puts "This is the Booking Menu"
        user_input = prompt.select("What would you like to do?", choices)
        
        case user_input
        when 1
            puts "Let's create a booking"
            create_booking_menu
        when 2
            puts "Let's view booking details"
            view_booking_menu
        when 3
            puts "Let's Assign a waiter"
            assign_waiter_menu
        when 4
            puts "Let's change the waiter for this booking"
            change_waiter_menu
        when 5
            puts "Let's cancel this booking"
           cancel_booking_menu
        when 6
            puts "Let's view the total for this booking"
           show_payment_menu
        when 7
          puts "Going back to the Main Menu"
          main_menu
        end
    end

    def waiter_menu
        prompt = TTY::Prompt.new
        choices = [
        {name: 'View All Waiters', value: 1},
        {name: 'Hire Waiter', value: 2},
        {name: 'Fire Waiter', value: 3},
        {name: 'Back to Main Menu', value: 4}
        ]
      
        puts "This is the Waiter Menu"
        user_input = prompt.select("What would you like to do?", choices)
        
        case user_input
            
        when 1
            puts "Let's see all the waiters"
            view_all_waiters_menu
        when 2
            puts "Let's hire a waiter"
            hire_waiter_menu
        when 3
            puts "Let's fire a waiter"
            fire_waiter_menu
        when 4
          puts "Going back to the Main Menu"
          main_menu
        end
    end
    
    def host_menu
        prompt = TTY::Prompt.new
        choices = [
        {name: 'View All Hosts', value: 1},
        {name: 'Back to Main Menu', value: 2}
        ]
      
        puts "This is the Host Menu"
        user_input = prompt.select("What would you like to do?", choices)
        
        case user_input
        when 1
            puts "Let's view all hosts"
            view_all_hosts_menu
        when 2
          puts "Going back to the Main Menu"
          main_menu
        end
    end
##### END OF MAIN MENU

##### BOOKING MENU
    def create_booking_menu
        prompt = TTY::Prompt.new
        puts "You can create a new booking here"
        #this will only create a new host if none already exists with these exact details
        host_name_for_booking = prompt.ask("Who's the booking for? Please state the name of the host:")
        # => Who's booking for?
        host_group_size_for_booking = prompt.ask("How many people? Please state the total number of guests inclduing the host:")
        # => How many people?
        host_allergies_for_booking = prompt.ask("Any allergies? Please state them with a comma between each one:")
        # => Any allergies?
        days_choices = ["Mon","Tues","Weds","Thurs","Fri","Sat"]
        day_for_booking = prompt.select("What day of the week? Please choose from our available days:", days_choices)
        # => Any allergies?

        host_for_booking = Host.create_host(name:host_name_for_booking, group_size:host_group_size_for_booking,allergies:host_allergies_for_booking)
        puts "A new host profile has been created for #{host_for_booking.name}."
        prompt.keypress("Press any key to continue")
        host_for_booking.create_booking(day_for_booking)
        prompt.keypress("Press any key to continue")
        puts "Done!"
        prompt.keypress("Press any key to continue")
        puts "Going back to the Booking menu"
        sleep (2)
        booking_menu
    end

    def view_booking_menu
        prompt = TTY::Prompt.new
        puts "You can view booking details here"
        host_name_for_booking = prompt.ask("Who's booking would you like to see details for? Please state the name of the host:")
        # => Who's booking to see details for?
        host_to_show_details_for = Host.find_by(name: host_name_for_booking)
        if host_to_show_details_for
            booking_to_show_details_for = Booking.find_by(host_id:host_to_show_details_for.id)
            booking_to_show_details_for.booking_details
            puts "Done!"
            prompt.keypress("Press any key to continue")
            puts "Going back to the Booking menu"
            sleep (2)
            booking_menu
        else
            prompt.warn( "This person doesn't have a booking yet You can create one in the Create Booking menu.")
            prompt.keypress("Press any key to continue")            
            view_booking_menu
        end
    end

    def assign_waiter_menu
        prompt = TTY::Prompt.new
        puts "You can assign a waiter here"
        host_name_for_booking = prompt.ask("Who's booking would you like to assign a waiter to? Please state the name of the host:")
        # => Who's booking would you like to assign a waiter to?
        host_to_be_assigned_waiter = Host.find_by(name: host_name_for_booking)
        booking_to_be_assigned_waiter = Booking.find_by(host_id:host_to_be_assigned_waiter.id)
        booking_to_be_assigned_waiter.assign_waiter
        puts "Done!"
        prompt.keypress("Press any key to continue")
        puts "Going back to the Booking menu"
        sleep (2)
        booking_menu
    end

    def change_waiter_menu
        prompt = TTY::Prompt.new
        puts "You can change a waiter for a booking here"
        host_name_for_booking = prompt.ask("Who's booking would you like to change a waiter for? Please state the name of the host:")
        # => Who's booking would you like to change a waiter for?
        #doenst check if host exists
        host_to_change_waiter = Host.find_by(name: host_name_for_booking)
        #can be shortened
        #doenst check if booking exists
        booking_to_change_waiter = Booking.find_by(host_id:host_to_change_waiter.id)

        new_waiter = prompt.ask("Who would you like the new waiter to be? Please state the name of the waiter:")
        if Waiter.find_by(name: new_waiter)
            booking_to_change_waiter.change_waiter_by_name(new_waiter)
            puts "Done!"
            prompt.keypress("Press any key to continue")
            puts "Going back to the Booking menu"
            sleep (2)
            booking_menu
        else
            prompt.warn( "This waiter doesn't work for us, please try another waiter.")
            prompt.keypress("Press any key to continue")            
            change_waiter_menu
        end
    end

    def cancel_booking_menu
        prompt = TTY::Prompt.new
        puts "You can cancel a booking here"
        host_name_for_booking = prompt.ask("Who's booking would you like to cancel? Please state the name of the host:")
        # => Who's booking would you like to cancel?
        host_to_cancel_booking = Host.find_by(name: host_name_for_booking)
        #can be shortened
        if host_to_cancel_booking
            booking_to_cancel = Booking.find_by(host_id:host_to_cancel_booking.id)
            booking_to_cancel.cancel_booking
            puts "Done!"
            puts "Going back to the Booking menu"
            sleep (2)
            booking_menu
        else
            prompt.error( "This Booking doesn't exist.")
            prompt.warn( "Please try a different name")
            cancel_booking_menu
        end
    end

    def show_payment_menu
        prompt = TTY::Prompt.new
        puts "You can see a reciept for a particular booking here"
        host_name_for_booking = prompt.ask("Who's booking would you like to see a reciept for? Please state the name of the host:")
        # => Who's booking would you like to see a reciept for?
        host_to_find_booking_for = Host.find_by(name: host_name_for_booking)
        #can be shortened
        booking_to_find_reciept_for = Booking.find_by(host_id:host_to_find_booking_for.id)
        booking_to_find_reciept_for.show_total
        booking_to_find_reciept_for.show_reciept
        puts "Done!"
        prompt.keypress("Press any key to continue")
        puts "Going back to the Booking menu"
        sleep (2)
        booking_menu
    end
 ######END OF BOOKING MENU

 ###### WAITER MENU
    def view_all_waiters_menu
        prompt = TTY::Prompt.new
        puts "You can view all waiters here"
        sleep(2)
        Waiter.all.map do |waiter| 
            puts "#{waiter.name} has the selling style: #{waiter.selling_style}, and a section capacity of #{waiter.capacity}."
        end
        puts "Done!"
        prompt.keypress("Press any key to continue")
        puts "Going back to the Waiter menu"
        waiter_menu
    end
 
    def hire_waiter_menu
        prompt = TTY::Prompt.new
        selling_styles = ["knowledgeable","attention to detail","pushy"]

        puts "You can hire a new waiter here"
        new_waiter_name = prompt.ask("Who would you like to hire? Please state their name:")
        # => Who would you like to hire?
        new_waiter_selling_style = prompt.select("What is their selling style? Please choose from options below", selling_styles)
        # => What is their selling style?
        puts "Final question - how many customers can they manage at once?"
        sleep(1)
        new_waiter_capacity = prompt.slider('Capacity',min: 10, max: 40, step: 5, default: 10)
        Waiter.hire_waiter(name: new_waiter_name,selling_style: new_waiter_selling_style,capacity: new_waiter_capacity)
        puts "Done!"
        prompt.keypress("Press any key to continue")
        puts "Going back to the Waiter menu"
        sleep (2)
        waiter_menu
    end

    def fire_waiter_menu
        prompt = TTY::Prompt.new
        puts "You can fire a waiter here"

        waiter_to_be_fired_name = prompt.ask("Who would you like to fire? Please state their name:")
        # => Who would you like to fire?
        waiter_to_be_fired = Waiter.find_by(name: waiter_to_be_fired_name)
        if waiter_to_be_fired
        waiter_to_be_fired.fire_waiter
        puts "Done!"
        prompt.keypress("Press any key to continue")
        puts "Going back to the Waiter menu"
        sleep (2)
        waiter_menu
        else
            prompt.error( "This waiter doesn't work here.")
            prompt.warn( "Please try a different waiter... going back to Fire Waiter Menu")
            fire_waiter_menu
        end
    end
 ###### END OF WAITER MENU
 
 ###### HOST MENU
    def view_all_hosts_menu
        prompt = TTY::Prompt.new
        puts "You can view all hosts here"
        sleep(2)
        Host.all.map do |host| 
            if !host.allergies
                puts "#{host.name} has a group of #{host.group_size} people and no allergies."
            else
                puts "#{host.name} has a group of #{host.group_size} people and the following allergies: #{host.allergies}."
            end
        end

        puts "Done!"
        prompt.keypress("Press any key to return to the Host menu")
        puts "Returning to the Host menu"
        sleep (2)
        host_menu
    end

 ####### END OF HOST MENU
 def logout

    end
end
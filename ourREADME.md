##Welcome to GBD’s Booking Agent - Where the booking manages itself!
Create your waiter profiles and have our expert algorithms allocate your waiters to a booking based on which host they will perform best with.
Organize your bookings and update details of your hosts. 
Have a database to store all your previous hosts data to make their next visit run smoother.

You are just a few steps away from from having this world of booking management at your fingertips. 
**Follow our installation guidelines & you will be organising your bookings in no time:** 
1. Copy *git@github.com:gojoaromokudu/ruby-project-alt-guidelines-lon01-seng-ft-042020.git* 
2. Clone this repository into your preferred text editor we recommend using the SSH key
3. Once this has been downloaded type *bundle install* to install the required gems 

You can now run the app by typing *ruby bin/run.rb*

Upon running the app, The user is given a welcome message followed by a log-in option that allows a user to log-in on behalf of their restaurant
Once the user has logged-in, they are taken to the main menu which has the following options:
Bookings, Waiters, Hosts and log-out
Selecting one of these options allows the user to undertake various CRUD actions on these models, return to the main menu or log-out
In the Bookings section:
The user can create a new booking, read bookings details and view a total, update a booking by assigning or changing the waiter allocated to that booking and delete a booking due to a host cancellation
In the waiter section: The user can (create) hire a waiter or (delete) fire a waiter
In the host section: The user to can (read) all the hosts that have made bookings at the restaurant

**Coming soon:**
- Hosts will be able to create a user account, upload their contact details to have an open line of communication with the restaurant and update or cancel their bookings
- Waiter allocations will be more precise based of information provided by the host (i.e. out time, specific allergies, etc)
- Use our analytics to to find out which waiters are meeting targets and which are performing below expectations
- Create rota’s for waiters based on given constraints
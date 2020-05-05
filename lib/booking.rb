class Booking < ActiveRecord::Base
    belongs_to :host
    belongs_to :waiter

   #create booking 
   def create_booking()
   end
   
   
    #booking details - to the resturant
    
    #cancel_booking
    
    #update booking details #run change waiter (if necessary)
    
    #assign_waiter
    
    #change waiter
    
    #calculate total based on group size & waiter assignment
    #stats
end
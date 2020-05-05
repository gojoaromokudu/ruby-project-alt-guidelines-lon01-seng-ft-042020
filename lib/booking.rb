class Booking < ActiveRecord::Base
    belongs_to :host
    belongs_to :waiter

    #assigns waiter to booking based on selling style
    def assign_waiter
        #check if they have capacity
       waiter = Waiter.all.find{|w| w.selling_style == self.host.best_selling_style}
       self.update(waiter_id: waiter.id)
       waiter
    end

    #updates booking.waiter to a new waiter by name
    def change_waiter_by_name(new_waiter_name)
        new_waiter = Waiter.find_by(name: new_waiter_name)
        self.update(waiter_id: new_waiter.id )
        puts "#{self.host.name}'s waiter has been changed to #{new_waiter.name}."
        new_waiter
    end

    def update_booking

    end
    #booking details - to the resturant
    
    #cancel_booking
    
    #update booking details #run change waiter (if necessary)
    
    
    
    #change waiter
    
    #calculate total based on group size & waiter assignment
    #stats
end
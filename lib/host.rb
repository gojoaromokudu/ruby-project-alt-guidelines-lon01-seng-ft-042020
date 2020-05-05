class Host < ActiveRecord::Base 
    has_many :bookings

    #creates a booking for a specific day, and assigns a waiter to the booking
    def create_booking(day)
        new_booking = Booking.create(host_id: self.id,day: day)
        puts "A new booking has been created for #{self.name} on #{day}."
        new_booking.assign_waiter
        puts "#{new_booking.waiter.name} has been assigned to #{self.name}'s booking'."
    end

 #returns best selling style based on group size
    def best_selling_style
         style = nil
        if self.group_size <= 4
            style = "knowledgeable"
        elsif self.group_size >4 && self.group_size <= 8
            style = "attention to detail"
        elsif self.group_size > 8
            style ="pushy"
        end
        style
    end

  
end

#If group_size is between 0 - 4 assign a waiter that's "knowledgeble"  
#If group_size is between 5 - 8 assign a waiter that pays "attention to detail"
#If group_size is > 9 assign a waiter that's "pushy" 

#If avg_age > 30, assign a waiter that's "knowledgeble"
#If allergies are present, assign a waiter that pays "attention to detail"

#4 < self.group_size  <= 8


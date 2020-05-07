class Host < ActiveRecord::Base 
    has_many :bookings

    #checks if if a host already exists with these details, and if yes, return them. If no, create a new one
    def self.create_host(name:name, group_size:group_size,allergies:allergies)
        h = Host.find_or_create_by(name: name ,group_size:group_size ,allergies:allergies)
        puts "You've got a new host called #{h.name}!"
        h
    end
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

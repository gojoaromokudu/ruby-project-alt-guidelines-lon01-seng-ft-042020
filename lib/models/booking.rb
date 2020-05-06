class Booking < ActiveRecord::Base
    belongs_to :host
    belongs_to :waiter

    #assigns waiter to booking based on selling service_charge_percentage
    def assign_waiter
        #check if they have capacity
       waiter = Waiter.all.find{|w| w.selling_style == self.host.best_selling_style}
       self.update(waiter_id: waiter.id)
       waiter
    end

    #updates booking.waiter to a new waiter by name
    def change_waiter_by_name(new_waiter_name)
        old_waiter = self.waiter
        new_waiter = Waiter.find_by(name: new_waiter_name)
        self.update(waiter_id: new_waiter.id )
        puts "#{self.host.name}'s waiter has been changed from #{old_waiter.name} to #{new_waiter.name}."
        new_waiter
    end

    def cancel_booking
        self.destroy
        puts "This booking has been cancelled"
    end
    #booking details - to the resturant - Dorothy

    #update booking details #run change waiter (if necessary) - Dorothy
    
    #calculates subtotal for the booking
    def calculate_sub_total
        sub_total = self.host.group_size * 10
        #Dorothy - can you figure out a way to get the host from this booking, so
        #we can then do .group_size
        self.update(sub_total: sub_total)
        puts "The subtotal for this booking is £#{self.sub_total}."
    end

    #calculates service charge based on group size
    def calculate_service_charge
        service_charge_percentage = nil
        if self.host.group_size <= 4
            service_charge_percentage = 0
        elsif self.host.group_size >4 && self.group_size <= 8
            service_charge_percentage = 0.06
        elsif self.host.group_size > 8
            service_charge_percentage = 0.125
        end
        service_charge = service_charge_percentage * self.sub_total
        self.update(service_charge: service_charge)
        puts "The service charge for this booking is £#{self.service_charge}."
    end

    #adds subtotal to service charge
    def calculate_total
        total = self.sub_total + self.service_charge
        self.update(total: total)
        puts "The total for this booking is £#{self.total}."
    end

    def show_total
        calculate_sub_total
        calculate_service_charge
        calculate_total 
    end

    #Booking instance method returns a string detailing the booking details
    def booking_details
        if self.total
        p "#{self.host.name}'s booking for #{self.day} with a group size of #{self.host.group_size} was assigned to the waiter #{self.waiter.name}, their total spend for that meal was £#{self.total}, including a service fee of £#{self.service_charge}."
        else 
        p "#{self.host.name} has made a booking for #{self.day} with a group size of #{self.host.group_size}. They are assigned to the waiter #{self.waiter.name}."
        end    
    end

    #Booking instance method updates attribute values of the corresponding host object
    def update_host(value)
        if value.class == Integer
           self.host.update(group_size: value)
        elsif
            value.class == String  &&  value.capitalize != "Yes" && value.capitalize != "No" 
           self.host.update(name: value)
        elsif 
            value.capitalize == "Yes" || value.capitalize == "No" 
            self.host.update(allergies: value)  
        end
    end
end
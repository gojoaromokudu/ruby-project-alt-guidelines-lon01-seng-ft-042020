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
        new_waiter = Waiter.find_by(name: new_waiter_name)
        self.update(waiter_id: new_waiter.id )
        puts "#{self.host.name}'s waiter has been changed to #{new_waiter.name}."
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

    #Returns a string detailing a completed bookings details
    #In future create methods so we can find a host & waiter given a foreign key
    def booking_details
        "#{Host.all.find(self.host_id).name}'s booking for #{self.day} with a group size of #{Host.all.find(pself.host_id).group_size} was assigned to the waiter #{Waiter.all.find(self.waiter_id).name}, their total spend for that meal was £#{self.total}, including a service fee of £#{self.service_charge}."
    end

self.totalend
     en        end    elsebegin
        else
            p "#{find_host.name} has a booking for #{self.day} with a group size of #{find_host.group_size} they are assigned the waiter #{find_waiter.name}

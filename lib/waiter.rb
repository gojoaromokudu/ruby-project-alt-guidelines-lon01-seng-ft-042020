class Waiter < ActiveRecord::Base 
    has_many :bookings
    has_many :hosts, through: :bookings

    #hire waiter
    
    #fire waiter
end


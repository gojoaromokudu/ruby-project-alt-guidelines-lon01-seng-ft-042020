class Waiter < ActiveRecord::Base 
    has_many :bookings
    has_many :hosts, through: :bookings

    #hire waiter
    def self.hire_waiter(name:name, selling_style:selling_style,capacity:capacity)
        w = Waiter.create(name: name ,selling_style:selling_style ,capacity:capacity)
        puts "Congrats, you have hired #{w.name}!"
        w
    end

    #fire waiter
     def fire_waiter
        waiter_to_remove = Waiter.find_by(id: self.id)
        puts "Congrats, you have fired #{waiter_to_remove.name}!"
        waiter_to_remove.destroy
     end
end


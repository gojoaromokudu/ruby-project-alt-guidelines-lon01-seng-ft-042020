class Waiter < ActiveRecord::Base 
    has_many :bookings
    has_many :hosts, through: :bookings

    #creates a new Waiter instance, when passed attributes & returns confirmation message
    def self.hire_waiter(name:name, selling_style:selling_style,capacity:capacity)
        w = Waiter.create(name: name ,selling_style:selling_style ,capacity:capacity)
        puts "Congrats, you have hired #{w.name}!"
        w
    end
    #Instance mehtod fire waiter deletes the object & corresponding database row that the method is called upon
     #figure out how to only fire an employee
    def fire_waiter
        #if self.id
            waiter_to_remove = Waiter.find_by(id: self.id)
            puts "Congrats, you have fired #{waiter_to_remove.name}!"
            waiter_to_remove.destroy
        #else
        #    puts "This person is not an employee"
       # end
    end
end


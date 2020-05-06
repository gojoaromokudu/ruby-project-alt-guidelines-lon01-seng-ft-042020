
require_relative '../config/environment'
require_relative '../config/seed'

app = RestaurantApp.new
app.run


puts "Thanks for using our app"

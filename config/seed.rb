Waiter.destroy_all
Waiter.create(name:"Dorothy",selling_style: "attention to detail",capacity:20)
Waiter.create(name:"Gbenga",selling_style: "pushy",capacity:10)
Waiter.create(name:"Dan",selling_style: "knowledgeable",capacity:30)

Host.destroy_all
anderson = Host.create(name:"Anderson",group_size: 2,allergies:"Shellfish")
elena = Host.create(name:"Elena",group_size: 9)

Booking.destroy_all
random_day1 = ["Mon","Tues","Weds","Thurs","Fri","Sat"].sample
anderson.create_booking(random_day1)
random_day2 = ["Mon","Tues","Weds","Thurs","Fri","Sat"].sample
elena.create_booking(random_day2)

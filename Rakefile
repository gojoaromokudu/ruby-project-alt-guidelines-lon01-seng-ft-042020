require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
#To access data written in the seed file, we need access to access it from the database (i.e. via find_by)
  gbenga = Waiter.find_by(name: "Gbenga")
  dan = Waiter.find_by(name: "Dan")
  dorothy = Waiter.find_by(name: "Dorothy")

  elena = Host.find_by(name: "Elena")
  anderson = Host.find_by(name: "Anderson")
  binding.pry
end

desc 'runs some tests'
task :test do
  test_gbenga = Waiter.find_by(name: "Gbenga")
 puts "Testing if Gbenga exists: #{!test_gbenga.nil?} "
 test_dan = Waiter.find_by(name: "Dan")
 puts "Testing if Dan exists: #{!test_dan.nil?} "
 test_dorothy = Waiter.find_by(name: "Dorothy")
 puts "Testing if Dorothy exists: #{!test_dorothy.nil?} "
 test_elena = Host.find_by(name: "Elena")
 puts "Testing if Elena exists: #{!test_elena.nil?} "
 test_anderson = Host.find_by(name: "Anderson")
 puts "Testing if Anderson exists: #{!test_anderson.nil?} "
end


desc 'run pry'
task :testing do
  Pry.start
end
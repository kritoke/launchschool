# Do a while loop that takes input from the user, performs an action, and only stops when the user types "STOP"
answer = nil

while answer != "STOP" do
  puts "What is your name?"
  name = gets.chomp
  puts "Do you want to stop this?"
  answer = gets.chomp
end
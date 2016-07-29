# Asks for a name and then outputs a greeting with the name

puts "What is your name?"
name = gets.chomp
puts "Hello #{name}!"

# Addition in Exercise 3, print out the name 10 times

10.times do
  puts name
end

# Addition in Exercise 4, ask for first and last name and then output them

puts "What is your first name?"
first_name = gets.chomp
puts "What is your last name?"
last_name = gets.chomp
puts "Your full name is #{first_name} #{last_name}"

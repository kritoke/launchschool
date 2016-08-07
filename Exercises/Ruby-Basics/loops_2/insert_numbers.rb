# Modify the code below so that the user's input gets added to the numbers array. Stop the loop when the array contains 5 numbers.

numbers = []

until numbers.size == 5 do
  puts 'Enter any number:'
  input = gets.chomp.to_i
  numbers << input
end
puts numbers
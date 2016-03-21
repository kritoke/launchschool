# Checks to see if a number appears in the array.

arr = [1, 3, 5, 7, 9, 11]
number = 3

arr.each do |x|
  puts "#{number} exists in the array." if x == number
end

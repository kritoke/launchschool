# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

def stringy(integer)
  binary_string = []
  integer.times do |index|
    if index.even?
      binary_string << '1'
    else
      binary_string << '0'
    end
  end
  binary_string.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# Write a method that counts the number of occurrences of each element in a given array.

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

def count_occurrences(array)
  count_hash = array.each_with_object(Hash.new(0)) { |word, count| count[word] += 1 }
  count_hash.each { |key, value| puts "The word #{key} has been repeated #{value} times" }
end

count_occurrences(vehicles)

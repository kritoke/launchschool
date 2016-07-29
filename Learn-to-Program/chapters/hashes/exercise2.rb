# A program that uses both merge and merge! to illustrate the differences.

array1 = {key1: 222, key2: 333, key3: 444}
array2 = {key3: 4443, key4: 2323, key5: 4442}

array1.merge(array2)
puts "Merge without !:"
puts array1
puts array2

puts "Merge with !:"
array1.merge!(array2)
puts array1
puts array2
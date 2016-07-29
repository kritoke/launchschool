# A program that loops through a hash and prints all of the keys

pets = {rug: "cat", crowley: "cat", dante: "dog"}

pets.each_key {|key| puts key}

# A program that loops through a hash and prints all of the values

pets.each_value {|value| puts value}

# A program that loops through a hash and prints all of the keys and values

pets.each {|key, value| puts "#{key} is a #{value}"}
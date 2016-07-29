# a method to find out if a Hash contains a specific value in it

pets = {rug: "cat", crowley: "cat", dante: "dog"}

if pets.has_value?("cat")
  puts "It is in the hash"
else
  puts "It is not in the hash"
end
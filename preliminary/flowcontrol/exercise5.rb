# Takes a number from the user between 0 and 100 and reports back whether the number is between 0 and 50, 51 and 100, or above 100.

def num_compare(number)
  if number < 0 
    puts "Please no negative numbers" 
  elsif number <= 50
    puts "#{number} is between 0 and 50" 
  elsif number <= 100 
    puts "#{number} is between 51 and 100" 
  else 
    puts "#{number} is over 100" 
  end
end
  
def num_compare_case(number)
  case
  when number < 0
    puts "Please no negative numbers" 
  when number <= 50
    puts "#{number} is between 0 and 50"
  when number <= 100
    puts "#{number} is between 51 and 100"
  else
    puts "#{number} is above 100"
  end
end  
  
  
puts "Pick a number between 0 and 100"
number = gets.chomp.to_i
num_compare(number)
num_compare_case(number)
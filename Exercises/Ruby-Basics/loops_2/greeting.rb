# Use a while loop to print "Hello!" twice.

def greeting (number)
  count = 0
  while count < number
    puts 'Hello!'
    count += 1
  end
end

number_of_greetings = 2

greeting (number_of_greetings)
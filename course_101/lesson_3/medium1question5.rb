# Refactor the code to handle negative and zero entries without using begin/end/until

def factors(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

# Bonus 1
# It makes sure the number is still an integer when divided

# Bonus 2
# It tells the method what value it should return
# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

def repeat(phrase, number)
  count = 0
  until count == number
    puts phrase
    count += 1
  end
end

repeat('Hello', 3)
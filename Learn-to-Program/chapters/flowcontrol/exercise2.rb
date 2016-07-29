# Create a method that should return the all-caps version of the string, only if the string is longer than 10 characters with string as an argument.

def make_caps(phrase)
  return phrase.length > 10 ? phrase.upcase : phrase
end

puts make_caps("Hello World")
puts make_caps("Hello")
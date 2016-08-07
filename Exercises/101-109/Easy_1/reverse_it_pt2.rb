# Write a method that takes one argument, a string containing one or more words, and returns the given string with all five or more letter words reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

def reverse_words(phrase)
  word_array = phrase.split
  reversed_phrase = word_array.map { |x| x.size >= 5 ? x.reverse : x }
  reversed_phrase.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School') # => hcnuaL loohcS

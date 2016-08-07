# Write a method that takes one argument, a string, and returns the same string with the words in reverse order.

def reverse_sentence(phrase)
  word_array = phrase.split(' ')
  total_word_count = word_array.size - 1
  reverse_phrase = []
  while total_word_count >= 0
    reverse_phrase << word_array[total_word_count]
    total_word_count -= 1
  end
  reverse_phrase.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

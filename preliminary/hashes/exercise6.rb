# a program that prints out groups of words that are anagram

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
          
results = {}
          
words.each do |word| 
  key = word.split('').sort.join
  if results.has_key?(key)
    results[key].push(word)
  else
    results[key] = [word]
  end
end
          
results.each do |key, value|
  puts "--"
  p value
end
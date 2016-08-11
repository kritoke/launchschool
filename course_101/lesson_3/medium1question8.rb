# implement a titlize function similar to ruby on rails

phrase = "This is a sample phrase for capitalizing"

p phrase.split.map { |word| word.capitalize }.join(' ')
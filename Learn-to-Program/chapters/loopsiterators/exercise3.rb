# Use the each_with_index method to iterate through an array and then print each index and value of the array.

movies = ["matrix", "hackers", "dark city"]
movies.each_with_index {|movie,index| puts "#{movie}: #{index+1}"}
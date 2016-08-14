def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# My string looks like this now: pumpkins
# My array looks like this now: ["pumpkins", "rutabaga"]

# The reason why the string doesn't keep the original text is due to using += and that causes it to completely replace the text, but if << was used, it would have kept the original text like in the array's usage.
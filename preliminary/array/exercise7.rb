#  iterates over an array and builds a new array that is the result of incrementing each value in the original array by a value of 2.  Prints using p the results of both arrays

arr = [4, 5, 6, 7, 8]
new_arr = []

new_arr = arr.map {|x| x = x+2}

p arr
p new_arr

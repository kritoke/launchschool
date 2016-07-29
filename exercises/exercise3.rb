#iterate through the array, select only odd numbers

array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

array.select{ |a| a % 2 !=0 }
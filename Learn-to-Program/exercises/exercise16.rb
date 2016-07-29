# Split words in array into single words in the array

a = ['white snow', 'winter wonderland', 'melting ice', 'slippery sidewalk', 'salted roads', 'white trees']

a = a.map {|x| x.split(' ')}
a=a.flatten

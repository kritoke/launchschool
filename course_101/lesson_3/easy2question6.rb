# Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

def find_minimum_number(number_hash)
  smallest_number = number_hash.values[0]
  number_hash.each { |_, x| smallest_number > x ? smallest_number = x : x }
  p smallest_number
end

find_minimum_number(ages)

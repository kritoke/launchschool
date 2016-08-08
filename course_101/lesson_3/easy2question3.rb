# Throw out the really old people (age 100 or older) in the age hash.

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.keep_if {|_, age| age < 100 }

p ages

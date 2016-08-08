# Using array#map!, shorten each of these names to just 3 characters in one line

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |word| word.chars[0..2].join }
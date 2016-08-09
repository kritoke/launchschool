# Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"
letter_hash = {}

statement.delete(' ').chars.uniq.each { |x| letter_hash.store(x, statement.scan(x).count)}
p letter_hash
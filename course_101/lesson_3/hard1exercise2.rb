greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# the last line outputs {:a => "hi there"} because informal_greeting is referencing the a: from greetings, so it gets modified because they are the same object
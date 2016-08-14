# returns one UUID when called with no parameters.

def generate_uuid
  uuid = ''
  uuid << [*('a'..'f'), *('0'..'9')].sample(8).join << '-'
  3.times { uuid << [*('a'..'f'), *('0'..'9')].sample(4).join << '-' }
  uuid << [*('a'..'f'), *('0'..'9')].sample(12).join
end

puts generate_uuid

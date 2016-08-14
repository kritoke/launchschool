# Fix code, add a returning a false condition, and handle the case that there are more or fewer than 4 components to the IP address

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split('.')
  return false unless dot_separated_words.size == 4
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_a_number?(word)
  end
  true
end

dot_separated_ip_address?("192.168.1.5")
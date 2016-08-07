# Given the array below, use loop to remove and print each name. Stop the loop once names doesn't contain any more elements.

names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  if names.size > 0
    names.pop
    p names
  else
    break
  end
end
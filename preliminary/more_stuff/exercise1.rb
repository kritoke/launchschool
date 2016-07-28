# checks if the sequence of characters "lab" exists

def has_lab?(string)
  if string.downcase =~ /lab/
    puts "We have a match for #{string}!"
  else
    puts "No match here for #{string}."
  end
end

has_lab?("laboratory")
has_lab?("experiment")
has_lab?("Pans Labyrinth")
has_lab?("elaborate")
has_lab?("polar bear")


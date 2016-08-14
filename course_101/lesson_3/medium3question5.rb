# remove duplication in the method

def color_valid(color)
  color == "blue" || color == "green"
end

# Ruby already evaluates the == statement as true or false, so no need to explicitly return them
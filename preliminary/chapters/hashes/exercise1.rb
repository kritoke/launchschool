# Using the select method gather only immediate family members' names into a new array.

family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }
          
immediate_fam = family.select do |k,v|  
  k == :sisters || k == :brothers 
end

family_array = immediate_fam.values.flatten

p family_array
# add age_group to the munsters hash

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, bio|
  case bio["age"]
    when 0..17
      bio["age_group"] = "kid"
    when 18..64
      bio["age_group"] = "adult"
    else
      bio["age_group"] = "senior"
  end
end
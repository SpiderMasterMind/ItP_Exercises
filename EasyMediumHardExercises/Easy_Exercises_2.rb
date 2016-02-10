# Q1 check to see if Spot is in teh hash below
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.key?("Spot")
ages.member?("Spot")
ages.include?("Spot")
# Q2 add up all teh ages form the Munster hash
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages.each_value.inject(0) {|result, age| result + age} # or
ages.values.inject(:+)

# Q3 get rid of the people older than 100
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.keep_if {|name, age| age < 100} # or delete_if > 100
p ages

# Q4 convert the description
description = "The Munsters are creepy in a good way."
description.capitalize!
description.swapcase!
description.downcase!
description.upcase!

# Q5 merge the two hashes
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)
p ages

# Q6 return lowest age from values in hash
age.values.min

# Q7 Find the word "Dino" in the string
advice = "Few things in life are as important as house training your pet dinosaur."
advice.match("Dino")

# Q8 Find the index of the element containing "Be" in the following:
flintstones = %w(Fred Wilma Betty Barney)
flintstones.index {|name| name[0, 2] == "Be"}

# Q9 & Q10 shorten flintstones array to three characters
flintstones.map! do {|name| name[0,3]}
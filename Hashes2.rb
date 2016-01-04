# Ex 3
family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

family.each_key { |key| puts key }

family.each_value { |value| puts value}

family.each do |k, v| 
  puts k
  puts v
end
# Ex 5
if family.has_value?("ben")
  puts "Ben is in the family"
else
  puts "Ben isn't in the family"
end
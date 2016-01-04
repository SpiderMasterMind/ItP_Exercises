# ex 1
family = { uncles: ["bob", "joe", "steve"],
           sisters: ["jane", "jill", "beth"],
           brothers: ["frank", "rob", "david"]
           #aunts: ["mary", "sally", "susan"]
         }

imm = family.select do |k, v| # select method returns new hash when block is true
  k == :sisters || k == :brothers # if key is :sisters or :brothers, return in new hash
end

newarray = imm.values.flatten # returns values of new hash only, combines into array
p newarray
p imm

# write a program that shows the difference between merge and merge!
puts "/n"
road = {name: "martlet"}
town = {city: "brighton"}
puts road.merge(town)
puts road
puts road.merge!(town)
puts road


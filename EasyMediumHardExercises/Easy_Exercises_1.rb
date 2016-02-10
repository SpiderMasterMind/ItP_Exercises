# Q1 
numbers = [1, 2, 2, 3]
numbers.uniq # uniq does not mutate the caller
puts numbers # outputs [1, 2, 2, 3]

# Q2
# != 'no equals'
# ? is the ternary operator
# !! turns object into boolean equivalent
# ! reverse of !!

# Q3
advice = 'Few things in life are as important as house training your pet dinosaur'
# replace 'important' with 'dinosaur'
advice.gsub!('important', 'dinosaur')

# Q4
numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1) # deletes positionally
numbers.delete(1) # deletes the integer
# both methods mutate the caller in place, wihtout the use of ! in the method name

# Q5 Determine if 42 lies between 10 and 100
(10..100).cover?(42) # returns true

# Q6 prepend 'four score' to the below
famous_words = "..and seven years ago"
"Four score" + famous_words
# or
famous_words.prepend("Four score")

 # Q7 fun with gsub = 42 evaluation is performed in context, how_deep gives us add_eight(add_eight(add_eight(add_eight(add_eight(number)))))
 flintstones = ["Fred", "Wilma"]
 flintstones << ["Barney", "Betty"]
 flintstones << ["BamBam", "Pebbles"]
 p flintstones # returns a nested array, use flatten! to make them un nested
 
 # Q8
 p flintstones.flatten!

 # Q9 Turn given hash into array containing only Barney's name and number
 flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
 flintstones.assoc("Barney") # assoc returns key value pair if Obj is found in hash

 # Q10 Turn the array into a hash, where the values are the positions in the array
 flintstones =  ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
 flintstones_hash = {}
 flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end
p flintstones_hash

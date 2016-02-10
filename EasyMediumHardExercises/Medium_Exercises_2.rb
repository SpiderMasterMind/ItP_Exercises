# Q1 Figure out  the total age of the family
munsters = { 
  "Herman" => { "age" => 32, "gender" => "male" }, 
  "Lily" => { "age" => 30, "gender" => "female" }, 
  "Grandpa" => { "age" => 402, "gender" => "male" }, 
  "Eddie" => { "age" => 10, "gender" => "male" } 
}
ages = []
munsters.each do |name, details|
  ages << details["age"] if details["gender"] == "male"
end
combined_ages = ages.inject(0) { |result, age| result + age }
p ages
p combined_ages
# given solution is
total_male_age = 0
munsters.each do |name, details|
  total_male_age += details["age"] if details["gender"] == "male"
end # no need to create an array first, just add up the values

# Q2 print the name, age and gender of each family member
munsters.each do |name, details|
  puts "#{name} is #{details["age"]} years old, and is #{details["gender"]}"
end

# Q3 refactor the method to make it easier to understand and modify in the future
def new_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"] # << changed to += so it happens at the end after the return method

  return a_string_param
  return an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
new_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Q4 break the sentence up and reverse it then join back together
sentence = "Humpty Dumpty sat on a wall."
words = sentence.split(/\W/)
words.reverse!
new_sentence = words.join(' ')
puts new_sentence

# Q5
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8
p new_answer
# returns 34 as this is answer - 8

# Q6, Q7 Q8

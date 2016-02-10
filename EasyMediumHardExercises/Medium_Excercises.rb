# Q1 print the string 10 times, with additional indentation each time
str = "The Flintstones Rock!"
10.times do
  str.prepend(" ")
  puts str
  end

# Q2 create a hash that shows a letter and its occurence as the value pair
statement = "The Flintstones Rock"
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a # creates A - Z letters array
letters.each do |letter|
  letter_frequency = statement.scan(letter).count # scan statement for each letter and returns count
  result[letter] = letter_frequency if letter_frequency > 0 # how does this bit work - creates key and value ifl_f > 0
end

# Q3 the following generates an error
# puts "the value of 40 + 2 is " + (40 + 2) because we are trying to combine an integer and a string, use the following instead:
puts "the value of 40 + 2 is (40 + 2)"

# Q4
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end # generates 1, 3 as the double iteration misses out 2 and 4

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end # generates 1,2 as 3 and 4 are 'popped' out

# Q5
def factors(number)
  dividend = number
  divisors = []
  while divisors > 0 do # this is the alternative to a begin loop
    divisors << number / dividend if number % dividend == 0 #number % dividend == 0 checks if the number divides cleanly
    dividend -= 1
  end
  divisors # calls the array for checking
end

# Q6
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element # << shovel op pushes element onto end of array
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element] # concatenates element to array
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end
# number 2 will not alter the caller's input argument, the buffer argument will alter the caller before buffer is returned

# Q7 what is wrong with the limit variable?
# the limit variable is local, and is not scoped in the method, add limit as an additional argument
#limit = 15

def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, 15)
puts "result is #{result}"

# Q8 write your own method of the titleize method
def title(words)
words.split.map { |word| word.capitalize }.join(' ')
end
p title("ben stacey")

# Q9 modify the initial munsters hash, so each member has an additional age_group key and grouping value

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
munsters.each do |name, info|
case info["age"]
  when 0..17
  details["age_group"] = "Kid"
when 18..65
  details["age_group"] = "adult"
else
  details["age_group"] = "senior"
end
end






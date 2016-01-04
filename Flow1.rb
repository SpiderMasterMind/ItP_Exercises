# Q2 write a method that takes a string as an argument and returns the all caps version
def capital(word)
  if word.length > 10
  word.upcase
  else
    word
end
end

puts capital("short")
puts capital("longerwordishere") # this one is converted to capitals

# Q3 write a program that takes a numebr as input from a user and states whether it is less than 50, more than 50 and
# more than 100

puts "Enter your number:"
x = gets.chomp.to_i

if x < 50
  puts "Less than 50"
elsif x > 100
  puts "More than 100"
else puts "Between 50 and 100"
end
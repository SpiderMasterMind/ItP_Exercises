# Question 1
def greeting(name)
  puts "Hi #{name}"
  puts "Hello, " + name + "How are you?"
end

greeting("Ben")

#  program that contains multiply method
def multiply(a, b)
  puts a * b
end

multiply(2, 3)

# use of return in method
def scream(words)
  words = words + "!!!!"
  return
  puts words
end

scream("Yippeee")
# stops expression evlauation at reutrn, so no puts is possible
# Now edit so it does print words
def scream_again(words)
  words = words + "!!!!"
  puts words
end

scream("Yippeee") # still returns nil, the last thing in the method is the return value,
# regardless of what happens in the method (except the return keyword)
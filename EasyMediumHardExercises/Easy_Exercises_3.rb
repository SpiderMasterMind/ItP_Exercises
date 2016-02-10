# Q1

# Q2

# Q3

# Q4
advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!(0, advice.index('house')) # returns sub string starting from index 0 to index where 'house' begins

# Q5 count the number of "t" characters in the following
statement = "The Flintstones rock!"
statement.scan("t").count

# Q6 center the string in a 40 character space
title = "Flintstone Family Members"
40 - title.size.to_i.times do title.prepend(" ")
  end
p title
# can also use given answer title.center(40)
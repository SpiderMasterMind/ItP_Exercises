# Q1 What does the following do?
x = [1, 2, 3, 4, 5]
x.each do |a|
  a + 1
end
# returns +> [1, 2, 3, 4, 5]


# Q2 Write a while loop that takes input and only stops when STOP is typed
string = ""
while string != "STOP" do
  puts "Type anything except STOP"
  ans = gets.chomp
  puts "Just not STOP"
  string = gets.chomp
end
# Q5 Write an array and use the each_with_index method to iterate through it and print each value
arr = ['simpsons', 'family guy', 'futurama']
arr.each_with_index do |value, index|
  puts "#{index + 1} - #{game}"
# Q4
def countdown(number)
  puts number
  if number != 0
    countdown(number -1)
  end
end

puts "Hey Pea, please enter a number:"
number = gets.chomp.to_i
countdown(number)
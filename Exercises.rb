# Q1
a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

a.each do |v|
  puts v
end

# Q2 numbers only greater than 5

a.each do |v|
  if v > 5
    puts v
  end
end

# Q3 extract odd numbers into new array
b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
array = a.select do |v|
  v % 2 != 0
end
puts array

# Q4 append 11 and prepend 0 to the original array
a << (11)
a.unshift(0)
puts a

# Q5 remove the 11, add a 3
a.pop
a << (3)
puts a

# Q6 remove duplicates
a.uniq!
puts a

# Q7 an array contains elements in indexed order starting from 0, a hash contains key-value
# pairs

# Q8 Ways to create a hash:
x = {:key => 'value'}
y = {key2: 'value2'}

# Q9 
h = {a:1, b:2, c:3, d:4}
# value of ':b'
h[:b]
# Add key:value pair '{e:5}'
h[:e] = 5
# remove all key value pairs whose value is less than 3.5
h.delete_if do |k, v|
  v < 3.5
end
puts h





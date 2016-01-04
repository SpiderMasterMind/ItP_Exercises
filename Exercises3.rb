# Q14 with one contact, loop or iterate over a contacts hash and populate the contact_data
# array. Use [:email, :address, :phone] and shift or first methods

contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}
keys = [:email, :address, :phone]

contacts.each do |name, info|
  keys.each do |key|
    info[key] = contact_data.shift
  end
end # name remains unchanged, info[key] is the values



puts contacts
puts " =========== "

# Q15
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |word| word.start_with?("s") }
puts arr

# Q16
a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']
a = a.map { |pairs| pairs.split}
a = a.flatten
puts a
# Q17

hash1 = {shoes: "nike", "hat" => "adidas", :hoodie => true}
hash2 = {"hat" => "adidas", :shoes => "nike", hoodie: true}

if hash1 == hash2
  puts "These hashes are the same!"
else
  puts "These hashes are not the same!"
end

# the hashes are the same

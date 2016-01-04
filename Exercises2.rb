contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

# Q12 put the data from teh array into the corresponding empty hash
contacts["Joe Smith"][:email] = contact_data[0][0]
# the first part creates the key, the second part finds the first value in teh first array
contacts["Joe Smith"][:address] = contact_data[0][1]
contacts["Joe Smith"][:phone] = contact_data[0][2]
contacts["Sally Johnson"][:email] = contact_data[1][0]
contacts["Sally Johnson"][:address] = contact_data[1][1]
contacts["Sally Johnson"][:phone] = contact_data[1][2]
puts contacts
# each becomes a k-v hash within a hash

# Q 13 access Joe and sallys  email ans phone number
puts "      "
puts contacts["Joe Smith"][:email]
puts contacts["Joe Smith"][:phone]
puts contacts["Sally Johnson"][:email]
puts contacts["Sally Johnson"][:phone]

#Q14 with one contact, loop or iterate over a contacts hash and populate the contact_data
# array. Use [:email, :address, :phone] and shift or first methods
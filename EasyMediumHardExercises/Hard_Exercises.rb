# Q1
if false
  greeting = “hello world”
end

greeting

# will return an error sa the above returns nil, as the local variable is initialised in an if block
# Q2 Generate UUID
def generate_UUID
  characters = [] 
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit } # creates characters array 0..9 and a to f

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  p uuid
end
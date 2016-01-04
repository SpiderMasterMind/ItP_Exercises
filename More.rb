# match method brings matchData object
def has_a_b?(string)
  if /b/.match(string)
    puts "we have a match"
  else
    puts "no match found"
  end
end

has_a_b?("basketball")
has_a_b?("football")
has_a_b?("hockey")
has_a_b?("golf")
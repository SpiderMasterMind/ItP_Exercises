words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

# alphabetize the elements in the array

result = {}

words.each do |word|
  key = word.split('').sort.join # takes each element in array, alphabetizes
  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end
 p result
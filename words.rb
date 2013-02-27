#!/usr/bin/env ruby
dict_path = ARGV[1] || '/usr/share/dict/words'

word_file = File.new(dict_path)
length_to_word = {}
for word in word_file
  letters = word.split('')
  letters.sort!
  soup = letters.join('')
  unless soup =~ /([a-z])\1/
    if length_to_word.has_key?(word.size)
      length_to_word[word.size] << word
    else
      length_to_word[word.size] = [word]
    end
  end
end

for i in length_to_word.keys.sort
  words = length_to_word[i]
  words.sort!
  for word in words
    puts word
  end
end

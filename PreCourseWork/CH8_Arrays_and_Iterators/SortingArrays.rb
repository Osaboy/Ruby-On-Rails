<<-DOC
Building and sorting an array. Write the program we talked about at the
beginning of this chapter, one that asks us to type as many words as we
want (one word per line, continuing until we just press Enter on an
empty line) and then repeats the words back to us in alphabetical order.
Make sure to test your program thoroughly; for example, does hitting
Enter on an empty line always exit your program? Even on the first line?
And the second? Hint: There’s a lovely array method that will give you a
sorted version of an array: sort. Use it!
DOC

puts 'Give me some words, and I will sort them:'
words = []

while true
  word = gets.chomp
  break if word.empty?

  words.push word
end

puts words

puts 'Sweet! Here they are, sorted:'
puts words.sort

ask "What is your favorite color?"
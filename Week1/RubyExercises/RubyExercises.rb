puts "1. Use the \"each\" method of Array to iterate over [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], and print out each value."
puts "        Using the \"each\" method to iterate over any Array" 
line_width = 10
num_array = (0..10).to_a
num_array.each do | num |
  puts (num.to_s).rjust(line_width)
end
# ruby convention tho is num_array.each { | num | puts num }

puts "\n 2. Same as above, but only print out values greater than 5."
puts "        Using the \"each\" method to iterate over any Array but only print out values greater than 5" 
line_width = 10
num_array = (0..10).to_a
num_array.each do | num |
  if num > 5
    puts (num.to_s).rjust(line_width)
  end
end
# ruby convention tho is num_array.each { | num | puts num if num > 5 } <== only do this if the code is short

puts "\n 3. Now, using the same array from #2, use the \"select\" method to extract all odd numbers into a new array."
line_width = 10
odd_numbers = num_array.select { |number| number%2 == 1 }
# could also do odd_numbers = num_array.select { |number| number.odd? }
puts "        New Array containing all odd numbers"
puts (odd_numbers.inspect).rjust(line_width+5)

puts "\n 4. Append \"11\" to the end of the array. Prepend \"0\" to the beginning."
odd_numbers.push(11)
# common in ruby is odd_numbers << 11
puts "        Updated Array containing with the number 11 appended to the end"
puts (odd_numbers.inspect).rjust(line_width+5)
puts "        Updated Array containing with the number 0 prepended"
odd_numbers.insert(0, 0)
# common in ruby is odd_numbers.unshift(0)
puts (odd_numbers.inspect).rjust(line_width+5)

puts "\n 5. Get rid of \"11\". And append a \"3\"."
odd_numbers.reject{|number| number == 11}
odd_numbers.push(3)
# common in ruby is odd_numbers << 3
puts "        Updated Array the number 11 removed and number 3 apended to the end"
puts (odd_numbers.inspect).rjust(line_width+5)

puts "\n 6. Get rid of duplicates without specifically removing any one value."
odd_numbers = odd_numbers.uniq
# odd_numbers.uniq does not modifiy od_numbers instead of the above you can do odd_numbers.uniq!
puts "        Updated Array with all duplicates removed"
puts (odd_numbers.inspect).rjust(line_width+5)

puts "\n 7. What\'s the major difference between an Array and a Hash?"
puts ("\n Arrays are ordered, integer-indexed collections of any object. Array indexing starts at 0. A negative index is assumed to be relative to the end of the array—that is, an index of -1 indicates the last element of the array, -2 is the next to last element in the array, and so on").rjust(100)
puts ("\n A Hash is a collection of key-value pairs. It is similar to an Array, except that indexing is done via arbitrary keys of any object type, not an integer index. Hashes enumerate their values in the order that the corresponding keys were inserted").rjust(50)

puts "\n 8. Create a Hash using both Ruby 1.8 and 1.9 syntax."
puts "\n Hash using Ruby 1.8: \"h = { \"a\" => 100, \"b\" => 200, \"c\" => 300 }\""
h = { "a" => 100, "b" => 200, "c" => 300 } 

puts "\n Hash using Ruby 2.0: h = { a: 100, b: 200, c: 300 }"
h = { a: 100, b: 200, c: 300 }

puts "\n Suppose you have a hash = {a:1, b:2, c:3, d:4}"
h = {a:1, b:2, c:3, d:4}

puts "\n 9. Get the value of key \"b\"."
puts "key \"b\". = " + h[:b].to_s

puts "\n 10. Add to this hash the key:value pair {e:5}"
h[:e] = 5
puts "h has key e? = " + (h.has_key?(:e)).to_s
puts "new hash h = " + h.inspect
puts "\n 13. Remove all key:value pairs whose value is less than 3.5"

return_value = h.delete_if { |key, value| value < 3.5 }
puts "new hash h = " + h.inspect

puts "\n 14. Can hash values be arrays? Can you have an array of hashes? (give examples)"
puts "yes hash with a key value pair being an array {a: [1,2,3], b: \"Hi There\", c:4 } and array of hashes [{a: 1, b: 2},{},{}]"

puts "15. Look at several Rails/Ruby online API sources and say which one your like best and why."
puts "Can't decide between the two options \n http://www.tutorialspoint.com/ruby/ruby_hashes.htm and \n http://www.ruby-doc.org/core-2.1.0/" 
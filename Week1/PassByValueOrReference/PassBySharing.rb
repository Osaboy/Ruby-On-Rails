str_1 = "pass_by_value"
str_1.object_id
puts "Initial value of str_1 = " + str_1
puts str_1.object_id

def pass_by_value_or_reference (str)
  # str = "pass_by_reference"
  puts str.object_id
end

pass_by_value_or_reference (str_1)
puts "After pass_by_value_or_reference: value of str_1 = " + str_1

puts 'Because object references are passed to methods, methods can use those references to modify the underlying object. These modifications are then visible when the method returns."
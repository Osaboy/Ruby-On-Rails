<<DOC
Create a method that takes an array as a parameter. Within that method, try calling methods that 
do not mutate the caller. How does that affect the array outside of the method? What about when 
you call a method that mutates the caller 
within the method?
DOC

puts "Because object references are passed to methods, methods can use those references to modify the underlying object. These modifications are then visible when the method returns."

new_array = [ 1, 2, 3 ]
puts "before non mutating method new_array is: " + new_array.inspect

def assignment (array)
  array.select { |number| number.odd? }
end

assignment (new_array)
puts "after non mutating method new_array is: " + new_array.inspect

def mutation (array)
  array.reject! { |number| number.odd? }
end
mutation (new_array)
puts "after mutating method new_array is: " + new_array.inspect

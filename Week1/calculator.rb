# 1. string interpolation vs concat
# 2. extract repetitive logic to methods
# 3. keep track of variable types (class)

require 'pry'

def say(msg)
	puts "-------- #{msg} --------"
end

say "What's the first number?"
num1 = gets.chomp

say "Whats the second number?"
num2 = gets.chomp

say "1) add 2) substract 3) multiply 4) divide"
operator = gets.chomp

binding.pry

if operator == '1'
	result = num1.to_i + num2.to_i
elsif operator == '2'
	result = num1.to_i - num2.to_i
elsif operator == '3'
	result = num1.to_i * num2.to_i	
elsif operator == '4'
	result = num1.to_i - num2.to_i
end

say "Results is #{result}"		
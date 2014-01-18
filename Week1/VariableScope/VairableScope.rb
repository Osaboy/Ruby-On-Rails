<<Doc
Play around with variable scope and test out different scenarios.

1 Create a local variable and modify it at an inner scope (in between a do/end block). You can try
a) re-assigning the variable to something else
b) call a method that doesn’t mutate the caller
c) call a method that mutates the caller.

2 Create a local variable at an inner scope (within a do/end block) and try to reference it in the outer scope. What happens when you have nested do/end blocks?
Doc

def Add (x)
  local_var = 3
  puts "local_var = " + local_var.to_s
  
  local_var = x
  puts "After assignment, local_var = " + local_var.to_s
  puts "Math.sin(local_var) = " + Math.sin(local_var).to_s
  puts "After Math.sin(local_var), local_var = " + local_var.to_s
  
  x*2
  puts "After multiplying by 2, local_var = " + local_var.to_s
  
end

Add(2)
puts local_var.to_s

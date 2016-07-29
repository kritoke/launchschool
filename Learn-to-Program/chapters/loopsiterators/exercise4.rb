# a method that counts down to zero using recursion.

def recursion(param)
  if param <= 0
    puts param 
  else
    puts param
    recursion(param-1)
  end
end

recursion(44)

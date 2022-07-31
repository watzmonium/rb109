num = 3

loop do
  num = 5
  size = "medium"
  break
end

puts num
puts size # => NameError: undefined local variable or method `size' for main:Object

first, the local variable `num` is declared and initialized with an integer value of `3`.

then a loop starts which creates an inner-scope. First, `num` is reassigned to the value of `5`. Then, a local variable `size` is initialized and assigned the string value `"medium"`. The loop is then broken
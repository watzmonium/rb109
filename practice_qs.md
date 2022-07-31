# Practice Exam

You will have 3 hours to complete the test. This test has 23 questions. That is slightly less than 8 mins per question.

Suggested response format (based on feedback from other students & Srdjan’s blog post):

- What does the code output? What are the return values?
- Answer the why behind the output/return:
  - Focus only on the lines of code that deliver the output and return values.
- Summarize what the problem demonstrates and why: i.e. "This problem demonstrates the concept of local variable scope/etc…"
  - This can be at the beginning or end of your answer - personal preference.

The following questions are taken from the shared [RB109 Written Assessment: Practice Problems Google Doc](https://docs.google.com/document/d/16XteFXEm3lFbcavrXDZs45rNEc1iBxSYC8e4pLhT0Rw/edit#)

## 1

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.select { |n| n.odd? }
```

the code snippet above first establishes an array object on line 1, filled with integers from 1-10.

Then on line 3, the select method is called on the array object with a block as the argument to that method. the select method is iterative, and its purpose is to iterate over the objects of the enumerable and then return the values for which the block returns 'true' into a new array object. In this specific example, the block passed to the method establishes a local variable 'n' which will point to each object in the array as the method executes. Each object will then have the method .odd? called on it, and that object will be added to the new array if the result of the block evalutes to true. The return value of this code segment will be [1,3,5,7,9]

This code is an example of interation and selection. The select method is an iterative method - meaning that it parses through an entire list (or enumerable) and then selects specfic values from that list.

## 2

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n| 
  n > 1
end
p new_array
```

Like the previous example, an array object is declared and assigned a value on line 1.

Then a new variable `new_array` is decaled and assigned a value on line 3. the value of the new array is the result of calling the `map` method on the original `arr` array. The map method is an iterative method that returns a new array that is the same size as the original array. this map method is invoked with a block that establishes a local variable 'n' that points to each object in the array, sequentially. the block will evaluate the boolean expression on line 4 `n > 1` where the computer checks to see if each object is greater than the integer 1 and return `true` for all values from the original array for which that is true. however, the new array will still have a value in the first place, it will just be `false` because map specifically iterates over and selects each object in the array.

finally, the p method is called with the `new_array` passed to it as an argument which was the return value from calling the map method on the original arary.

the output will be `[false, true, true, true, true, true, true, true, true, true]`

the return value (if this was a function) is the array because the p method returns the argument with which it is called.

This example shows iteration and selection of objects from an enumerable.

## 3

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
  value.length >= 3
end
```
the code above first establishes a hash with 3 key/value pairs and symbols as keys. The `all?` method is then called upon that hash with a block as an argument that establishes two local valuables, `key` and `value` that can be used to iterate over the keys and values of the hash. the `key` variable is never called and stylistically it should really be `_`, but on line 2, the boolean expression `value.length >= 3` is evaluated and if the result of all values in the block returns true for that expression (which it will), the method will return `true`. the `length` method returns the size of an object as an integer, and all strings evaluated are at least 3 characters long. It's return value is `true`, and it is the only expression evaluated so that is what it will output. 

This demonstrates iteration, and selection also to determine tsomething about the contents of an enumerable.

## 4

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
  hash[value] = key
end
```
in the code above, a hash of symbol and string pairs calls the `each_with_object` method, which is a method that takes an object (in this case a hash) to use as it iterates over each key and value in the hash. This method is also given a block with local varaibles used to iterate over the keys and values, as well as refrence the hash object. The object is referenced by the local variable `hash` which is then used in the loop.

the object `hash` here will be assigned the values of the calling hash as keys and its values will be the keys from the calling hash, basically inverting the hash using the `[]=` method which allows direct assignment of keys and values to the hash.

the return value of this code will be the `hash` object, which will have the values and keys swapped from the calling hash.

## 5

What does the following code return? What does it output? Why? What concept does it demonstrate?

What are a, b, and c? What if the last line was `c = a.uniq!`?

```ruby
a = [1, 2, 3, 3]
b = a
c = a.uniq
```
in this code, the variable a is assigned a value of an array with 4 ints ranging from 1-3. then b is assigned to the same object that a points to on line 2. finally, c is assigned using the `uniq` method on a, which will return only the unique objects from `a` into a new array object that c will point to.
the return value will be `[1, 2, 3]` because the 3 value repeats in the array and will therefore not be in the new array. a, and b will still have their original values.

This shows selection from one object to a new object, however the original array is preserved and unchanged because uniq is not a destructive method. if `uniq!` instead were called on a, the value of a and b would be changed in addition to c because uniq! is destructiveand mutates the caller, so all threee would be `[1, 2, 3]`

## 6

What does the following code return? What does it output? Why? What concept does it demonstrate?

What values do `s` and `t` have? Why?

```ruby
def fix(value)
 value[1] = 'x'
 value 
end

s = 'abc'
t = fix(s)
```
in the code above, a method name `fix` is defined that takes a single argument. in the function, the second value of the object is assigned the string 'x' by using the `[]=' method of assigning a specific value in a list. finally, the original object is returned implicitly.

then, the local variable 's' is assigned the value of the string 'abc'. then, the local variable t is assigned by calling the `fix` method with s as an argument. this will assign to t the value of s, which has been muted by the caller because the `[]=` method of assignment is destructive and the original object is returned by the `fix` method. both objects will have the value 'axc'.

this problem shows variable assignment and how some methods preserve the original value of objects and others do not. It also shows how objects can be passed by reference rather than value because the `fix` function preserves the reference to the 'abc' object that is pointer s.

## 7

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def a_method(string)
  string << ' world'
end

a = 'hello'
a_method(a)

p a
```

first, a local variable `a` is defined and initialized on line 130 to the value `'hello'`. Then on line 131, `a_method` method is called with a as an argument.

The method `a_method` has a single paramater, `string` which will point to the same object that `a` does, despite them having different scopes. In this method, however, the `<<` shovel opertor is invoked on the `string` object, which mutates the object and does not reassign it. as a result, the initial calling object `a` will have its value changed to `'hello world'`, which will be returned and then printed to the screen with the `p` method on line 133.

This snippet demonstrates how ruby is a 'pass by reference/value' languge in that while a reference (pointer) to the object is initialized when the `a_method` is called, the method ultimately mutates the caller, making it seem like a pass by reference function.

## 8

What does the following code return? What does it output? Why? What concept does it demonstrate?

What values do `s` and `t` have? Why?

```ruby
def fix(value)
  value = value.upcase!
  value.concat('!')
end

s = 'hello'
t = fix(s)
```
first in line 154, a variable `s` is intitalized with a value of `'hello'`. Then a variable t is initialized and assinged the return value of the `fix` method called on `s`

the `fix` method defined on line 149 takes a single parameter `value` which points to the same value that `s` does. `value` is then reassigned using the `=` assignment operator to the same value with the `upcase!` method called on it. `upcase!` as denoted by the `!` is a destrutive method and will change the original object. Because `value` is reassigned to the same object, it will have a value of `HELLO` and still point to the same object. finally, the `concat` method is called on value with the argument `'!'` which will append the same string object with an exclamation mark, destructively.

The function will return the same object that now has the value `'HELLO!'` which both `s` and `t` point to.

This example demonstrates how ruby is a 'pass by reference/value' language because the original object is mutated, so the function acts as pass by value.

## 9

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = “Hello”
b = a
a = “Goodbye”
puts a
puts b
```
in this snippet, a local variable `a` is initialized and assigned the value `"Hello"`. Then another local variable `b` is intitalized and assigned the same value as `a`, so they now both point to the same object. Then, `a` is reassigned to the value `"Goodbye"`.

In ruby, reassignment to a new string creates a new object, so `a` will now point to `"Goodbye"` and `b` still points to `"Hello"`.

The `puts` methods are called on both `a` and `b`, and will output:
`Goodbye`
`Hello`

the return value is `nil` because puts returns nil.

This example demonstrates variables acting as pointers, because `b` points to the object `a` once pointed to, and `a` was reassigned to point to a new object, meaning their object_ids are now different.

## 10

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = "hello"

[1, 2, 3].map { |num| a }
```

In this code, the variable `a` is first intitailzed on line 193 and assigned the value `"Hello"`. Then, the `map` method is called on an array of integers from 1-3 and passed a block as an argument. The `map` iterative method will iterate over each value in the calling collection and assign a value based on the block given.

In the block parameter given to the `map` method, a local variable `num` is intialized and never used, and then the variable `a` is the entirety of the argument given in the block. As a result, the `map` method will iterate over the array, and return the value of `a`, `"hello"` to each entry in the array. Because the `map` method is not desructive, this method will return a new array with the contents `["hello", "hello", "hello"]`.

this example demonstrates iteration and return value from an enumerable method.

## 11

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
[1, 2, 3].each do |num|
  puts num
end
```
In this code, the `each` method is called on an array of integers from 1-3. The `each` method is then given a block as an argument, where a local variable in an inner-scope `num` is initiatlized that can be used to iterate over the collection. Finally, the `puts` method is called on the `num` variable, which will change the object it points to on each iteration, resulting in the method printing each number `1`, then `2`, then `3`, and then returning `nil` to the method.

The each method always returns the original object, so the return value of this expression will be the original array of integers.

This demonstrates iteration over a collection.

## 12

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

incremented = arr.map do |n|
              n + 1
            end
p incremented
```

In this snippet, an array `arr` is intitalized and assigned the value of an array with the integers 1-10.

Then we initialize a new variable `incremented` and assign it the return value of calling the `map` method on the `arr` variable with a block as an argument. The block creates an innner-scope and initializes a local variable `n` to use to iterate over each object in the collection. then, `n + 1` is implictly returned to the map method, which will result in a new array where each value is incremented by 1 because the `map` method is not desructive.

The final line invokes the `p` method on the `incremented` variable and will output:
`[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]`

this snippet demonstrates iteration over a collection.

## 13

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 4

loop do
  a = 5
  b = 3


  break
end

puts a
puts b
```
in this example, a local variable `a` is intiatlized and assigned the value of the integer 4.

Then a loop begins which creates an inner-scope and reassigns the value of the value of `a` to 5 and then initializes a local variable `b` with a vlue of 3 before breaking the loop. `a` is available inside of the loop because the loop shares the same scope as the surrounded code, while having its own inner-scope.

finally, the `puts` method is called on both `a` and `b` which will print the value `5` to the screen and then throw an error of undefined local variable because `b` was declared in the inner-scope of the loop but not outside of it, making it unavailable to access later.

this example demonstrates variable scope and where variables can and cannot be accessed in a program.

## 14

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 'Bob'

5.times do |x|
  a = 'Bill'
end

p a
```
in this example, a local variable `a` is declared and initialized with a value of `'Bob'`.

then a loop is performed by calling the `times` method on the number 5, which will cause the loop to run 5 times. the loop is given an argument block which has its own inner-scope. in the block, a local variable `x` is declared that will act as a counting variable that can be used in the loop, but this one is ever used. In the loop, the variable `a` is reassigned the value of `'Bill'` 5 times.

finally, the `p` method is called on `a`, which will print out '`Bill'` because `a` was reassigned in the loop and was accessable to the loop because they share the same outer-scope, despite the `times` argument having its own inner-scope. 

the `p` method will return the string `'Bill'`

this example demonstrates variable scope
## 15

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def increment(x)
  x << 'b'
end

y = 'a'
increment(y) 

puts y
```
in this example, a variable `y` is declared and initialized with a value of `'a'`. Then a method, `increment` is called with y as an argument.

on line 294, the method `increment` is defined and takes a single parameter, `x`. In this case, `x` will point to the same `'a'` object that `y` does. Then, the shovel operator `<<` is used to append the value of `'b'` to the objext `x`, which will mutate the caller and change the value of `y` outside of the local scope of this function, and the value `x` is returned.

finally the `puts` method is called on `y` which will output `'ab'` and reutrn `nil`.

this demonstrates ruby's passy by value/reference 

## 16

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

puts arr1 
puts arr2
```
in this example, an array, `arr1` is decalred with 3 strings, 'a', 'b', and 'c' as its values.

then, another array is declared and assigned a copy of arr1 by calling the `dup` method on arr1. the `dup` method creates a shallow copy of arr1, but is a different object. In the shallow copy, the array object itself is different, but each of the objects inside still refer to the same original objects.

next, the `map!` destructive method is called on `arr2` and given a block as an argument with a local variable `char` that can be used in the inner-scope to iterate over the values in the collection. in the block, the `char` variable calls the `upcase` method, which will return a capitalized version of the word to the `map!` method, changing the values in the `arr2` array by creating new objects in the array.

finally, both arrays will be printed using the `puts` method, and `arr1` will have its original values of `["a", "b", "c"]` but arr2 will have had its values reassigned by the `map!` method which will output the values of `["A", "B", "C"]`

this example demonstrates how methods can/cannot mutate objects. the array object `arr2` was mutated by having its values assigned to new objects, though the objects themselves were not mutated.

## 17

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4]

counter = 0
sum = 0

loop do
  sum += arr[counter]
  counter += 1
  break if counter == arr.size
end 

puts "Your total is #{sum}"
```
in this code, first an array `arr` is initialized and assigned an array with the the values of the integers 1-4.

then two variables, `counter` and `sum` are declared and initialized with values of 0.

then a loop starts on line 345 that creates an inner-scope. first, the sum variable is reassigned a value with the `+=` operator to the `counter` position in the `arr` array. Then `counter` is incremented by 1 by syntactic sugar reassignment. Finally a conditional break occurs where the loop is told to stop if the value of `counter` is equal to (`==` comparison ) arr with the `size` method called on it. The `size` method will return the total number of objects in the array. In this case, 4. The loop will break of its fourth iteration once the conditional statement evalutes to `true`.

finally, the value of the sum will be output on line 351 and will return `nil` and output `"Your total is 10'"

This demonstrates iterating through collections.

## 18

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n|
  n + 1
end
p new_array
```

in this example, an array of integers, `arr` is declared and initialized to the values `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`

then a new variable, `new_array` is declared and initialized with the return value from the select method being called on the `arr` array. the `select` method accepts a block and will iterate over each value of the collection and return the values that the block evaluates as `true`. The block in this example creates an inner-scope and initalizes a variable `n` that is used to iterate over each object in the array. then in the block, the statement `n+1` is given which will always evaluate to `true` because it returns an integer which ruby evaluates as `true` like most things in ruby.

the `select` method will return the objects from the original array to the new array and so `new_array` invoked with the `p` method on line 373 will print `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]` and return the same.

This is an example of ruby's 'truthiness' in selection and iteration.


## 19

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
[1, 2, 3].any? do |num|
  num > 2
end
```
in this snippet, an array of integers 1-3 calls the `any?` method which is a method that returns `true` if the block returns `true` for any value in the collection. the `any?` method here is called with a block which creates an inner-scope with a local variable `num` that will point to each object in the collection as it iterates.

in the block, the expression `num > 2` will be evaluated on each object in the collection, which will be true on the 3rd object, 3, and the block will return `true` and therefore the method will return `true`

this shows iteration and selection
## 20

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def fix(value)
  value.upcase!
  value += '!'
  value
end

s = 'hello'
t = fix(s)
```
in this example, a local variable `s` is declared and intialized with a value of `'hello'`. Then another local variable `t` is declared and initalized with the return value of passing `s` as a parameter into the `fix` method.

the `fix` method defined on line 404 takes a single parameter, `value` which will initially point to the same object as `s`. Then, the `upcase!` destructive method is called on `value` which will mutate the caller and change the value to `'HELLO'`. Then, `value` is reassigned using using the `+=` operator to `'HELLO!'` and then implicitly returned on the next line.

the result will be that `t` will have the value of `'HELLO!'` returned from the `fix` method, and `s` will have the value `'HELLO'` which was mutated in the method, but then not affected when `value` was reassigned.

this shows ruby's pass by object/refrence nature in which s seems passed by reference by being mutated but also passed by value because t is not the same as s.

## 21

What does the following code return? What does it output? Why? What concept does it demonstrate?

What values do `s` and `t` have? Why?

```ruby
a = 4
b = 2

loop do
  c = 3
  a = c
  break
end

puts a
puts b
```
in this code, first a variable `a` is declared and intitialized with an integer value of 4. then a variable `b` is initialized and declared with an integer value of 2.

next a loop starts that creates an inner-scope where a variable `c` is initialized and declared to have an integer value of 3. Then `a` is assigned the same object as `c` and the loop breaks

finally the two variables `a` and `b` are passed as arguments to the `puts` method and they will output the values `3` and `2` respectively and return `nil`

this shows variable scope because `a` is initialized outside of the scope of the loop and `c` is not, however `a` is reassigned to point at the object `3` which can persist in the outer-scope

## 22

What does the following code return? What does it output? Why? What
concept does it demonstrate?

```ruby
a = %w(a b c)
a[1] = '-'
p a
```

in this example, first an array `a` is declared with the string values ["a", "b", "c"]

Then the `[1]` index of the array is reassigned the value of '-'

finally the `p` method desplays the array which will output `["a", "-", "c"]`

this demonstrates assignment of variables because the `[]=` index assignment operator is able to change the value of a collection.
## 23

What does the following code return? What does it output? Why? What
concept does it demonstrate?

```ruby
def add_name(arr, name)
  arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```

in this code, an array `names` is declared with two strings, `'bob'` and `'kim'` as its values.
then a method `add_name` is invoked with two arguments, the `names` array and the string `'jim'`

the `add_names` method is defined on line 472 and takes two arguments, `arr` and `name`. The array `arr` that originally points to the `names` array is reassigned on line 473 to the value of the array plus another array `[name]`. This will return a new array with all 3 names in it.

However, because the return value of that method was not assigned to a variable, the `puts` method with names on line 478 will just print the first two names in the original array.

this demonstrates how ruby can act as pass by reference/value because when the array is reassigned in the method, it acts like pass by reference.

def repeater(string)
  result = ''
  string.each_char do |char|
    result << char << char
  end
  result
end

repeater('Hello')

in this code snippet, first a method `repeater` is called with the string `'hello'` as an argument.

in this method, 

first, a local variable `total` is declared and initilized with a value of 0,

then the `each` method is invoked on an array object [1, 2, 3] and given a block which creates an inner-scope. the block defines a local variable `number` that can be used as a poitner to each object in the collection sequentially each loop. in this block, the `+=` operator is used to reassign to total the value of total + number. 
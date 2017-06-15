METHODS
- define with "def" and close with "end"
- when putting in notes use # in front of method name to signify method
- use () after the method name to indicate an argument
- you can have multiple arguments
  -ie. def greeting(name)
          "Hello #{name}"
       end
- Method arguments create local variables for the instance when the method is called
- if you define arguments for a method they are then required when calling it
- you may see people dropping the () when calling methods (it's valid but a bad practice)
- methods without arguments may omit the ()
- by default, a method will return the value of the last statement if there is not explicit return value

ArgumentError
  received when you call a method that has arguments without them
  all arguments are required when you invoke the method

PUTS vs PRINT
-both print to the console
-PUTS adds a new line after executing and *always has a nil return value*
   - puts = "output string"
    3.times { print "Hello!" }
    # > Hello!Hello!Hello!

    3.times { puts "Hello!" }
    # > Hello!
    # > Hello!
    # > Hello!
---
RETURN VALUE
- data returned to the program by the execution of a method
- disrupts the execution of your method
- supersedes implicit return
- Ruby has implicit return (it will return the value of the last line)
- return value is the data returned to the program
- how diff parts of your program communicate with one another

---
Default Arguments
- you can define a method where the arguments are not required
  ie.
    def say_hello(name = "Ruby programmer")
      puts "Hello #{name}!"
    end
  -->if a name argument is passed thru then it will use that
    if not, then it will use "Ruby programmer", the default value
- you can have methods with both required and optional arguments
  -just put the optional ones at the end of the argument list
- you set the default values when you are defining the method

----
GETS method
- captures the last thing the user typed into the terminal
- when you call "gets" it freezes the program and waits for input
  ie. bin/greeting
     puts "Hi! Welcome to the wonderful world of Ruby programming."
    puts "Please enter your name so that we can greet you more personally:"
    name = gets.strip
    greeting(name)

    STRIP
      removes new lines or trailing whitespace
    CHOMP
      removes any new lines at the end of the string

----
Control Flow => tell program to execute different things based on conditions
- truthy = state of being true
    - "truthy" things that aren't falsey (aka not false or nil)
    - every instance of "true" is part of the TrueClass
- falsey = state of being false
    - false and nil are the only 2 "falsey" things
    - every instance of "false" is part of the FalseClass
- single bang operator => !
  - negates the bool value it's placed in front of
    - ie. !true => false
- double bang operator => !!
  - returns T or F based on whether or not value is T or F
    - ie.
        !!"hello" => true
        !!nil => false

Boolean Operators

! => NOT
&& => AND (both must be true)
|| => OR (at least one must be true)

Comparison Operators
```
== => check if 2 values are equal
  note: you can compare variables and known values or variables to variables
    ie. my_mood = "happy"
        my_mood == "happy" ==> true
!= => check if 2 values are not equal
> => greater than
< => less than
>= => greater than or equal to
<= => less than or equal to
```
----

Conditionals
- if, else, elsif statements
- case statements
- loops

basic structure:
  if CONDITION
    code to run if true
  elsif ANOTHER CONDITION
    code to run if this condition is true
  else
    code to run if false (think of as the default condition)
  end

-----

?: => ternary operator
  conditional ? action_if_true : action_if_false
- only use with simple if/else statements

statement modifier
- allows you to put a conditional at the end of a statement

ie.
  this_year = Time.now.year
  puts "Hey, it's 2015!" if this_year == 2015

  ^puts the statement if the year is 2015

OR
  this_year = Time.now.year
  puts "Hey, it's not 2015!" unless this_year == 2015

  ^puts the statement unless the year is 2015

----
CASE statement

- used to run multiple conditions against one value (ie. if you have a lot of if/elsif/else)
- 3 reqs:
  1) value
  2) 1 or more conditions to compare the value
  3) code for when condition is met
- format:
  + case value_to_test
  + when condition_to_test
    + code to execute
  + end
=> case statements actually evaluate their when conditionals by implicitly using the "case equality operator" (===)


case name
  when "Alice"
    puts "Hello, Alice!"
  when "The White Rabbit"
    puts "Don't be late, White Rabbit"
  when "The Mad Hatter"
    puts "Welcome to the tea party, Mad Hatter"
  when "The Queen of Hearts"
    puts "Please don't chop off my head!"
  else
    puts "Whoooo are you?"
end


-----
you can use ? in method names #position_taken? => indicate that your method answers a question

HELPER METHOD
- method that handles a discrete unit of behavior
- used inside of another method to carry out a larger task

----
*Single Responsibility Principle*
- methods should only have one job and their behavior should be closely related to that job
ie. the job that determines whose turn it is should be separate from the one that tells you how many turns there have been

----
built in methods

#even? => check to see if each in the array are even

#odd? => check to see if each in the array are odd

#all? => enumerator; the block passed to it must return TRUE for every item otherwise it will return false
  ie.
    all_odd = [1,2,3].all? do |number|
      number.odd? # Will evaluate to true for 1, false for 2, true for 3
    end #=> false
    all_odd #=> false

#none? => opposite of #all?; if no iteration of the block is true, it will return true
  ie. [1,3].none?{|i| i.even?} #=> true

#any? => if at least one iteration of the block evals to true, it will return true
  ie. [1,2,100].any?{|i| i > 99} #=> true

#include? => returns true if the object exists in the element
  ie.
  the_numbers = [4,8,15,16,23,42]
  the_numbers.include?(42)   #=> true
  the_numbers.include?(6)   #=> false

#select => select matching elements from a collection based on a block
  - returns a new array based on elements that eval to true
  - returns empty array if none of the elements eval to true
  - always returns an array

#detect or #find => find a matching element from a collection based on a block
  - returns the first element that evals to true
  - returns nil if none of the elements eval to true
  - returns single object and not array

#reject => filter matching elements from a collection based on a block
  - returns a new array based on elements that eval to false
  - returns empty array if none of the elements eval to true
  - always returns an array

#block_given? => determine if the method is called with a block or not

#delete_if? => deletes every element of the array when the block evals to true

#sort => iterates over collection and
  - you can use comparison operators (< >) with strings too
    - if the first letter of a string is later in the alphabet than the other it will return true
      - ie. "zoo" > "apple" => true
  - the method will iterate over array and yields a block with 2 elements
    - That block *must* be a comparator, so it should compare the two elements and return 0 if they are the same, -1 if the first is less than the second, and 1 if the first is greater than the second
  array = [7, 3, 1, 2, 6, 5]

  array.sort do |a, b|
    if a == b
      0 #stay in current places
    elsif a < b
      -1 #stay in current places
    elsif a > b
      1 #switch a and b
    end
  end
  --- which is the same as the below ---
  array = [7, 3, 1, 2, 6, 5]

  array.sort do |a, b|
    a <=> b #combined comparison operator (if you switch a and b you get reverse order)
  end

----
SCOPE
- not all variables exist everywhere in a program
- methods in ruby create their own scope
- areas of your program in which certain data is available to you
- variables inside methods don't know about the variables outside of the method

**Any local variable created outside of a method will be unavailable inside of a method. In addition, local variables created inside of a method (i.e. in between the def and end keywords of a method) 'fall out of scope' once you're outside the method.**

Method Scope
- "def" and "end" = gates
- methods cannot access variables outside until you pass them in as an argument
- variable defined inside a method can't leave that method.

----
YIELD keyword

- when used inside of a method it will allow you to call the method with a block of code and pass the torch to that block
- yield = "Stop executing the code in this method, and instead execute the code in this block. Then, return to the code in the method."
- if you pass it an argument then it will pass it to the block (aka it'll be available to the block)
- each time you use yield(some_argument) in the body of a method, it passes some_argument to the block you call that method with.

def yielding
  puts "the program is executing the code inside the method"
  yield
  puts "now we are back in the method"
end

yielding { puts "the method has yielded to the block!" }
=> the program is executing the code inside the method
   the method has yielded to the block!
   now we are back in the method

---
def yielding_with_arguments(num)
  puts "the program is executing the code inside the method"
  yield(num)
  puts "now we are back in the method"
end

yielding_with_arguments(2) {|i| puts i * 2}
=> the program is executing the code inside the method
   4
   now we are back in the method
=> here the |i| is the placeholder for the argument
---
*replaces #collect*
def hello(array)
  i = 0
  collection = []
  while i < array.length
    collection << yield(array[i])
    i += 1
  end
  collection
end
---
*replaces #each*
def my_each(arr)
  i = 0
  while i < arr.length
    yield(arr[i])
    i += 1
  end
  arr
end
---
*replaces #find*
def my_find(collection)
  i = 0
  while i < collection.length
    return collection[i] if yield(collection[i])
    i = i + 1
  end
end

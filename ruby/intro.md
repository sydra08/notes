**as Rubyists, we like to think about design. Is our code needlessly complex? Are our methods too long? Is our code self-explanatory––i.e., can someone reading it easily understand what it does? These are good questions to keep in mind as you learn to build more and more complicated programs. In fact, Ruby is a language that lends itself particularly well to elegant design.**

*"code smell" = a piece of code that is needlessly complex or difficult to read.*

REPL = read eval print loop
irb = interactive ruby
run by computer's terminal, not a file where you save work
helps you test and manipulate code to you can solve problems
type irb to start and exit to leave

----
VARIABLES
- create ref or abstraction to literal data
- store information
- snake case (underscores between words): this_is_an_example_of_snake_case
- variable names start with lowercase letter
  - cannot be a Ruby reserved word
  - cannot start with a number
  - cannot use punctuation or space character
- *constant* is a variable that starts with uppercase letter
- values can change even when the name doesn't
- set variables with =
  variable_name = variable_value
-----
Interpolation
- assigning variables don't need "var" like you do in JS
- interpolate variables into strings:
  - use #{variable} *preferred*
      answer = "flamboyance"
      puts "A group of flamingos is called a #{answer}."
  - use "string" + variable + "more of the string" (must use "" not '')
      answer = "Flamboyance"
      puts "A group of flamingos is called a " + answer + "."
- use snake case (underscores between words)
- all lowercase (constants start with uppercase)
- pass by value => when the value of a var is copied to function (not destructive)
- pass by reference => alters the variable
- can only use double quotes in interpolation
- bc ruby is a dynamically typed language, the values of variables can change types
- ruby is a strongly typed language
  => variables are never automatically coerced into another type unless you change it yourself
- you can use more than just #{} to pass in variables
- you can also run arbitrary code in the middle of a String
  ie.
    puts "1 plus 1 is #{1 + 1}!"
    #it will print "1 plus 1 is 2!"
- you can also access and print items from an array
  ie.
    bob = ["Bob", 46, "Juggler"]
    puts "#{bob[0]}"
    #prints 'Bob'

*pass-by-value of a variable*
-essentially a copy of the variable's value
-generally passed to things that alter the variable
-keeps the original variable intact
ie.
  sound = "squeak"
  sound.upcase => "SQUEAK"
  sound => "squeak"

pass-by-reference
-changes to a variable are done to the original

-----

abstraction

- helps to make code eloquent and efficient
- Repetition and abstraction in programming go hand-in-hand.

-----
RECURSION

- repeated application of the same procedure
- usually done by calling a method inside of that method

-----
Constant
- variable that has a larger scope than local variables
- methods can read values from them outside the method
- the variable type to use for data that's unlikely to change
- use a capital letter to signify it as a constant

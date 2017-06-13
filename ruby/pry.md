Pry

- type of REPL
- use it to debug a program
- Ruby installs with IRB (its own REPL)
- more flexible than IRB
  - IRB is a brand new interactive environment
    => you have to copy and paste your code into it
  - you can inject Pry into your program

=> binding.pry
  - 'pry' into the current binding/context of code from outside of the file
  - the line gets interpreted at runtime
  - freezes the program and the terminal turns into a REPL
  - to use pry in a program, you have to **require 'pry'**  
  - you can call variables that occur before binding.pry
    - ones that come after it will return "nil"
      - the REPL doesn't know about it yet
  - exit to leave pry console

Binding = built-in Ruby class
  - objects can encapsulate the context of your current scope (variables, methods etc.)
    =>retain them for use outside of that context


example:

require 'pry'

def prying_into_the_method
	inside_the_method = "We're inside the method"
	puts inside_the_method
	puts "We're about to stop because of pry!"
	binding.pry
	this_variable_hasnt_been_interpreted_yet = "The program froze before it could read me!"
	puts this_variable_hasnt_been_interpreted_yet
end

prying_into_the_method

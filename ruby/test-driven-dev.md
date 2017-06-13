TEST DRIVEN DEVELOPMENT (TDD)
think about what you want the program to do before you start to code
write tests before you write the code
1) identify the desired behavior
2) write the code that makes the test pass

**A test is always going to be about \
 setting up a state with a known result \
 and comparing that known result or expectation \
 to the behavior of your program, \
 thus ensuring that your program behaves as you expected.**

RSpec Testing Framework - http://rspec.info/

require_relative '../[filename].rb'
  --> tells it where the program file with the code is
describe => "[method name] method" do
      - accepts a block (do end)
  --> tell us what method the test describes
it => "[what does the function do] do"
-->"it" = RSpec method; only specify ONE desired outcome/behavior
      - accepts a block (do end)
expect() => method that takes our unknown value/variable (aka what we're testing)
to eq() => chain the #to to the expect and state the value you expect it to be
--> "do" = Ruby keyword
--> "eq" =
-->RSpec language - tells us what the method does
next lines actually run the tests
  action and then expectation
  ie.
    describe "fizzbuzz" do
      it 'returns "Fizz" when the number is divisible by 3' do
        fizz_3 = fizzbuzz(3)

        expect(fizz_3).to eq("Fizz")
      end
    end

block = unit of code

*refer to Rspec Fizzbuzz lab for more info, if needed*

rspec --fail-fast
-->test will run and only stop at the first failure it encounters

----

Error Messages:

example
  lib/a_name_error.rb:3:in `<main>': undefined
  local variable or method `hello_world' for
  main:Object (NameError)

3 parts:
1) "where"
lib/a_name_error.rb:3:in `<main>':
=>file, code line, and scope

2)"why"
undefined local variable or method `hello_world' for main:Object
=>what it thinks went wrong

3) "who"
(NameError)
=> Ruby Error Type

---
Error Types:

1) NAME ERRORS
given name is invalid or undefined
=>Ruby doesn't recognize the word
==>usually need to define a variable or method

2) SYNTAX
incorrect syntax/nonsensical code
=>usually will tell you what they think went wrong

3) TYPE ERROR
when you try to do a mathematical operation on 2 objects of different type
=> ie number + string

4) DIVISION ERROR
number divided by 0

-----

Tests
- written using the RSpec testing library
- help make sure your program is working properly
- usually call on methods used in code

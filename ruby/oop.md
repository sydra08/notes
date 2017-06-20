**global variables should only be used by the interpreter program**

object-oriented programming
  - helps to make programs easier to develop, modify, and understand
  - involves a lot of abstraction (stripping away details to get to fundamental structure)
    - separate the data from the operations (methods) you perform on it
  - bring metaphors to programming
- "Primitives"
  - String
  - Integer
  - Array
---
HISTORY

- started with Xerox 914 in 1959
- Alan Kay and Adele Goldberg at XPARC
  => invent all of the things!
  WIMP => window, icon, menu, pointer
-
---
OBJECTS

*An object in code is a thing with all the data and all the logic required to complete a task. Objects are models and metaphors for the problems we solve in code.*

- the only thing you can do on objects is call methods on them
----
CLASS + INSTANCES

RESPONSIBILITY => is it the class or the instance?

CLASS
- a "blueprint" that defines how to build an object (behavior and info)
  ie. blueprints show how to build a house but are not the actual house
- you can define INSTANCE METHODS inside of the class definition

class ClassName
  #some code here
end

defining a class:
- name starts with capital letters
- uses CamelCase

- class variable => belongs to the class and not the instance; scoped to the class
  - @@class_variable
  - set them at the top of your class definition

- :: => name space; scope
  - access class variables?


  class Dog
  @@all = []
    def Dog.all #class method (class reader)
      @@all
    end

    def self.find_by_name(name) #class finder
      @@all.detect{|b| b.name == name}
    end

  end


- *self*
  - class method
  - you can also just call the class name, but that could be bad if you change the class name
  - for method calls
  - always refers to the object that you are currently inside
  - good idea to use it when defining classes bc it's more explicit and helpful for debugging
  - implicit receiver of every single method you call
      class Integer
        def weird?
          odd?
        end
      end

      8.weird? => false; odd? == self.odd?
  ie. self.all

INSTANCE
- single occurrence of an object (the individual object made from the class)
- create an instance of a class:
    variable_name = ClassName.new
    *the .new INSTANTIATES a new instance*
      - instantiation = bringing an object to life
- each instance is totally unique
- instance variable => variable scope is to the instance; can be read inside of the object
  => denoted by @variable_name
  - internal state => belonging to the object/instance itself but to no other part of the program; allows object to keep track of own data

HOISTING => when you raise the scope
  ie. cast the local variable to an instance variable

Ruby Object Notation
ie. #<Dog:0x007fc52c2cc588>
- when you create or deal with an instance of a class, Ruby shows you the object identifier for it
- object identifier tells where the object lives inside your comp
- all objects have ids

#object_id
- instance.object_id => returns the object id

Dot Notation
- how to send messages to objects
- receiver = object that received the method message
- message = method

#methods
- returns array of all methods and messages an object responds to
- ie. fido.methods
- callback/hook
- #== is a method!
- "writer method"
  - #name=
    - set a name
  - take value and write it to variables
- "reader method"
  - #name
    - ask for a name


Instance Method
- methods that are defined within the object's class
- def them inside of the class definition
- they cannot be called without an instance (not globally available)
- wrapping behaviors inside of instance methods makes the program easier to debug
ie.
class Dog
  def bark
    puts "Woof!"
  end
end

fido = Dog.new
fido.bark #> "Woof!"

snoopy = Dog.new
snoopy.bark #> "Woof!"

INSTANCE VARIABLE
- how to get data inside of an object instance
- variable accessible in any instance method inside of a class
- bound to the instance of a class
- usually contains info about/attribute of the instance
- can be called on throughout the class without needing to pass it to methods as args
- preface the variable name with @
- also set an instance var with var.instance_variable_set(:@inst_var, "content")
  - and retrieve them with var.instance_variable_get(:@inst_var)
  - but this is ugly and decreases readability of code
  - it also depends on a literal, concrete variable & exposes the variable to the executor
    - bad practice bc the program then relies on that specific variable
    - prevents the program from being flexible

class Dog
  def name=(dog_name)
    @this_dogs_name = dog_name
  end

  def name
    @this_dogs_name
  end
end

* #name=(dog_name) is the "name equals" method (sets the name)
=> takes the argument and sets it to a variable
* #name gets the dog's name that was set in the preceding method

--

SETTER vs GETTER methods
"setter" => #name=(arg_name)
  - makes the attribute writable; uses = sign
  - use dot notation to call the method and set a new value
"getter" => #name (reader method)

class Person

  def initialize(name)
    @name = name
    self.say_hi #explicit receiver of self
    say_hi #implicit receiver of self
  end

  def name
    @name
  end

  def name=(new_name)
    @name = new_name
  end

  def say_hi
    puts "Hello"
  end

end

kanye = Person.new("Kanye")

kanye.name #=> "Kanye"

kanye.name = "Yeezy"
kanye.name #=> "Yeezy"

---
#INITIALIZE
- assign instances different attributes/behavior when they are instantiated
- automatically called whenever you call #new
- not necessary when you define a class
- callback method
  - bc it's automatically invoked when you create a new instance of the class
- constructor method
  - invoked upon the creation of an instance of a class
  - used to help define the instance of that class
- put things here that you don't want people to change willy nilly (ie. birth date)

class Dog
  def initialize(breed)
    @breed = breed
  end

  def breed=(breed)
    @breed = breed
  end

  def breed
    @breed
  end
end

lassie = Dog.new("Collie")
lassie.breed #=> "Collie"

----
Procedural Programming
  - data and the procedures for operating on the data
  - 2 separate things
  - ie. Tic Tac Toe => each method had to take the board as an arg
    => data and instructions were separate
  - esp in Tic Tac Toe, continually passing the board around could cause errors
    => we want to teach our objects to manage their own data!
Object-Oriented Programming
  - units of code that contain data and instructions
  - each object is its own data structure
  - methods usu. don't require args, can rely on the internal state of the object instead
  -
class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
end

---

REFACTORING PROCEDURAL TO OOP
* Anything that works procedurally can also work in object-oriented fashion*
(very important to know how to move between these styles)
1) find data the methods rely on
  a) is the data related to the core functionality of the program?
    - should it just be part of #initialize ?
    - can the class create the data structure itself?
2) is data being passed around as arguments in the methods?
  a) could the data be an instance variable instead?
3) is there code that's not contained in a method? could it be contained?
  a) could it become a behavior of your object?

---
MACRO

- metaprogramming = the writing of programs that operate on other programs
  - useful for automating repetitive tasks or providing a mini-language inside of another programming language  
  - but can also result in hard to follow code
- a method that returns more Ruby code instead of a Ruby datatype
- *The usage of macros is preferred over the explicit definition of setter and getter methods, unless you need to customize the implementation of a method*


class Person
  attr_writer :name
  attr_reader :name

end

class Person (EXPLICIT)

  def name=(name)
    @name = name
  end

  def name
    @name
  end
end

class Person
  attr_accessor :name
end

*attr_accessor :name, :weight, :eye_color, etc*
  - shortcut (MACRO) to avoiding having to spell out the reader and writer for each attribute you want to give your object
  - every one comes with 2 methods
  - when you start out you can put as many things you want here and then convert some of them to just writers or readers later on
*attr_writer*
  - create just writers
  - ie. name=()
*attr_reader*
  - create just readers
  - ie. name

---
OBJECT COLLABORATION
- you can set another class instance to be an attribute of another class instance
- you can reciprocate the relationships


----
Class Constant
- available to all instances of a particular class
- usually signified by all caps

:: => "name spacing"
  - the thing on the right is a thing defined within the context (name space) of the thing on the left

---
**In object orientation, we think of our classes as templates for objects. The instances of our classes are thought of as objects.**
---
DOMAIN MODEL
- representation of real-world concepts in software

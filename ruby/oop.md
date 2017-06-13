object-oriented programming
  - helps to make programs easier to develop, modify, and understand
  - involves a lot of abstraction (stripping away details to get to fundamental structure)
    - separate the data from the operations (methods) you perform on it
- "Primitives"
  - String
  - Integer
  - Array

----
CLASS + INSTANCES

CLASS
- a "blueprint" that defines how to build an object (behavior and info)
  ie. blueprints show how to build a house but are not the actual house
- you can define INSTANCE METHODS inside of the class deinition

class ClassName
  #some code here
end

defining a class:
- name starts with capital letters
- uses CamelCase

INSTANCE
- single occurrence of an object (the individual object made from the class)
- create an instance of a class:
    variable_name = ClassName.new
    *the .new INSTANTIATES a new instance
- each instance is totally unique

Ruby Object Notation
ie. #<Dog:0x007fc52c2cc588>
- when you create or deal with an instance of a class, Ruby shows you the object identifier for it
- object identifier tells where the object lives inside your comp

#object_id
- instance.object_id => returns the object id

Dot Notation
- how to send messages to objects
- receiver = object that received the method message
- message = method

#methods
- returns array of all methods and messages an object responds to
- ie. fido.methods

Instance Method
- methods that are defined within the object's class
- def them inside of the class definition
- they cannot be called without an instance (not globally available)
- wrapping behaviors inside of instance methods makes the program eaiser to debug
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
  end

  def name
    @name
  end

  def name=(new_name)
    @name = new_name
  end

end

kanye = Person.new("Kanye")

kanye.name #=> "Kanye"

kanye.name = "Yeezy"
kanye.name #=> "Yeezy"

#INITIALIZE
- assign instances different attributes/behavior when they are instantiated
- automatically called whenever you call #new
- callback method
  - bc it's automatically invoked when you create a new instance of the class
- constructor method
  - invoked upon the creation of an instance of a class
  - used to help define the instance of that class

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

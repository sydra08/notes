Data Types

STRINGS
.class => call it on something and it'll give you the type
-literal vs class constructor methods
  -literal: "Hello"
  -class constructor: String.new("Hello")
- every time you create a string, ruby creates a new object in memory, even if the text is identical
- strings are mutable (modifiable)

BOOLEANS
-don't operate on them
-true/false

NUMBERS
-Fixnums = whole numbers
-Floats = decimals
-.floor (round down to nearest fixnum)
-.ceil (round up)
-.next (next number)

SYMBOLS
-rep of a piece of data
  ie. :my_symbol
-unlike strings, they do not take up new areas of memory every time they are used

ARRAYS
-collection of objects
-literal and class constructors
  -literal: [2,3,4,6]
  -class: Array.new()
-best not to create arrays with mixed data types


HASHES
-store objects like arrays, but function more like dictionaries
-key/value pairs
  {"key" => "value"}
-literal and class constructors
  -literal: {"1" => "hello"}
  -class: Hash.new

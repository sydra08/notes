HASHES

- store data in an associated manner
- you can group you data into categories
- keys = string/integer/symbol
  - set equal to associated value with => ("hash rocket")
  - you can use it to store pairs of item/count
- each key/value pair describes a unique attribute or unit of information.
- LITERAL: my_hash = {}
- to access data: my_hash[key]
   - "bracket method"
- to add data: my_hash[new_key]= new_value
  - because hashes are not numbered/indexed lists so using shovel (<<) method isn't ideal
- ie. JS dictionary
+ hash = {"key" => "value", "another_key" => "another value"}
+ dictionary = {
  "apple" => "a delicious fruit",
  "this readme" => "wonderful and informative piece of reading",
  "Moby Dick" => "a novel by my good friend, Herman Melville"
  }
+ old_fashioned_things = {
  "whale bone corset" => 5,
  "porcelain vase" => 2,
  "oil painting" => 3
  }


SYMBOLS
- :i_am_a_symbol
- a symbol can't be changed (immutable)
- since hash keys don't need to be mutable it takes up less space to store keys as symbols
- flatiron_school = {instructor: "Isaac Newton"}
  - newer version of ruby uses {key: value} instead of {:key => value}

- with hashes you typically see #collect to get the values or data from an iteration
      birthday_kids.collect do |kids_name, age|
          age
      end
      => returns an array with all of the ages

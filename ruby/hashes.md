HASHES

- store data in an associated manner
- you can group you data into categories
- keys = string/integer/symbol
  - set equal to associated value with => ("hash rocket")
  - you can use it to store pairs of item/count
- each key/value pair describes a unique attribute or unit of information.
- value = can be a single value or a collection of objects
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
+ flatiron_school = {
  instructors: ["Avi", "Jeff", "Rose"],
  dev_team: ["Jonas", "Logan", "Amanda", "Seiji", "Kate", "Spencer"]
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

---
Nested Hashes

    contacts = {
      "Jon Snow" => {
        name: "Jon",
        email: "jon_snow@thewall.we",
        favorite_ice_cream_flavors: ["chocolate", "vanilla"]  },
      "Freddy Mercury" => {
        name: "Freddy",
        email: "freddy@mercury.com",
        favorite_ice_cream_flavors: ["strawberry", "cookie dough", "mint chip"]
      }
    }

- good to store and operate on complex associated data in a program
- definitely encounter when working with APIs
  - look at NYC Open Data
- you can still add to nested hashes:
  - you can add to an array inside the hash
    - ie. contacts["Jon Snow"][:favorite_ice_cream_flavors] << "mint chip" #=> add mint chip to the list of favorite flavors
  - you can add a new key/value pair to one of the nested hashes
    1) access the hash level that you want to add the key/value pair to
    2) create the new key value with [ ] notation
      ie. contacts["Jon Snow"][:address] = "The Lord Commander's Rooms, The Wall, Westeros"

- iterating over nested hashes: you may need to nest iterators in order to access the necessary info

METHODS

#values => collect all of the values in a hash as an array

#keys => collect all of the keys in a hash as an array

#min => return array with the key/value pair whose key is the lowest value

#flatten => you can use this to turn an array of arrays into one (flat) array


def remove_strawberry(contacts)
  contacts.each do |person, contact_details_hash|
    contact_details_hash.each do |attribute, data|
      if attribute == :favorite_ice_cream_flavors
        data.delete_if {|ice_cream| ice_cream == "strawberry"}
      end
    end
  end
end
 => remove strawberry ice cream from the favorite_ice_cream_flavors array

ARRAYS

- unlike variables they store more than one piece of information
- store info in list form
- can be set to a variable, you can change the data
- combination of data types (string, integer, booleans, other arrays, hashes, etc)
- index starts at 0
- to access elements: array[index]
  => if you try to access an element at an index that doesn't exist you'll get 'nil'
- square [] brackets
- Class Constructor
  my_array = Array.new => [ ]
- Literal Constructor
  variable_name = ["item 1", 2, "item 3", true, false, 6]
----

Nested Arrays
you can have nested array (array within an array, etc)
  - accessing data:
      nested_students = [
        ["Mike", "Grade 10", "A average"],
        ["Tim", "Grade 10", "C average"],
        ["Monique", "Grade 11", "B average"]
        ]

      nested_students[0][0] #=> "Mike"
- to add data to a nested array you will access the nested array and then use <<

ie.
students = ["Mike", "Tim", "Monique"]
nested_students[2] << "Class President"
  => adds Class Pres to Monique's info
- you can iterate using #each
- you can also nest your iterations
ie.
nested_students = [
["Mike", "Grade 10", "A average"],
["Tim", "Grade 10", "C average"],
["Monique", "Grade 11", "B average", "Class President"]
]

nested_students.each do |student_array|
  student_array.each do |student_detail|
    puts student_detail
  end
end
=> get each detail of each array

----
- multidimensional arrays => store hierarchical data (max 4 levels, otherwise use a dictionary or hash)
ie. artist > album > songs
music_library = [["Adele", ["19", ["Day Dreamer", "Best for Last"]],
  ["21", ["Rolling in the Deep", "Rumor Has It"]]],
  ["Beyonce", ["4", ["1 + 1", "Countdown"]],
  ["Beyonce", ["Haunted", "Pretty Hurts"]]]]

  music_library.each do |artist_array|
    artist_array.each do |artist_element|
      if artist_element.class != Array
        puts "Artist: #{artist_element}"
      else
        artist_element.each do |album_element|
          if album_element.class != Array
            puts "Album: #{album_element}"
          else
            album_element.each do |song_element|
              puts "Song: #{song_element}"
            end
          end
        end
      end
    end
  end

----
Conversions

+ string => array
  - .split() => convert a string into an array; argument is the separator
    "hippo,giraffe,monkey,horse".split(",")
      => ["hippo", "giraffe", "monkey", "horse"]

+ range => array
  - .to_a => convert a range of numbers into an array
    (1..10).to_a
      => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

+ array => string
  - .join() => convert array to string; optional argument of the char(s) to be inserted between each array element (default is "")
    ["a", "b", "c"].join
      => "abc"

    ["a", "b", "c"].join(" :-) ")
      => "a :-) b :-) c"

----
ARRAY METHODS

- Adding elements:
  + << "shovel" operator will add one element to the end of an array (most popular)
    famous_cats = ["lil' bub", "grumpy cat", "Maru"]
    famous_cats << "nala cat"
    famous_cats #=> ["lil' bub", "grumpy cat", "Maru", "nala cat"]

  + .push() => add multiple elements to end of array
    famous_cats.push('simba')
      => ["lil' bub", "grumpy cat", "Maru", "nala cat", "simba"]

  + .unshift() => add element to the front of array
    famous_cats.unshift('tabitha')
      => ["tabitha, ""lil' bub", "grumpy cat", "Maru", "nala cat", "simba"]
---
- Removing elements:
  + .pop() => removes last item from end of array and returns that element
    last_cat = famous_cats.pop => "simba"
    famous_cats.inspect => ["tabitha, ""lil' bub", "grumpy cat", "Maru", "nala cat"]

  + .shift() => removes first item from front of array and returns it
    => first_cat = famous_cats.shift => "tabitha"
    famous_cats.inspect => ["lil' bub", "grumpy cat", "Maru", "nala cat"]
----
+ .reverse => reverse the order of the array
+ .include?() => returns boolean of whether or not array contains element
+ .inspect => returns string of the list of strings in an array
+ .first => first element in array
+ .last => last element in array
+ .index() => returns the first index of an element that matches the argument. if nothing matching it returns 'nil'. not used often because you typically use the index to access the info and not the other way around
  my_array = ["yoga", "soccer", "running"]
  my_array.index("soccer") => 1
+ .sort => sorts the array (A-Z or 0-10)
  => works by implicitly comparing elements with the "spaceship" operator <=> and moves them accordingly
  => does not affect the original array
  => returns a new array that you will usually want to store in a new variable
+ .sort! => will sort the original array. you will not have to store it in a new one
+ .size => returns the number of elements in an array
+ .collect => creates a new array that contains the values returned by the block (like #each but new array is returned)
*'!' is a ruby convention that says do the operation in place - modifies the receiver of the dot method*

+ #each
  - remember that this does not change the return value
  - it implicitly returns the original array
  - *use when you want to return the original return value*
  - to capture the results of #each you can create a new array to capture those elements and explicitly return it after the loops
  - this implicitly takes a block as its argument and yields each element to the block

+ #map (this can be used interchangeably with #collect)
  - an abstraction of #each
  - will implicitly return the new values and change the original value
  - *use when you want to the transformations to be reflected in the return value*
      toppings = ["pickles", "mushrooms", "bacon"]

      def hamburger(toppings)
        toppings.map do |topping|
          puts "I love #{topping} on my burgers!"
        end
      end
      => Prints:
         I love pickles on my burgers!
         I love mushrooms on my burgers!
         I love bacon on my burgers!
         Returns: [nil, nil, nil]

+ #collect (this can be used interchangeably with #map)
  - an abstraction of #each  
  - will implicitly return the new values and change the original value
  - this implicitly takes a block as its argument and yields each element to the block
  - *use when you want to the transformations to be reflected in the return value*
      toppings = ["pickles", "mushrooms", "bacon"]
      def burger(toppings)
        toppings.collect do |topping|
          "I love #{topping} on my burgers"
        end
      end
      => Returns: ["I love pickles on my burgers", "I love mushrooms on my burgers", "I love bacon on my burgers"]

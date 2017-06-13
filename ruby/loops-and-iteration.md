
LOOPING vs ITERATION

- *looping* = tell your program to do something a certain number of times
- *iteration* = have a collection of data and operate on each item of that collection
  ie. enumeration

* the goal of abstraction is to remove details
  => "Brevity for the sake of brevity is silly, but our goal is to always express ourselves as clearly and honestly as possible."

---
LOOPING

- tell our programs do something over and over again in a few lines of code instead of manually writing out the repetition
- basic principle: it allows us to "abstract away" the mechanics of repeating the same/similar code a certain number of times
---
TIMES

number.times do
  some code here
end

ie.
    jewels_in_bag = 100
    3.times do
      puts "Hiding 10 stolen jewels."
      jewels_in_bag = jewels_in_bag - 10
      puts "Now there are only #{jewels_in_bag} jewels left to hide!"
    end
    puts "We have #{jewels_in_bag} jewels still to hide!"

- code becomes easier to read and write this way
---
LOOP
- simplest way to construct a loop (this one below runs infinitely bc no constraint)
- least abstract method

ie. loop do
      code
    end

- break keyword => exit/abort loop and continue with the rest of our code
  - can use it with an iteration count to help execute code a specific number of times

ie.
counter = 0
loop do
  counter += 1
  puts "Iteration #{counter} of the loop"
  if counter >= 10
    break
  end
end

+= --> incrementing; add a new increment to a known value
---
while/until loops

WHILE
- execute a block as long as a specific condition is true
- a little more abstract than Loop
- because the conditional is set early on, you do not need to explicitly break the loop

ie. while the counter is less than 20, do something
counter = 0
while counter < 20
  puts "The current number is less than 20."
  counter += 1
end

UNTIL ("if not")
- inverse of while loops
- execute a block of code until a condition is true

ie. until the counter is 20, execute the code
counter = 0
until counter == 20
  puts "The current number is less than 20."
  counter += 1
end

----
ITERATORS
- use when you want to operate on a collection/set of data

+ #each
  - takes each element of an array and yields it to the block of code. each element is made available to the block via the variable between the | |  
  - the block is executed once for each element in the collection
    - iteration = each step/execution of a block; the singular execution of a sequence of code (block) within a loop.
      - *block* = chunk of code between { } or do/end keywords
         - you can pass to a method (similar to passing an arg to a method)
  - you use || (pipes) to declare the local variable that the current element gets assigned to (or that the argument gets passed to)
    - the variable within the pipes automatically gets set to the next element in the collection
  - notice you don't need a counter variable here
  - *the return value is the original collection (static return value)*
  - the most abstract
    - "All the details of the algorithm are removed and replaced with the intention of our code, not the implementation of the algorithm."

ie.
primary_colors = ["Red", "Yellow", "Blue"]
primary_colors.each do |color|
  puts "Primary Color #{color} is #{color.length} letters long."
end

output:
Primary Color Red is 3 letters long.
Primary Color Yellow is 6 letters long.
Primary Color Blue is 4 letters long.

- instead of do/end you can use {} => usually used when the code is short/one line
ie.
brothers = ["Tim", "Tom", "Jim"]
brothers.each{|brother| puts "Stop hitting yourself #{brother}!"}

----

#each_with_index
- #each but also passes the index in 
["cat","dog","bat"].each_with_index{|item,index| hash[item]=index}
  => {"cat"=>0, "dog"=>1, "bat"=>2}

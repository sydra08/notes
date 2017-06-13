`` => to use ${} when referring to a variable in a string
Object.keys => creates an array of Object keys
easier way to iterate thru is for/in => gives you index in order

----

to use a variable in a string, you need to put it into square brackets
for example:
function addToCart(item) {
  var price = Math.round(Math.random() * 100); <= this is the price
  cart.push({[item]:price}); <= [item] = the 'item' argument that you pass into the function
  console.log(`${item} has been added to your cart.`)
  return cart;
}
addToCart(puzzle) => [{puzzle: 48}]

----

array.splice(index to remove at, # items to remove, items to add)

----

callbacks
functions as arguments for other functions
useful when you want to return a prev. function's context (esp. expensive ones)
Example:
function doTo5 (anything) {
  return anything(5);
}

function divide10ByN(n) {
  return 10/n;
}

doTo5(divide10ByN) => 2 (10/5 = 2)

----

for loops are weak bc they are useful for one-off tasks and explicit

forEach()
allows you to iterate over every element of the array w/o a for loop
forEach takes a function as its argument
that function can take up to 3 arguments
Example:

var evens = [0, 2, 4, 6, 8, 10]

for (var i = 0, l = evens.length; i < l; i++) {
  console.log(`${evens[i]} is not odd!`)
}
=> Becomes:

var evens = [0, 2, 4, 6, 8, 10]

evens.forEach(even => {
  console.log(`${even} is not odd!`)
})

----

function doToElementsInArray(array, callback) {
  array.forEach(callback)
}

=> allows us to create a generic function that accepts an array and a function
the array is the one to be iterated over via forEach()
the function is the callback for the forEach() function

----

debugger
globally available and opens up a window in your browser
allows you to jump around your code and inspect stuff

----

break (loops)
allows you to exit a loop after encountering a specific element

-----
const array = ["dog", 1, "cat"]

for (let i = 0, l = array.length; i < l; i++) {
  if (typeof array[i] !== 'string') {
    break
  }

  doSomethingToString(array[i])
}
------

need to put the action that you want to do the elements after the break
otherwise the function doesn't stop at the right time

----

return (loops)
helps you break out of loops, in a less buggy way than 'break'

----
function find(array, criteriaFunc) {
  for (let i = 0, l = array.length; i < l; i++) {
    if (criteriaFunc(array[i])) {
      return array[i]
    }
  }
}
=> generic function that takes an array and a function
function is called on each element of the array
returns the first element to return true based on the criteria function

----

continue (loops)
if you want to perform an operation on some parts of the array
------
const scores = [3, 4, 10, 5, 11, 6]

// increment all scores < 10
for (let i = 0, l < scores.length; i < l; i++) {
  if (scores[i] >= 10) {
    continue
  }

  scores[i]++
}

scores => [4, 5, 10, 6, 11, 7]
-----]

Nested Objects
for objects inside of objects: mainObject.subObject.key
for objects inside of arrays inside of objects: mainObject.array[index].key
for arrays inside of arrays: mainArray[index][subArray[index]][sub-subArray[index]]
--Example: const collections = [1, [2, [4, [5, [6]], 3]]]
=> to access 6 => collections[1][1][1][1][0]
here's the breakdown:
[1, [2, [4, [5, [6]], 3]]] // collections
[2, [4, [5, [6]], 3]]      // collections[1]
[4, [5, [6]], 3]           // collections[1][1]
[5, [6]]                   // collections[1][1][1]
[6]                        // collections[1][1][1][1]
6                          // collections[1][1][1][1][0]

----

function find(array, criteriaFn) {
  // initialize two variables, `current`, and `next`
  // `current` keeps track of the element that we're
  // currently on, just like we did when unpacking the
  // array above; `next` is itself an array that keeps
  // track of the elements (which might be arrays!) that
  // we haven't looked at yet
  let current = array
  let next = []

  // hey, a `while` loop! this loop will only
  // trigger if `current` is truthy — so when
  // we exhaust `next` and, below, attempt to
  // `shift()` `undefined` (when `next` is empty)
  // onto `current`, we'll exit the loop
  while (current) {
    // if `current` satisfies the `criteriaFn`, then
    // return it — recall that `return` will exit the
    // entire function!
    if (criteriaFn(current)) {
      return current
    }

    // if `current` is an array, we want to push all of
    // its elements (which might be arrays) onto `next`
    if (Array.isArray(current)) {
      for (let i = 0, l = current.length; i < l; i++) {
        next.push(current[i])
      }
    }

    // after pushing any children (if there
    // are any) of `current` onto `next`, we want to take
    // the first element of `next` and make it the
    // new `current` for the next pass of the `while`
    // loop
    current = next.shift()
  }

  // if we haven't
  return null
}

----

"A control flow construct is a language feature which disrupts the normal progression to the next statement and conditionally or unconditionally branches to another location in source code."
-Robert Klemme

structure:
if (condition) {
  do this thing if the condition is true;
}
else if (another condition) {
  do this thing if the condition is true;
}
else {
  do this other thing if the condition above is false (default condition);
}

-----

=== strict equality
== loose equality
= set variable value
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Equality_comparisons_and_sameness

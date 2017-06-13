//a global variable that is defined within a function cannot be called outside of the function until the function is called first
//var = sets a local variable when inside of a function, global if outside
//scope can be a bit confusing, especially with the outer/inner difference

/*var funkyFunction = function() {
  return function() {
    return "FUNKY!"
  }
}

// We want this to return a function that returns "FUNKY!" -- how can we accomplish that?
var theFunk = funkyFunction()();                                                //in order to call the inner function we have ()()  */

/* arrow functions in JS
instead of having to write var school = function() {}
you can write var school = (arguments - ditch () if only one) => {}
arrow functions give implicit returns*/

/* JavaScript has function-level scope, which means that functions have access
to variables that are defined outside of it
but any variables defined inside of a function are not accessible to the outside */

/* Variable hoisting is important to remember because
you want to define all variables at the top of the scope in which you need them.
Define all variables at the top of your functions. */

//functions are hoisted to the top of the scope so you can call a function before you define it

/* if you declare a function using "var"
then the function will not be hoisted to the top of the scope
and will be undefined*/

/* Arrays
literal: var tvShows = ["game of thrones", "true detective", "the good wife", "empire"];
constructor: var hello = new Array();
array.push() => add elements to end of array
array.unshift() => add element to beginning of array
spread doesn't change value of array [...array, element] or [element, ...array]
array.shift() => remove element from beginning of array
array.slice(index) => takes a slice from an array (not destructive)
array.pop() => removes element from end of array
array.splice(index, number to remove, number to add) */

/* Objects
literal: var meals = {};
constructor: var meals = new Object();
keys are always strings
keys must be unique
object.assign({object}) => create new object and give it properties from existing objects...
  so if keys are shared then the object to the right wins...
  can also use to non-destructively re-assign an object
delete object.key => removes key-value pair *\

/* Loops
for ([initialization - usually counter variable]; [condition - if true, statement is executed]; [iteration - +/- counter])
  { loop body [action to loop through]}
for/in
while
do/while
*/

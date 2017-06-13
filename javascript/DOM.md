DOM

**The Document Object Model is a representation of the current view of the browser, and can be manipulated without reloading a page.**
to view the Document Object Model => open the console and typing "document"
you can create, edit and remove doc elements in JS
-document.body.appendChild(element) => element appear in DOM
-var ### = document.createElement(element) => create element
-element.remove() => remove element or part of element
-----
-to interact with nodes on pages we listen for them
  ###.addEventListener(name of event, function to handle event)
-EVENTS: change, 'keydown', 'click', 'keyup', 'load', 'mouseover', 'mouseout', etc
  https://developer.mozilla.org/en-US/docs/Web/Events
-events have properties
  ie. which property => tells us which key was pressed
-you can prevent default behavior and you can interrupt the event's normal behavior
  stopPropagation
-one action can trigger multiple events
-DOM events propagate by bubbling and capturing
  bubbling => starts at the target node and goes up towards the root (standard)
  capturing => starts from target node's parent and goes down the tree to target
  **target node is the last to capture the event and the first to bubble the event up**

-----identify the event
  const main = document.getElementById('main');

  main.addEventListener('click', function(event) {
    alert('I was clicked!');
  })
---//prints the corresponding property for that key
  const input = document.querySelector('input');

  input.addEventListener('keydown', function(e) {
    console.log(e.which)
  })
-----//you can't enter the letter 'g' in the input console
const input = document.querySelector('input')

input.addEventListener('keydown', function(e) {
  if (e.which === 71) {
    return e.preventDefault()
  }
})
---

jQuery
-want to keep it separate from the HTML
-always put the jQuery scripts at the bottom of the HTML
  -that way pages don't take forever to render
    (browser loads everything in <head> before it attempts to render the page)
-$ === jQuery
-every line of jQuery code starts with $
  $('selector-goes-here')
-'.' denotes class
-'#' denotes id
-"" html tag
-descendant => $('parent child')
-children => $('parent-tag child-tag:first-child')
-alt tag => $("img[alt='the beatles making faces']")
-last => $('div:last')
-----
Attribute	| CSS Selector	| querySelector Code	| Alternative Method
id | "#"	| document.querySelector('#content')	| document.getElementById('content')
class	| "."	| document.querySelector.querySelector('.red')	| document.getElementByClassName('red')
html tag	| ""	| document.querySelector.querySelector('p')	| document.getElementByTagName('p')

** query selectors take different attributes so you need to specify which one you want

** you can be more specific in the element that you select from a page by nesting CSS selectors (ie. ul li)

-----
Event Listeners/Handlers
-code that "listens" for DOM events (clicks, etc) and triggers other code
-----
$('h1').on("eventname", function(){
    //action you want taken
});
  'on' binds event to HTML element that's been selected
    takes argument (event you want the user to take) and a function (what you want to happen)
-----
$('img').on('load', function(){
  //actions you want to happen
});
  'load' => triggers an action when the element it's called on is loaded
    usually done with images
-----
$(document).on('keypress'/'keyup'/'keydown', function(key) {
  if (key.which == 13){
    alert('enter was pressed');
  }
});
  keypress => every time a key is pressed (excl. alt, crtl, shift, esc)
  keydown => every time a key is pressed down
  keyup => every time a key press is released
  key.which => uses ASCII code for the key
-----
$("form").on("submit", function() {
  if ($( "input:first" ).val() === "correct") {
    alert('your form is going to be submitted now');
    return;
  }
  alert("you entered the wrong value");
  return;
});
  submits a form
-----
Moving Elements
-you can access and edit an element's style
  element.style.property (backgroundColor, left, bottom, height, width, etc)
-you can move elements in response to an event
  document.addEventListener('keydown', function(e) {
  console.log(e.which)
  })
  ==> add an event listener to the document
  => put this into the console and then press a key, it will give you the code for it

-----

function moveDodgerLeft() {
  var leftNumbers = dodger.style.left.replace('px', '')
  var left = parseInt(leftNumbers, 10)

  if (left > 0) {
    dodger.style.left = `${left - 1}px`
  }
}
==> this makes sure that you don't move outside of the container
-----
document.addEventListener('keydown', function(e) {
  if (e.which === 37) {
    moveDodgerLeft()
  }
})
==> this moves the dodger when you press the left arrow key



Javascript = allows you to bring interactivity to a browser
 => modify the HTML, listen/respond to events that occur in the browser, change HTML
 => React, Ember, Angular, NodeJS, React Native (iOS and Android apps), D3 (chart animation libe)
 => approx 85% full-stack devs use JS

XHR aka XMLHTTPrequest (XML-HTTP-request)
  => type of interactivity (ie Google Maps)
  => allows website to receive new data without a page refresh

AngularJS
  Framework introduced by Google in 2010; used by 10k+ companies (ie PayPal and Youtube)

React
  Framework introduced by Facebook in 2013; used by companies like Netflix, Yahoo! and Khan Academy

----

to load files into another you can do the following:
var index = require("./index.js")
and use "index.[variable]" to access variables from the loaded doc

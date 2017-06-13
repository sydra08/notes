CSS = Cascading Style Sheet

+ 3 distinct formats
  - inline
    - `<p style="font-style:italic;">Loren Ipsum</p>``
    - typically used in HTML newsletters
    - disadvantage = hard to change the style across many elements
  - internal/embedded
    - <style>
      p {color: red;}
      </style>
    - used inside html pages; only effects the selectors on the page that it's embedded into
  - **external**
    - p {color: red;}
    - have a CSS stylesheet that is linked to the html page
      - <link rel="stylesheet" href="style.css">
    - allows you to change styles site-wide from one location
      - link multiple html pages
      - helps with consistency!
+ syntax
  selector {declaration = property : value;}

+ makes your content look good
+ selectors => allow you to select diff elements on page
+ more specific the selector, the more authority it has
+ you can inherit properties from parent elements, if you want
+ you can specify colors via hex, rgb, rgba, hsl, hsla

+ **good idea to link to normalize.css before your own stylesheet => better cross-browser consistency and supports HTML5 elements in older browsers**
  - you can just get a link and not have to download it
  - 2 different file types
      https://cdnjs.com/libraries/normalize/
      1) https://cdnjs.com/libraries/normalize/
        => easy to read and understand, but bigger file size
      2) https://cdnjs.cloudflare.com/ajax/libs/normalize/7.0.0/normalize.min.css
        => compressed file, harder to read
+ **link to modernizer js library to cover you for CSS3 in other browsers**
  https://cdnjs.com/libraries/modernizr
  <script src=""></script>
---

SELECTORS

=>Type
ie. p {
      color: red;
    }
    => this selects the element with the matching element/type name

=> Class
ie. .thick {
      font-weight: bold;
    }
    .alert {
        color: red;
    }
    => this selects the element with the matching class name
    => you can apply 2 classes to an element
      ie. <p class="thick alert">text</p>
    => classes are for multiple elements spread across the page (unlike IDs)

=>ID
ie. #box {
      background: blue;
    }
    =>this selects the element with the matching ID name
      ie. <div id="box">I'm a box.</div>
    => good for when you want to give an element on the page a unique identity

=>Compound
ie. h1, h2, #box {
      font-family: Arial, Helvetica, sans-serif;
    }
    => this selects all of the matched elements in the set
      ie. <h1>Header</h1>
          <h2>Subhead</h2>
          <div id="box">I’m a box</div>
    => apply the same style across multiple selectors at once
    => as long as each selector is separated by a comma, you can mix types

=>Descendent
ie. #nav li {
      background: blue;
    }
    => selects an element that is nested inside the parent element
    => space between elements indicates the "descendent" property
      => descendants of the matching selector name (includes grandchildren)
      ie. <ul id="nav">
            <li>child</li>
          </ul>

=>Child (nested elements; inherit from parent)
ie. #list > li {
      color: black;
    }
    => select element (after the >) that's nested only one level deep inside the parent
    => only DIRECT children and not grandchildren (more specific than descendent selector)
    ie. <ul id="list”>
           <li>child
             <ul><li>grandchild</li></ul>
           </li>
         </ul>

=>Sibling (siblings are next to each other)
ie. h3 + p {
      color: green;
    }
    =>selects the element that appears directly after the matching selector name (after the +)
      => assumes that they are siblings (on the same level of nesting within the parent)
    ie. <h3>An h3 Element</h3>
        <p>I'm a p directly after an h3 element.</p>
        <p>Not selected</p>

=> Preceded Selector
ie. .styleafter ~ h2 {
      color: black;
    }
    =>selects all elements that are directly after the selector name
    => covers more than the sibling selector because it will pick everything that happens after the first selector (before the ~)

    ie. <p class="styleafter">Class of styleafter.</p>
        <h2>I'm an h2 positioned after</h2>

=>Universal
ie. * {
      color: orange;
    }
    => selects anything that has not been prev styled by anything else

=>Attribute
ie. img[alt="Cat"] {
      border: 1px solid black;
    }

    <img src="myimage.jpg" alt="Cat">
    => selects element with matching attribute
    => use [ ] after elements


    + other attributes include...
      + ^= selects elements that *start with* the matching value
        ie. a[href^="http"] => <a href="http://google.com">google</a>
      + $= selects elements that *end with* the matching value
        ie. p[class$="dog"] => <p class="bigbdog">...</a>
      + `*=` selects elements that have the value *anywhere within* the attribute
        ie. img[class*="love"] => <img src="myimage.jpg" alt="I love you.">
      + ~= selects elements that have the *value space separated* (value between spaces)
        ie. p[class~="monkey"] => <p class="zoo monkey details">...</p>
      + |= selects elements that contain the *value dash separated* (value between -value-)
        ie. p[class|="birds"] => <p class="new-birds-today">...</p>

=>Pseudo Class
ie. a:link {
      text-decoration: none;
    }
    => selects an element based on the unique relationship or event state described in the selector (:)

event states:
    + a:link => selects links in default state (not visited)
    + a:visited => links after user has clicked on them
    + a:hover => links when user is hovering
    + a:active => links when they are being clicked (when the mouse is being held down)
    + x:checked => radio/check box has been checked
    + x:before
    + x:after
    + div:not(#container) => negation; all divs that are not #container
unique relationships:
    + p:first-child => elements that are the first child inside a common parent
    + p:last-child => elements that are the last child inside a common parent
    + p::first-line => target first line of paragraph
    + ul > li:only-of-type => target <ul> that only have 1 <li>


  *not all psuedo class selectors are supported by all browsers*
----
Inheritance Rules

*the more specific a selector, the more authority it has*
ID > Class > Type > Universal
- if a specific selector is not defined for an element, it inherits styles from a previously defined general selector statement (ie. parent element)
- multiple classes -> class listed furthest to the right has the most authority over the ones to the left
- Uses “last man” rule. When conflicts with equal authority arise, CSS will listen to the last style it was told to apply.
----
Colors
- 147 color names, only 16 are standard
  - aqua, black, blue, fuchsia, (gray, grey), green, lime, maroon, navy, olive, purple, red, silver, teal, white, and yellow.
- Hexadecimal
  - 16,777,216 combinations (you eye can only see about 10 of the 16 million colors)
  - true colors
  - uses combo of 0-9 and A-F
  - ie. #FF0000
  - #AACC77 => #AC7
    - if they match on each of the 3 positions you can do shorthand

- RGB (Red Green Blue) & RGBA (Red Green Blue Alpha)
  - use scale of 0-255
  - mix red, green, blue
  - ie. rgb(100,86,92);
  - A (Alpha) is an add'l value from 0-1 (0%-100%) for opacity
  - ie. rgba(100,86,92,0.5)

*colorzilla.com => CSS Gradient Generator*
----
FONT DECLARATIONS

+ font-family: Arial, Helvetica, sans-serif;
   - specify the font used in the element
   - fall back to others listed if the system doesn't have it
   - if there are spaces in the font name wrap in ""
+ font-style: normal | italic;
  - default = normal
+ font-size: 100% | 1em | 12pt | 12px;
  - express in % (relative to parent elements), em (relative depending on fonts), pt (varies depending on browsers), px (exact amount)
  - default in most browsers is 16px (1em = ~16px)
+ font-weight: normal | bold;
  - default = normal
+ color: white | #fff | rgba(255,255,255,1);
+ font: bold 1em/2em Arial, sans-serif;
  - combine above properties in one declaration
  - font-size/line-height
  ie. figcaption {
        font-weight: normal;
        font-size: 0.75em;
        line-height: 1.5em;
        font-family: Georgia, "New Times Roman", serif;
      }
      => becomes:
      figcaption {
        font: normal 0.75em/1.5em Georgia, "New Times Roman", serif;
      }


custom fonts:
- google fonts is a GREAT resource
- add the custom font into your fonts folder
- using @import method means it MUST go at the top of tyour CSS stylesheet
  ie.
  @import url('https://fonts.googleapis.com/css?family=Elsie+Swash+Caps');
- to set:
@font-face {
    font-family: ‘Skolar’;
    src: url(../fonts/Skolar.webfont);
}

Google Fonts
- you can download the file to your comp or you can just link to it
  1) "add to collection"
  2) standard or @import method

@import => import other css code from elsewhere
----
TEXT DECLARATIONS
effect entire body of text

+ text-align: left | center | right;
+ text-decoration: none | underline | overline | line-through;
+ text-indent: 1% | 1em | 1pt | 1px;
  - only affects first line in paragraph
+ text-shadow: 3px 3px 10px #000;
  - (CSS3) drop shadow on text (horizontal, vertical, feather/blur radius, color)
+ text-transform: none | capitalize | lowercase | uppercase;
+ letter-spacing: normal | 1em | 12px | 12pt;
+ line-height: normal | 1em | 12px | 12pt;
+ word-spacing: normal | 1em | 12px | 12pt;
+ word-wrap: normal | break-word;
  - break-word => creates hyphen
+ white-space: normal | no-wrap;
---

comments: `/* */`
can be single or multi-line

----

digital color meter (OS X)
- built in program
- set values to different amounts
  - native (rgb)
- see the color values based on mouse placement
- cmd + shift + c => copies values to clipboard
  - makes it easier to copy into code

----
Architecture (a few different ideas)
- you can separate styles based on intent => websites are systems not individual pages

# Base (common styles and variables)
  – normalize.css
  – layout.css
  – typography.css

# Components (specific UI elements; no business logic)
  – alerts.css
  – buttons.css
  – forms.css
  – list.css
  – nav.css
  – tables.css

# Modules (different page sections; include business logic)
  – aside.css
  – footer.css
  – header.css

Object Oriented CSS
  => Nicole Sullivan
+ Separate structure from skin
  - abstract the layout of an element away from the theme of a site
+ Separate content from container
  - remove dependency of a parent element nesting children elements
  - elements need to inherit default styles + classes

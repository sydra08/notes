Box Model
- dictates how the browser sizes elements + how much space it takes up in the layout
  - padding (spacing inside element)
  - margin (spacing outside element)
  - border (color, styles)
- for each element there's a -top, -left, -right, and -bottom
  - allows you to be more specific for each side of the element you're styling
    ie. padding: 20px 30px;  
      - 20px refers to the top + bottom
      - 30px refers to the right + left
    ie. 20px 30px 40px
      - top, right/left, bottom
    ie. 20px 30px 40px 50px
      - top, right, bottom, left (goes clockwise)
    ie. 20px  
      - sets value for all sides
- there are 2 different box models:
  W3C model (Chrome, Firefox, Opera, Safari)
    - width = content area, but not padding, border, or margin
  Internet Explorer model
    - width = border, content, and padding area, but not margin
  - when you calculate true width you need content, padding and border
  - CSS 3: box-sizing property
    - helps you to size the box so that it works for both models
    - IE model = border-box
    - W3C model = content-box

----
Scaling elements
- if you don't set a height/width the box will be dependent on the content
- fixed (px)
  - pros: widths are the same for large and small screens
  - cons: doesn't always scale well/look good on different screens/not responsive
    ie. large screens = a lot of whitespace
- elastic (em)
  - pros: when you scale text it will keep containers in proportion with their content  
  - cons: a lot of trial and error bc it's dictated by text (text could cause boxes to collide)
- fluid (%)
  - pros: make full use of screen; better responsive design
  - cons: design has less control over what the user sees with regards to container sizes and where/how the text and media wrap
- mix/max sizing (set start and stop for when container starts/stops growing)
  - pros: behaves like a fluid element inside constraints, outside of it it's like a fixed element
  - cons: ???

- em => px
  #px/16px

- Content Overflow
  - overflow: visible | hidden | scroll | auto;
    - visible => see overflow
      - make sure to have a fixed height set
    - hidden => chop off text
    - scroll => scroll bar appears
    - auto =>

- <body> element is always 100% wide
- height of <body> is determined by content; but you can set it to be 100%

----
Display Property

Element Display

+ display: inline;
  - appears side by side
  - left/right margins do not overlap between elements
  - does not accept width or top and bottom margins
  - default for span (always as wide as the content), a (links), img,
  - "friendly hippies"
+ display: block;
  - displays one above the other, takes up the whole line
  - you can specify width and top and bottom margins
  - the top/bottom margin for blocks on top of each other overlap
    - ie. if they each have 10px then it will be 10px between them, not 20px
  - default for div, p, headings
  - "kings of the horizontal space"
+ display: inline-block;
  - displays side by side
  - allows top and bottom margins and width to be specified
+ display: table;
  - use to create columns
+ display: table-cell;
  - make elements look like they're table elements
  - you can specify width (otherwise determined by content)

----

Box Aesthetics

----

Floating

- pull elements to the L/R to create column structure
- affect elements that come after it, not before
- when you float all the elements inside of a parent element, the parent loses the height reference (collapsed parent)
  - use "clearfix" (create the class, name is standard in industry)
    => after all the of children in the selected element, it goes in and puts the "content"
  .clearfix:after {
    content: "."; (can be any text content you want)
    display: block;
    clear: both; (gives parent reference for height)
    visibility: hidden; (don't see the content you set)
    height: 0; (don't want to add to the box height)
    line-height: 0; (don't want to add to the box height)
  }

Clearing
- when you don't want stuff to be pulled into Floating
+ clear: both;
  - clear past the height of anything that's floating above it
  - a good example of this is when you want the footer to be positioned correctly
+ clear: left;
  - clear past the height of anything that's floating left
+ clear: right;
  - clear past the height of anything that's floating right

example
img {
  display: block; (this is because you want to add margin)
  float: left; (appear on left side of page)
  margin: 0 20px 10px 0; (add space between text)
}

Centering
- set margin: 0 auto;
  - auto = automatic margin on L + R (they will match)

Column structure
- padding alone may just push elements to new lines
  - remember that in W3C model, padding will be added to whatever width you've set for your cols/sections
- solutions:
  - box-sizing: border-box;
    - set to Internet Explorer model which includes border, content and padding
    - cross-browser support
      -webkit-box-sizing: border-box; (cross-browser support)
      -moz-box-sizing: border-box;
- unfortunately margins do not get included in this solution so you will need to subtract the margins from the width you've set
  ie. if you've added padding to the section holding the columns and have a dynamic width for each column at 33.333%, by using the border-box model the 33.333% will take the padding into account. if you want a 1% margin, you will need to adjust the widths to 31.333% so that the margins do not push content onto another line
- *to calculate the % width: width = (100 - (margin * number of columns))/number of columns*

----

Positioning

+ Relative => position: relative;
  - you can then "push" on the box (top, bottom, left, right) based on it's current position
    - top = push down
    - left = push right
      - you have to think about it as pushing on the edge
  - ie. .box {
          position: relative;
          top: 20px;
          left: 200px;
        }

+ Absolute => position: absolute;
  - refers to the relationship with the relatively positioned parent or within browser window
  - behaves differently if inside of parent w/o special positioning vs. w/special positioning
  - the values here refer to the position in browser/parent
  - ie. .box {
        position: absolute;
        top: 0;
        right: 0;
      }
      => 0 from the right and 0 from the top

+ Fixed => position: fixed;
  - similar to absolute positioning but the element stays in place when you scroll in the browser window
  - behaves differently if inside of parent w/o special positioning vs. w/special positioning
  - ie. .box {
        position: fixed;
        top: 0;
        right: 150px;
      }

----
Z-Index
- layer elements on top of each other
- default z-index = 0
- negative z-index => go behind things
- positive => go in front of things
- higher the number, the closer it is to the viewer
- lower the number, the farther it is from the viewer

----
**useful to set background colors for different sections so that you can see how they are behaving on the page**

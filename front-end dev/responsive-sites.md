BE LIKE WATER!
- make your site accessible and visually pleasing on different devices
- check different device widths by resizing your browser window
----
Modern Responsive Layout Techniques

OLD METHOD
- check the requesting devices header info (server-side)
  - usually requires you to build multiple sites (aka NOT IDEAL)
    - A LOT OF MAINTENANCE

NEW METHODS
1) Desktop Down (max-width)
  - design your site for desktop first
  - then make changes to the pages...
    - hide/move content based on the available screen area
    - switching to single column structure
    - "graceful degradation" => often removes features as the device gets smaller
2) Mobile Up (min-width)
  - design site for mobile first
  - then make changes to the pages...
    - add/move content based on the available screen area
    - switching to multi column structure
    - "progressive enhancement" => often adds features as the device gets larger
  - a lot of devs have been adopting this approach bc a lot more people are using their mobile devices to access content

*to decide on what approach to take, think about how the majority of users will be accessing the site - mobile or desktop?*

----

CSS3 Media Queries

@media [not|only] type [and] (expr) [,] … {
	rules
}
  => [not|only] = logical expression
  => type = device type
  => and = requires that the type and the (expr) are TRUE
  => , = "OR"
  => (expr) = condition expression that will eval to T/F; if T triggers the rules in {}
  **media queries automatically inherit all of the styles outside of the {} so you only need to write css for the properties you want to change.**

+ in desktop down the media queries usually handle the smaller screens
+ in mobile up the media queries usually handle the larger screens

+ size conditions can help - they all refer to the size of the devices viewport/screen size
  - min-width (triggers when a screen raises above a certain size)
  - max-width (triggers when a screen gets smaller than the specified size)
  - min-height
  - max-height

+ determining thresholds/break points:
  - **let your content determine the break points**
  - using Dev Tools and Emulators => discover where your content starts to break down => create media queries to solve the issues

+ device types (*only types with good support*):
  - *all*		       All Devices (default)
  - braille		Braille tactile feedback devices
  - embossed	Paged braille printers
  - handheld	Handheld devices
  - *print*		Printing or print preview
  - projection	Projected presentations
  - *screen*		Computer screen
  - speech		Speech synthesizers
  - tty		      Media using a fixed-pitch character grid (teletypes)
  - tv		      Television devices

+ logical keywords
  - and => both sides have to be true; more than one expression
  - not => negates result of expression (ie. not a particular type of device)
  - , => "OR"; more than one expression but only one has to be true
  - only => hide media queries from older browsers


example 1 (max-width):
```
/* initial style */
p { color: red; }

/* media query */
@media only screen and (max-width: 800px) {
  p { color: green; }
}
```
^ for devices whose screen size is within the condition (less than 801px) p text is green, otherwise it's red


example 2 (min-width):
```
/* initial style */
p { color: red; }

/* media query */
@media only screen and (min-width: 400px) {
  p { color: green; }
}
```
^ if screen size is >400px then p text is green, otherwise it is red

example 3 (min-width and max-width):
```
/* initial style */
p { color: red; }

/* media query */
@media only screen and (min-width: 400px) and (max-width: 800px) {
  p { color: green; }
}
```
^p text only changes to green for screens between 400px and 800px

----
Strategies:

+ Responsive Media
  - use % measurements so that the media fluidly fills the size of the container
  *pro tip: set our media to width: 100%; max-width: 100%; to give them flexible fluid widths, which causes them to expand to the size of their PARENT.*
    - This allows us to write fewer media queries as they will resize to accommodate the device automatically in most cases
      - ie. if you change the parent to 33.333% the media inside will adjust to fit that constraint
  ie. img, form, input, table, video, audio, iframe {
        width: 100%;
        max-width: 100%;
      }
    ^width is as wide as parent and no larger than it. height is done in proportion to everything

+ Responsive Type
  - use ems (instead of px or %) because they are relative measurement
    - ie. if you want your header text to always be 2.5x larger than your paragraph text
        body { font-size: 100%; }
        h1 { font-size: 2.5em; }
        p { font-size: 1em; }

        @media only screen and (max-width: 400px) {
          body { font-size: 130%; }  
        }
      ^because the body font-size is 100% then everything else is proportional to that. then your media query only has to cover 1 aspect

  - column-count property
    *Designers suggest that for optimum readability you want the measure of your text lines to be between 40 to 80 characters. Anything smaller or larger becomes a bit awkward to read.*
    - default column-count is one, meaning text is contained within one column
      - bigger screen => want more columns
        - column-gap sets space between columns
        - column-rule sets border
      ie. when the screen gets larger you get more columns
        ```
        article p {
          column-count: 1; /* This is the default so we don't really need to specify */
        }

        @media only screen and (min-width: 480px) {
          article p {
             -moz-column-count: 2;
             -webkit-column-count: 2;
             column-count: 2;      
          }
        }
        ```

+ Responsive Layout
  - adjust the wrapper size based on screen size
    => we might want to adjust our wrapper size to change between fluid (for smaller devices) to fixed (for larger devices).
      - on smaller devices being fluid will allow it to take up the max amount of space
      - but on larger devices you want your content to be centered and not get stretched too much
    1) desktop down (wrapped is fixed and changes to fluid when it's smaller):
      .wrapper {
        width: 960px;
      }

      @media only screen and (max-width: 980px) {
        .wrapper { width: 90%; }
      }
    2) mobile up (wrapper is fluid band changes to fixed when it's larger:
      .wrapper {
        width: 90%;
      }

      @media only screen and (min-width: 980px) {
        .wrapper { width: 960px; }
      }
  - column size and positioning
    - multi-column layouts look great on a large screen but squished on smaller ones
      - common strategy is to go from multi-column => single column
        - change floating columns to float:none;
    1) desktop down (multi-column default that changes to single column):
      .column {
        width: 33.333%;
        float: left;
      }

      @media only screen and (max-width: 600px) {
        .column {
          width: 100%;
          float: none;
        }
      }
    2) mobile up (single column default that changes to multi-column):
      .column {
        width: 100%;
        float: none;
      }

      @media only screen and (min-width: 600px) {
        .column {
          width: 33.333%;
          float: left;
        }
      }
+ Meta Device Width and Zoom Settings
  - Viewport = viewable area inside of the devices screen
    - some devices are set to zoom in/out to fit content (not friendly for media queries)

    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    ^viewport is exactly as wide as device; set initial scale to normal (no zoom)
    *Prevents devices from zooming out or in and instead rely on the media query styling to change the layout accordingly*

+ Support and JavaScript Fixes

----

you can use the dev tools to help you figure out what the best positioning is for things in your responsive site

when analyzing your site for different screen sizes think about the following...
1) element positioning
2) text size + padding
3) menu/nav bars => common strategy is to use a menu icon (think hamburger menu)
  <a class="menu-icon">&#9776;</a>

Bootstrap
- HTML, CSS and JS framework for developing responsive, mobile first projects on the web
- style guide => easier for devs to make websites faster
- mobile up
----
WHY?
- responsive => easily and efficiently scales sites and apps with a single code base using CSS media queries
- features => lots of documentation, common HTML elements, custom HTML and CSS components, and JQuery plugins
- flexible styling => ships with plain CSS, source code uses Less and Sass (CSS pre-processors)
- popularity => big community of users
- open source => hosted, developed, maintained on GitHub
- build quickly => easy to get started

Drawbacks?
- individuality => a lot of sites start to look the same bc people aren't customizing beyond the defaults
- non-content driven media queries => you can't set your own custom break points unless you use the source code version. this can cause unique content elements to look weird
- heavier than necessary => if you're not using all the features the file size gets big

----
Getting started

+ different download options:
project site: http://getbootstrap.com
github: https://github.com/twbs/bootstrap
  - compiled and minified CSS, JS and fonts. no docs or original source files (quick start, no customization)
  - source Less, JS and font files and docs. needs Less compiler and some setup (some customization)
  - Bootstrap ported from Less and Sass for easy use w Rail, Compass, or Sass-only projects (some customization)
+ you can link to Bootstrap via CDN (content delivery network)
  - http://bootstrapcdn.com (most popular)
  - http://cdnjs.com/libraries/twitter-bootstrap
.min => smaller file size but you can't modify it

1) download bootstrap
2) after you download it, you'll want to change the folder name to the name of your project and create an index.html file inside the root folder
3) set up index.html with basic markup stuff
  => use http://getbootstrap.com/getting-started/#template

---
Grid System

+ use container classes
  - <div class="container">...</div>
    => fixed width, auto centered, auto margins
  - <div class="container-fluid">...</div>
    => expand to stretch across whole screen, 100% width

+ row class to create vertical separation and wrap columns; will have width of container
  <div class="container">
    <div class="row">...</div>
  </div>

+ column (col) class to create horizontal separation; default grid allows for 12 columns
  - # is number of units it takes in 12 column structure
    - you can use different combinations of units to get different layouts
  - xs/sm/md/lg is the size that media queries cause it to collapse (break points)
  - more info on the sizing here: https://www.w3schools.com/bootstrap/bootstrap_grid_system.asp
    + col-xs-
      - <768px
      - horizontal (normal column structure) at all times
    + col-sm-
      - >=768px
      - vertical <768px, horizontal >=768px
    + col-md-
      - >= 992px
      - vertical <992px, horizontal >= 992px
    + col-lg-
      - >= 1200px
      - vertical <1200px, horizontal >= 1200px

    <div class="container">
      <div class="row">
        <div class="col-sm-4">...</div>
        <div class="col-sm-4">...</div>
        <div class="col-sm-4">...</div>
      </div>
    </div>

    <div class="container">
      <div class="row">
        <div class="col-sm-8">...</div>
        <div class="col-sm-4">...</div>
      </div>
    </div>
  - you can offset columns to shift them right col-size-offset-units
    - units = number of spaces

    <div class="container">
      <div class="row">
        <div class="col-sm-4 col-sm-offset-4">shift the col 4 right </div>
        <div class="col-sm-4">...</div>
      </div>
    </div>

  - you can use 'push' and 'pull' classes to change the order of columns. you use numbers to indicate how many column spaces to push/pull  
    - push => push them to the right
    - pull => pull them to the left

      <div class="container">
        <div class="row">
          <div class="col-sm-8 col-sm-push-4">push R 4 units</div>
          <div class="col-sm-4 col-sm-pull-8">pull L 8 units</div>
        </div>
      </div>

  - nesting columns: insert a row and then columns inside a row

    <div class="container">
      <div class="row">
        <div class="col-sm-8">
          <div class="row">
            <div class="col-sm-4">...</div>
            <div class="col-sm-4">...</div>
            <div class="col-sm-4">...</div>
          </div>
        </div>
        <div class="col-sm-4">...</div>
      </div>
    </div>
----
JS plugins

- need to link the bootstrap.js or bootstrap.min.js files in your HTML file
- most plugins will work by using the appropriate HTML markup
- some plugins will require using jQuerty selectors in an external JS file
  - documentation: http://getbootstrap.com/javascript/

Plugins:
- Modals
- Drop Menus
- Scroll Spy
- Tab Nav
- Tooltips
- Popover (alerts)
- Alert dialogues
- Accordions (expand/collapse)
- Affix Sidebar Page Progress (highlight the section title in sidebar)
- Carousel (images)
----
Images
- best practice is to resize them in photoshop to fit your site
- but if you want to cheat you can use media queries
  - good idea to stay true to the bootstrap break points
  - a good way to determine image heights is to divide the image width by 2 at the screen size/break point

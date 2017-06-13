-websites = collection of text files
-HTML is the most basic language that websites are built in
-think of HTML as the structure of the webpages

HTML = Hyper Text Markup Language

- wrap content in tags <open>content</close>
  - not everything has a close tag
  - <img> is a tag that does not have a close
- you can attributes (font size, class, id, etc) *only* to start tags
  - formatting for an attribute:
    <start-tag attribute="value">content<end-tag>
- Markup languages surround content => tell the browser how to format it
  - uses series of elements
- HTML uses elements that we can later reference in CSS

<!-- This is a comment.
It can be multi-line.
 -->

Standard Document Structure
<!DOCTYPE html>
  => tag that tells the browser which version of HTML
  => comes before <html> tags and has no close tag
  => HTML5 = html
<html>...</html>
  => wraps all of the content for your webpage
  => tells it where the code
  <html lang="en"> (language is english)
  elements
  <meta charset="UTF-8"> (tells browser to user UTF-8 char set)
  <title>this will show up on the browser tab (important for search engines)</title>
<head>...</head>
  => data for the browser and search engines
    => title of page, links to other sheets (ie. style sheets), scripts, etc
  => content not seen to the visitor
<body>...</body>
  => visible content
    => text, images, links, videos, etc
**type `html` + tab to get the basic parts of the html doc auto-completed for you**

TEXT ELEMENTS
<h1> header 1 </h1> carries the most weight with search engines
<h2> header 2 </h2>
<h3> header 3 </h3>
<h4> header 4 </h4>
<h5> header 5 </h5>
<h6> header 6 </h6>
<p> paragraph </p>
<br> line break </br>
<hr> horizontal line across page</hr>
<pre> preformatted text </pre>
<em> italicize </em>
<strong> bold </strong>

LISTS
<ul> unordered list (bullet points)
  <li> list item </li>
</ul>

<ol> ordered list (numbers)
  <li> list item </li>
</ol>

<dl> definition list
  <dt> definition term </dt>
  <dd> definition </dd>
</dl>

IMAGES
<img src="" alt="" title="">
  +src = source => give it the relative path for the image
  +alt = alt text => usually a description of the image
    => for visually impaired (using screen readers) - the text is what they hear
    => search engines - can't see images, but can see the alt text
  +title => caption that people see if they hover over the image
  +foldername/ = go inside folder
    +path is relative to the folder that your html file is in
    +case sensitivity matters! the computer is stupid
      +folders are like buildings -> to see files you need to go inside
  +filename = use file in that directory
  +../ = leave the current folder and go up a level
    +ie. src="../../../images/intro-pic.jpg"

LINKS
<a href="link">text for link</a>
href = hypertext reference
  +you can use special prefixes to trigger diff actions
    => "mailto:" opens email editor
    => "tel:" tells cell to dial a number
  +  ``<a href"#" target="_blank"></a>`` to open in a new page
  +you can use ids to set "bookmarks" that anchor links can jump to
    <p id="tips">Useful Tips Section</p>
    <a href="#tips">Jumps to the Useful Tips Section</a>
- relative path (about.html)
  - links content inside the same site and gives the file path relative to the relationship between the 2 files
- absolute path (http://wwww.sitename.com)
  - link to full URL
  - link to somewhere else on the web

+anything that you wrap <a></a> around becomes a clickable item

LISTS
<ol></ol> ordered list
<ul></ul> unordered list
<li></li> list item
you can nest lists inside each other

TABLES
<table> create table </table>
<tr> create row </tr>
  <th> table header (top row) </th>
    - makes text centered and bold
  <td> table divider </td>
  (you can put these next to each other to make columns)
**remember that the browser doesn't care about whitespace**

VALIDATION
- http://validator.w3.org
- helps to make sure that there are no errors in your code
- you can give url, upload file, paste in code
- look at the "validation output" section to see what the issues are

**to view your webpages in the browser, run `httpserver` and then copy the resulting IP address into your browser ctrl+c to quit**

---

FORMS
collect user info
<form> <input> </form>
  use form tags to indicate where the form is
  input type tags to indicate what the fields should do
  1) must have action attribute ie. action="login.php" => dictates where the collected info will go
  2) must have method attribute ie. method="post" or method="get" => specifies http request type
<form action="login.php" method="post">
  <input type="text" name="full-name">
  <input type="password" name="password">
  <input type="submit" value="submit"> (button)
</form>
- you can see the form data in Inspect > Network > Headers

Common HTTP Methods
- POST => info in Form Data; send info to server not visible in URL (think passwords)
- GET => info is in url as query string; Query String Parameters; use when you want to get back info from the server
- PATCH
- PUT
- DELETE

INPUTS
standard form is: <input type="" name="" placeholder="">
  - name = label; very important to use this attribute; gives us a way to grab the element from the server later on
  - placeholder = text that appears in the form field until user adds info (dummy text)
  - required = must be filled out
  - id = ties label to input

<form action="#" method="post">
  <label for="fullname">Name</label>
  <input type="text" id="fullname" name="fullname" placeholder="your name" required>
</form>

INPUT TYPES
- email => validates as email address
- text => brings up alphanumeric keyboard on mobile; single line of text
- password => displays dots instead of characters; good for private info
- tel => phone number; brings up numeric keyboard on mobile devices
- hidden => not visible to user
- submit => create button to submit form; this uses value not name for the label
  - you can also use a button element instead
    <button type="submit">Text for button</button>

Radio Inputs
- create radio buttons
- names MUST be the same here
- when you choose one, it will set the name to the value you set
<input type="radio" name="gender" value="male"> Male
<input type="radio" name="gender" value="female"> Female

Checkbox Input
- create checkboxes; allow for user to choose more than one
- the names should not be the same
<input type="checkbox" name="vehicle-1" value="bike"> Bike
<input type="checkbox" name="vehicle-2" value="car"> Car

Selection Menu (drop down)
<select name="size">
  <option value="small" selected>small</option>
  <option value="medium">medium</option>
  <option value="large">large</option>
</select>
- selected indicates the default choice

Text Area
<textarea name="message"></textarea>
- whatever is typed inside the text box becomes the value

Iframe
- embed another website into your website
  - "window" to another site
- you can use relative or absolute paths
- src attribute tells it where to go
- not good for search engines
- better to use just for embedding videos/images
<iframe src="example.html" width="600" height="400"></iframe>
<iframe src="http://mysite.com/example.html" width="600" height="400"></iframe>

AUDIO + VIDEO

<audio controls>
  <source src="purrr.mp3" type="audio/mp3">
  <source src="purrr.ogg" type="audio/ogg">
  <p>Sorry your browser doesn't support HTML5 Audio! Please <a href="http://browsehappy.com/?locale=en">upgrade your browser</a>.</p>
</audio>

<video controls>
  <source src="real-estate.mp4" type="video/mp4">
  <source src="real-estate.ogv" type="video/ogg">
  <p>Sorry your browser doesn't support HTML5 Video! Please <a href="http://browsehappy.com/?locale=en">upgrade your browser</a>.</p>
</video>


<audio> element allows us to embed audio clips
<video> element allows us to embed video clips

<source> elements point to the location of various file formats
  - you want to have multiple file formats bc different browsers support different audio/video codecs
    - MP4 and OGG (video)
      - ogv = ogg type
    - MP3 and OGG (audio)
  - the browser checks the files in order (top to bottom)
  - if none of the files work, the browser will display the text
  - if the browser can play any of the files, it ignores any other code below it until the </audio> or </video>
  - the type="" attribute tells the browser the file type
  - the src="" attribute is for the file source

<audio> and <video> attributes
- controls => display the audio controls (play, pause, etc); attribute doesn't require a value
- autoplay
- loop

----

archive.org
open source, royalty-free video and audio

----

W3C = org that oversees spec for HTML and CSS

----

Semantic Elements
*/semantic elements do not change much on the page except for a bit of default spacing/*

+ <header> introductory content
  - ie. navigation aids
  - may also include logos, search form, etc
+ <article> self-contained composition in a doc/page/app/site
  - independently distributable or reusable
  - ie. forum post, magazine/newspaper article, blog entry, object
  - typically should be identified by a heading as a child element
+ <aside> section of the page that's tangentially related to the rest
  - sidebar or insert
  - ie. related ads, author bio, web apps, profile info, related links
+ <details> disclosure widget
  - user can get add'l info from it
+ <figure>...<figcaption> figure and caption  
  <figure>
    - typically referenced as a single unit
    - position is independent of the main flow -> can be moved from main flow w/o disrupting it
    - ie. image, illustration, diagram, code snippet, reference schema
  <figcaption>
    - caption or legend associated with a figure
    - first or last element of the <figure> block
    - optional
+ <footer>
  - nearest sectioning content / sectioning root element
  - usually contains copyright info or links to related docs
+ <main> main content of <body>
  - content that is directly related to/expands on the central topic of the document or central functionality of the app
  - unique to the document; excludes repeated content (ie. sidebars, nav links, copyright info, search forms, etc)
+ <mark> highlighted text
+ <nav> section of the page with navigation links
  - links to other pages
  - links to parts within the page
+ <section> generic section of a doc
  - each section is typically identified by a heading element
+ <time> time on a 24-hour clock or precise date
  - intended to be used to present dates/times in a machine readable format (think 'add to my cal')

**Support for semantic elements is easily achieved in older browsers by linking to both modernizr.js and normalize.css or an equivalent CSS reset file that tells all the semantic elements to display block.**

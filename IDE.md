/*
+ if you cannot open the lab from the learn.co page... (http://help.learn.co/workflow-tips/github/how-to-manually-open-a-lab)
  => open lesson in github
    => clone using SSH format not HTTPS
      => in IDE...
        => access labs directory (cd ~/code/labs)
          => git clone (insert link copied from github)
            => then access the lab (cd ~/code/labs/NAME OF LAB)

nodejs filename ===> run code in terminal


/*
to load files into another you can do the following:
var index = require("./index.js")
and use "index.[variable]" to access variables from the loaded doc

process to take when approaching Flatiron labs
1) run the code you are given...figure out where you currently are before you figure out where you need to go (usu. run nodejs index.js)
2) run tests to see what you need to accomplish

MOCHA
used for testing


Keyboard shortcuts are helpful to learn in your IDE (esp. ones for auto-complete) look them up on ATOM?
lorem + tab => filler text
tag (not wrapped) + tab => create tags

- sometimes useful to call IRB for Ruby and run the method that you're getting an error on
- make sure that all of the relevant files are included in the spec file

- to see what your websites look like in the browser:
  1) make sure you are in the main project folder for the site
  2) httpserver
  3) copy the IP into the browsers
  4) crtl + c to close httpserver

``` cmd + \ => toggle tree view
toggle soft wrap => code in window wraps
cmd + shift + p => command palette
  'split pane' + up/down/left/right => more than one code window

'touch' + filename => create new file
'atom' + filename => open the file

terminal:
unzip + filename => unzip a file

copy files:
cp -rf folder ~/filepath/new-folder-name

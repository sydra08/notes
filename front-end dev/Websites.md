THE WEB

- request/response
  1) computer > enter URL (request site from remote server)
  2) your ISP (internet service provider) sends to DNS (domain name server)
    - DNS = "operator"; don't hold webpage files; associate domain name with IP address
    - IP address = location of the website on the internet
  3) the DNS communicate back and forth
  4) your DNS will cache the info
  5) you get the IP address back > your computer connects to the hosting server
  6) hosting server returns the webpage files to you

request (http header)=>
<= response (http header)


Inspect Mode (cmd + opt + i)
- network tab = shows us the requests and responses between comp and server
  - you can see in real-time the requests and responses that come back
  - headers tab
    - request header => host, method, path (location on server), user agent
    - response header => status (ok/not),
  - response tab
    - see the HTML that's sent back

- local vs remote
  - local = your computer; private
  - remote = webserver; how other people access your website files

- front end vs back end
  - front end = client-side; interpreted by browsers
    - html (mark up language)
    - css (mark up language)
    - javascript (programming language)
  - back end = server-side; interpreted by servers
      - usually communicating with a database
      - server comms with DB > passes to HTML to be consumed by client
    - Ruby
    - PHP
    - Python
    - Java

- planning
  - brainstorm => use pen and paper! get your ideas down to start
  - flow diagrams => show how site pages map together
  - hand drawn mockup => placement of content/images; spatial relationships
  - digital mockups (balsamiq and mockingbird)
  - mobile => plan out responsive sites
  - organization (strict naming conventions)
     site (parent-folder w all site files)
        │
        ├── css (external cascading style sheets)
        │
        ├── fonts (special web fonts used)
        │
        ├── images (all compressed images used)
        │
        ├── index.html (home page)
        │
        └── js (external javascript files)

Git workflow
- readme.md file
- .gitignore file
- add + commit files
- create repo via github
- connect to remote repo via terminal
- push -u files to master (remote)
- make branches for the different features
  - index.html => homepage file (case sensitive)
    - the name tells the server to show it first
  - name html pages that describe the content on the page (helps search engines)


FTP (publishing site)
file transfer protocol
FileZilla-project.org => download filezilla client
site manager > my sites > new site > connect
  get info from the host provider
LHS of screen = local
RHS = server
- to transfer files...
  - where they go will depend on the host service
  - select the ones you want on LHS (except git, gitignore, readme)
  - click and drag into folder on RHS
- if you right click on files you can view and adjust permissions
- click red x at the end to disconnect from server
- after files have transfered you can actually view the site files via domain

GitHub Pages (publishing)
1) create repo yourname.github.io
2) git clone URL
3) build the simple site
4) push changes up
- more info on github pages
- create a branch (ie. gh-pages branch) to make things visible on url
- you can't publish dynamic content (things with database behind them)
- you can look at settings to git web address and change settings

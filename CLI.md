COMMAND LINE APPLICATIONS (CLI applications)
  -CLI = Command Line Interface
  -programs that interact entirely with terminal and shell
  -require ASCII input
  -some examples: git, learn, ruby interpreter

Sample structure of a root directory of a Ruby app:
├── bin
│   └── tictactoe
├── config
│   └── environment.rb
├── lib
│   └── tic_tac_toe.rb
└── spec
    ├── tic_tac_toe_spec.rb
    └── spec_helper.rb
├── Gemfile
├── ttt.rb

-bin, config, lib, spec, app = top-level directories
-bin/
  put code that relates to running the actual program (executables)
  bin is short for binary
  the file does not have .rb at the end (convention)
-config/
  put the code that's required to initialize the app's environment
  (ie. database connections, test suites, etc)
-lib/ (app/)
  where you put the majority of your code
-spec/ (test/)
  put the tests here
-.rspec, .learn, gemfile, gemfile.lock, rakefile
  collections of files that are used in Ruby apps

Basic flow of CLI app:
   1. Greet the user.
   2. Ask the user for input.
   3. Capture and store that input.
   4. Do something with that input.

-putting (Y/n) at the end is a common convention for indicating that you want user input

-----

TDD = Test Driven Development
  1) define what the working code will do when it works
    - state your expectations here (know your goal)
  2) write the implementation to make those tests work

-----

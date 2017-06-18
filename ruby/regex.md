REGEX (Regular Expressions)

+ sample RegEx for email validation:
  `` /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i ``

+ started around the 1950s and 1960s namely when Ken Thompson built Stephen Cole Kleene's notation into the editor QED to help match patterns in text files
  => mostly be using the Ruby RegEx that is mostly based off PERL language

USES
+ very powerful way to search thru strings and blocks of text for specific patterns
+ data validation
+ searching
+ mass file renaming
+ finding records in a database

**They are like a surgeon's scalpel: able to do a lot of harm or good, depending on how skillfully they are wielded.**

*http://rubular.com/* is a GREAT resource for testing and building RegEx

FORMAT

+ starts and ends with /RegEx here/ (literal)
+ Regexp.new('your regex') (class constructor)

+ if you write a series of letters/numbers in the regex space it will result in a search for exact matches of this pattern anywhere in the string
+ Metacharacters
  + allow you to use pre-defined shorthand to match specific characters
    - \d => match any digit in the text
    - \D => match any non-digit
    - \w => match any word characters (letters/numbers/underscores)
    - \W => match any non-word characters
    - \s => match any whitespace characters
    - \S => match any non-whitespace character
    - \b => match any word boundary
    - \A => only ever matches at the start of the string
    - \Z => only ever matches at the end of the string
+ to look for a single character in the text, you can put the characters into square brackets [ ] ie. /[aeiou]/
+ ranges: [0123456789] becomes [0-9]
+ repetitions => use curly braces { } to indicate the number of repetitions you are looking for ie. /[aeiou]{2}/ => find double vowel ('aa', 'ee', etc) combos
+ capture groups => use () to create groups that you can refer to via methods as indexes in an array

    numbers = "202-555-0192 202-555-0147 202-555-0131 202-555-0116 202-555-0192 202-555-0197"

    number_breakdown = numbers.scan(/(\d+)-(\d+)-(\d+)/)
    => [["202", "555", "0192"], ["202", "555", "0147"], ["202", "555", "0131"], ["202", "555", "0116"], ["202", "555", "0192"], ["202", "555", "0197"]]

    number_breakdown[0]
    => ["202", "555", "0192"]

    number_breakdown[0][1]
    => "555"

METHODS

#scan => returns an array of all items in your string that match a given regular expression

    "The rain in Spain lies mainly in the plain".scan(/\w+ain/)
    => ["rain", "Spain", "main", "plain"]

#match => returns the first item in your string that matches a given regular expression as a MatchData object

    "The rain in Spain lies mainly in the plain".match(/\w+ain/)
    => #<MatchData "rain">

    "The rain in Spain lies mainly in the plain".match(/France/)
    => nil

#grep => used to search arrays and hashes; returns an array of matching items

    names = ["Jeri Faria", "Althea Voth", "Audry Donoho", "Scotty Chaves", "Lance Barrio", "Zachary Newhall", "Stefany Janey", "Tressie Kinsel", "Raven Grimsley", "Marketta Gaylor", "Leota Crowe", "Mazie Norman", "Damien Loffredo"]

    names.grep(/^\w{5}\s/)

    => ["Audry Donoho", "Lance Barrio", "Raven Grimsley", "Leota Crowe", "Mazie Norman"]

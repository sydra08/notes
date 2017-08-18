require 'nokogiri'
require 'open-uri'

#example of grabbing text via css selector
#doc = Nokogiri::HTML(open("https://flatironschool.com/"))
#puts doc.css(".site-header__hero__inner").text

#example of iterating over elements
html = open("https://flatironschool.com/team")
doc = Nokogiri::HTML(html)

instructors = doc.css("#instructors .team-holder .person-box")

instructors.each do |instructor|
  puts "Flatiron School <3 " + instructor.css("h2").text
end

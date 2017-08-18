require 'nokogiri'
require 'pry'

html = File.read('./fixtures/FIFA World Rankings - Wikipedia.html')
doc = Nokogiri::HTML(html)
doc.css('table.wikitable tr td b').text

doc.css('table.wikitable tr')[3].css('td')[0].text

html2 = File.read("./fixtures/The FIFA Women's World Ranking - FIFA.com.html")
doc2 = Nokogiri::HTML(html2)
binding.pry
doc2.css('table.tbl-ranking td.tbl-teamname span a').text

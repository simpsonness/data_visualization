require 'rubygems'
require 'nokogiri'
require 'open-uri'


# File.open('rooms.txt', 'w') do |f|
#   page = Nokogiri::HTML(open("http://bj.ganji.com/fang1/dongcheng/h1/"))
#   rooms = page.css('.price')

#   rooms.each do |room|
#     f.write(room.text + "\n")
#   end
# end

File.open('room.html', 'w') do |f|
  page = Nokogiri::HTML(open("http://bj.ganji.com/fang1/dongcheng/h1/"))
  rooms = page.css('.price')
  f.write("<html lang='zh'>")
  f.write("<head><meta http-equiv='Content-Type' content='text/html; charset=utf-8'></head>")
  rooms.each do |room|
    
      f.write("<p>#{room}</p>")
    end
  
  f.write("</html>")
end


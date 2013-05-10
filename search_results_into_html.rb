require 'rubygems'
require 'nokogiri'
require 'open-uri'

File.open('partial.html', 'w') do |html|
  cities_w_search_results = []
  File.open("top_100_cities.txt", "r") do |txt|
    while (line = txt.gets)
        cities_w_search_results << [line.chomp, txt.gets.to_i]
    end
  end
  cities_w_search_results.reverse!
  max = cities_w_search_results[0][1]
  max *= 1.0000
  puts max
  for i in 0..100 do
    div_height = (100-(cities_w_search_results[i][1]/max*100)).to_s
    html.write("<div class='bar_wrapper' data-name='" + cities_w_search_results[i][0] + "'>\n")
    html.write("  <div class='bar' style='height:" + div_height + "%;'></div>\n")
    html.write("</div>\n")
  end
end
require 'rubygems'
require 'nokogiri'
require 'open-uri'

# Get the list of city names
data = File.read("cities.txt")
cities = data.split("\n")
search_results = {}
cities.each do |city|
  # Google each name
  link = "https://www.google.com/search?q=" + city.gsub(" ", "+") # gsub replaces
  page = Nokogiri::HTML(open(link))
  # Parse the number of search results as an integer
  search_result = page.css("div#resultStats").text[/[\d,]+/].delete(',').to_i
  search_results[city] = search_result
  sleep 2 # So as to not overload Google's servers
end
puts "Starting sort"
search_results = search_results.sort_by {|k, v| v}
puts "Finished sort, starting write to file"
File.open('top_100_cities.txt', 'w') do |f|
  search_results.each do |city, num|
    f.write(city + "\n")
    f.write(num.to_s + "\n")
  end
end
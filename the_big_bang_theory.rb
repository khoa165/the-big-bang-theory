require 'rubygems'
require 'json'

json = File.read('the_big_bang_theory.json')
obj = JSON.parse(json) # obj is a Hash object.

# obj.size => 21

# a hash with only 1 pair - 1 value that contains all the data needed.
data_hash = obj['_embedded']

# array of episodes
episodes = data_hash['episodes']

# create a file to write data into.
file = File.open('the_big_bang_theory.txt', 'w')

# val is a hash
episodes.each do |episode|
  info = ''
  info += "Season #{episode['season']} - episode #{episode['number']}: "
  info += "#{episode['name']}\nAir date: #{episode['airdate']}\n"
  info += "Summary: #{episode['summary'].gsub('<p>', '').chomp('</p>')}"
  file.puts info
  file.puts '------------------------------------------------------------------'
end

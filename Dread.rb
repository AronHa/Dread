#!/usr/bin/ruby
require 'map.rb'
require 'unit.rb'

player = Unit.new("Name",{"Strength" => 0, "Dexterity" => 0, "Intelligence" => 0, "Endurance" => 0})
map = Map.new(2,4)

#puts map.get_map
test =  map.get_visual

for line in test
  puts line.join("")
end

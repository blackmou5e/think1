#!/usr/bin/ruby

puts "Enter triangle height: "
altitude = gets.to_f

puts "Enter triangle base: "
base = gets.to_f

if base <= 0 || altitude <= 0
  puts "Entered data is not valid."
else
  puts 0.5*base*altitude
end


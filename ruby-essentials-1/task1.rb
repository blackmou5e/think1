#!/usr/bin/ruby

puts "Enter your name: "
name = gets.chomp

puts "Enter your height: "
height = gets.to_f

# Can be moved to function, but seems needless in this task
ideal_weight = (height - 110) * 1.15

if ideal_weight < 0
  puts "#{name.capitalize}, your weight is optimal already."
else
  puts "#{name.capitalize}, your ideal wieght is #{ideal_weight}."
end

#!/usr/bin/ruby

def calculate_discriminant(a, b, c)
  b**2 - 4 * a * c
end

def find_first_root(a, b, discriminant)
  (-b + Math.sqrt(discriminant)) / (2 * a)
end

def find_second_root(a, b, discriminant)
  (-b - Math.sqrt(discriminant)) / (2 * a)
end


puts "Enter first coefficient: "
a = gets.to_f

puts "Enter second coefficient: "
b = gets.to_f

puts "Enter third coefficient: "
c = gets.to_f

discriminant = calculate_discriminant(a, b, c)

if discriminant > 0
  puts "Discriminant is #{discriminant}"
  puts "First root: #{find_first_root(a, b, discriminant)}"
  puts "Second root: #{find_second_root(a, b, discriminant)}"
elsif discriminant == 0
  puts "Discriminant is #{discriminant}"
  puts "Only root: #{find_first_root(a, b, discriminant)}"
else
  puts "Discriminant is #{discriminant}"
  puts "There is no roots for this equation."
end

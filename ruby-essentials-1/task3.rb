#!/usr/bin/ruby

def right_triangle?(a, b, c)
  if a > b && a > c
    return a**2 == (b**2 + c**2)
  elsif b > a && b > c
    return b**2 == (a**2 + c**2)
  elsif c > b && c > a
    return c**2 == (a**2 + b**2)
  else
    return false
  end
end

def isoceles_triangle?(a, b ,c)
  return true if a == b || a == c || b == c

  false
end

def equilateral_triangle?(a, b, c)
  return true if a == b && b == c

  false
end

def check_triangle_type(a, b, c)
  if a <= 0 || b <= 0 || c <= 0
    puts "Entered data is not valid"
  end

  puts ''
  if equilateral_triangle?(a, b, c)
    puts "Entered triangle is equilateral and isoceles."
  elsif right_triangle?(a, b, c) && isoceles_triangle?(a, b, c)
    puts "Entered triangle is right and isoceles."
  elsif isoceles_triangle?(a, b, c)
    puts "Entered triangle is isoceles."
  elsif right_triangle?(a, b ,c)
    puts "Entered triangle is right triangle."
  else
    puts "Entered triangle isn't equilateral, isoceles or right."
  end
end

puts "Enter first triangle side: "
a = gets.to_f

puts "Enter second triangle side: "
b = gets.to_f

puts "Enter third triangle side: "
c = gets.to_f

check_triangle_type(a, b, c)

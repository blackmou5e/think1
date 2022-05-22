#!/usr/bin/ruby
# frozen_string_literal: true

result = []

i = 0
j = 1

while i < 100
  result << i
  i, j = j, j + i
end

puts result

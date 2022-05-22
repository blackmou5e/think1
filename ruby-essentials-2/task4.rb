#!/usr/bin/ruby
# frozen_string_literal: true

result = {}
alphabet = * ('a'..'z')

(0..alphabet.length - 1).each do |i|
  result[alphabet[i]] = i if %( e y u i o a ).include? alphabet[i]
end

puts result

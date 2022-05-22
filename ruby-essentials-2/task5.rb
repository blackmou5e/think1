#!/usr/bin/ruby
# frozen_string_literal: true

def leap_year?(year)
  return true if (year % 4).zero? && (year % 100).zero? && (year % 400).zero?

  false
end

months_list = %w[
  january
  februrary
  march
  april
  may
  june
  july
  august
  september
  october
  november
  december
]

months_days = {
  'january' => 31,
  'march' => 31,
  'april' => 30,
  'may' => 31,
  'june' => 30,
  'july' => 31,
  'august' => 31,
  'september' => 30,
  'october' => 31,
  'november' => 30,
  'december' => 31
}

puts 'Enter day: '
day = gets.to_i

puts 'Enter month: '
month = gets.to_i

puts 'Enter year: '
year = gets.to_i

months_days['februrary'] = leap_year?(year) ? 29 : 28

result = day

# month-2 because we need to shift entered month's number by one, to sync with 0 indexing
# and because we need to exclude entered month from calculation.
(0..month - 2).each do |i|
  result += months_days[months_list[i]]
end

puts result

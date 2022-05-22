#!/usr/bin/ruby
# frozen_string_literal: true

goods_list = {}
total_cost = 0

loop do
  puts 'Enter item name ("stop" for stop): '
  name = gets.chomp

  break if name == 'stop'

  puts 'Enter item amount: '
  amount = gets.to_i

  puts 'Enter price (per item): '
  price = gets.to_f

  goods_list[name] = { amount: amount, price_per_item: price }
end

goods_list.each do |item, value|
  item_info = { item => value }
  puts ''
  puts item_info
  puts "Subtotal for #{item}: #{value[:price_per_item] * value[:amount]}"
  puts ''
end

goods_list.each_value do |item|
  total_cost += item[:price_per_item] * item[:amount]
end

puts "Total cost: #{total_cost}"

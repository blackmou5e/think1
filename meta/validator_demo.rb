#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'models/wagon'
require_relative 'models/cargo_wagon'
require_relative 'models/train'
require_relative 'models/station'
require_relative 'models/route'

Wagon.new(123, 50)

begin
  Wagon.new(10)
rescue ArgumentError => e
  puts "Get exception - #{e.message}"
  puts "\n"
end

Train.new('123-12')

begin
  Train.new('0001034')
rescue ArgumentError => e
  puts "Get exception - #{e.message}"
  puts "\n"
end

Station.new('s1')
Station.new('s2')

begin
  Route.new('not_station1', 'not_station2')
rescue TypeError => e
  puts "Get exception - #{e.message}"
  puts "\n"
end

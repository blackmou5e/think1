#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'models/station'
require_relative 'models/route'
require_relative 'models/train'
require_relative 'models/passenger_train'
require_relative 'models/cargo_train'
require_relative 'models/wagon'
require_relative 'models/passenger_wagon'
require_relative 'models/cargo_wagon'
require_relative 'interface'

# train = PassengerTrain.new('fds-123')
# wagon = PassengerWagon.new(123, 10)
# puts train.number
# train.hitch_wagon(wagon)
# puts train.wagons
Interface.new.call

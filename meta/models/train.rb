# frozen_string_literal: true

require_relative '../modules/vendor'
require_relative '../modules/instance_counter'
require_relative '../modules/validator'

class Train
  include Vendor
  include InstanceCounter
  include Validation

  TRAIN_NUMBER_FORMAT = /^[a-zа-я|\d]{3}-*[a-zа-я|\d]{2}$/i.freeze

  attr_reader :speed, :current_station, :route, :wagons, :number, :type

  validate :number, :presence
  validate :number, :format, TRAIN_NUMBER_FORMAT

  def initialize(number)
    @number = number
    @type = nil
    @wagons = []
    @speed = 0
    @route = nil
    @current_station = nil
    validate!
    register_instance
  end

  def increase_speed(speed)
    self.speed += speed
  end

  def stop
    self.speed = 0
  end

  def hitch_wagon(wagon)
    return false unless wagon.type == type

    @wagons << wagon if self.speed.zero?
  end

  def unhitch_wagon(wagon)
    return false unless wagon.type == type

    @wagons.delete(wagon) if self.speed.zero?
  end

  def assign_route(route)
    self.route = route
    self.current_station = route.stations.first
    self.route.stations.first.add_train(self)
  end

  def move_forward
    return if current_station == route.stations.last

    current_station.remove_train(self)
    self.current_station = route.stations[route.stations.find(current_station) + 1]
    @current_station.add_train(self)
  end

  def move_backward
    return if current_station == route.stations.first

    current_station.remove_train(self)
    self.current_station = route.stations[route.stations.find(current_station) - 1]
    @current_station.add_train(self)
  end

  def print_location
    current_station_index = route.stations.find(current_station)

    puts "Previous station: #{route.stations[current_station_index - 1]}" \
    "Current station: #{current_station}" \
    "Next station: #{route.stations[current_station_index + 1]}"
  end

  def self.train_list
    @all
  end

  def self.find(number)
    @all.each do |train|
      return train if train.number == number
    end

    nil
  end

  def each_wagon(&block)
    @wagons.each_with_index(&block)
  end

  protected

  attr_writer :speed, :current_station, :route
end

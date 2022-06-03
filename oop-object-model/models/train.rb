# frozen_string_literal: true

require_relative '../modules/vendor'
require_relative '../modules/instance_counter'

class Train
  include Vendor
  include InstanceCounter

  attr_reader :speed, :current_station, :route, :wagons, :number, :type

  @@train_list = []

  def initialize(number)
    self.class.register_instance
    @number = number
    @type = nil
    @wagons = []
    @speed = 0
    @route = nil
    @current_station = nil
    @@train_list << self
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
    @@train_list
  end

  def self.find(number)
    @@train_list.each do |train|
      return train if train.number == number
    end

    nil
  end

  protected

  attr_writer :speed, :current_station, :route
end

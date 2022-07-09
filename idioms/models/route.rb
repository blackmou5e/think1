# frozen_string_literal: true

require_relative '../modules/instance_counter'
require_relative '../modules/validator'

class Route
  include InstanceCounter
  include Validator

  def initialize(start, destination)
    @start = start
    @destination = destination
    @transit_stations = []
    validate!
    register_instance
  end

  def add_transit_station(station)
    @transit_stations << station
  end

  def remove_transit_station(station)
    @transit_stations.delete(station)
  end

  def stations
    [@start, *@transit_stations, @destination]
  end

  def print_route
    stations.each { |station| puts station.name }
  end

  def self.routes_array
    @all
  end

  private

  def validate!
    raise 'Missing first station' if @start.nil?
    raise 'Missing destination' if @destination.nil?
  end
end

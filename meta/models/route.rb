# frozen_string_literal: true

require_relative '../modules/instance_counter'
require_relative '../modules/validator'

class Route
  include InstanceCounter
  include Validation

  validate :start, :presence
  validate :start, :type, Station
  validate :destination, :presence
  validate :destination, :type, Station

  def initialize(start = nil, destination = nil)
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
end

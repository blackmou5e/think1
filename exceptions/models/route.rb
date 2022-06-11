# frozen_string_literal: true

require_relative '../modules/instance_counter'
require_relative '../modules/validator'

class Route
  include InstanceCounter
  include  Validator

  @@routes_array = []

  def initialize(start, destination)
    validate!
    register_instance
    @start = start
    @destination = destination
    @transit_stations = []
    @@routes_array << self
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
    @@routes_array
  end

  private

  def validate!
    raise 'Missing first station' if @start.nil? || @start.empty?
    raise 'Missing destination' if @destination.nil? || @destination.empty?
  end
end

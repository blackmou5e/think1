# frozen_string_literal: true

class Route
  def initialize(start, destination)
    @start = start
    @destination = destination
    @transit_stations = []
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
end

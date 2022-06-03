# frozen_string_literal: true

class Station
  attr_reader :name, :trains
  @@station_list = []

  def initialize(name)
    @name = name
    @trains = []
    @@station_list << self
  end

  def add_train(train)
    trains << train
  end

  def remove_train(train)
    trains.delete(train)
  end

  def print_all_trains
    trains.each { |train| puts train }
  end

  def print_trains_by_type(type)
    trains.each do |train|
      puts train if train.type == type
    end
  end

  def self.print_stations
    @@station_list.each { |station| print "#{station.name}" }
  end

  # analog for all function, does absolutely the same
  def self.station_list
    @@station_list
  end
end

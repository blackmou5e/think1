# frozen_string_literal: true

require_relative '../modules/instance_counter'

class Station
  include InstanceCounter

  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
    register_instance
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
    @all.each { |station| puts station.name.to_s }
  end

  # analog for all function, does absolutely the same
  def self.station_list
    @all
  end

  def each_train(&block)
    @trains.each_with_index(&block)
  end
end

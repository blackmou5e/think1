# frozen_string_literal: true

class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
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
end

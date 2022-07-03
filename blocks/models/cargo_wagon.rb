# frozen_string_literal: true

require_relative 'wagon'
require_relative '../modules/wagon_capacity'

class CargoWagon < Wagon
  include WagonCapacity

  attr_reader :available_cargohold_volume, :occupied_cargohold_volume

  def initialize(number, capacity)
    @capacity = capacity
    @busy = 0
    super(number, :cargo)
  end
end

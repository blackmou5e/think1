# frozen_string_literal: true

require_relative 'wagon'

class CargoWagon < Wagon
  def initialize(number, capacity)
    super(number, capacity, :cargo)
  end

  def load_wagon(volume)
    @used_space += volume if free_place >= volume
  end
end

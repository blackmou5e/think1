# frozen_string_literal: true

require_relative 'wagon'
require_relative '../modules/wagon_capacity'

class PassengerWagon < Wagon
  include WagonCapacity

  def initialize(number, capacity)
    @capacity = capacity
    @busy = 0
    super(number, :passenger)
  end
end

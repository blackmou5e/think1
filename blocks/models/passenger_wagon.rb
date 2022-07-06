# frozen_string_literal: true

require_relative 'wagon'

class PassengerWagon < Wagon
  def initialize(number, capacity)
    super(number, capacity, :passenger)
  end

  def take_place
    @used_space += 1 if free_place > 0
  end
end

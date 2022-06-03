# frozen_string_literal: true

require_relative 'wagon'

class PassengerWagon < Wagon
  def initialize(number)
    super
    @type = :passenger
  end
end

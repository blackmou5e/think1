# frozen_string_literal: true

require_relative '../modules/vendor'
require_relative '../modules/instance_counter'
require_relative '../modules/validator'

class Wagon
  include Vendor
  include InstanceCounter
  include Validator

  attr_reader :type, :number

  def initialize(number, capacity, type = :unknown)
    @type = type
    @number = number
    @total_space = 0
    @used_space = 0
    @capacity = capacity
    validate!
    register_instance
  end

  def self.wagon_list
    @all
  end

  def free_place
    @total_space - @used_space
  end

  protected

  def validate!
    raise 'Number cannot be empty' if @number.zero? || @number.nil?
  end
end

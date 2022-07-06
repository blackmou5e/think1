# frozen_string_literal: true

require_relative '../modules/vendor'
require_relative '../modules/instance_counter'
require_relative '../modules/validator'

class Wagon
  include Vendor
  include InstanceCounter
  include Validator

  attr_reader :type, :number

  @@wagon_list = []

  def initialize(number, capacity, type = :unknown)
    register_instance
    @type = type
    @number = number
    @total_space = 0
    @used_space = 0
    validate!
    @@wagon_list << self
  end

  def self.wagon_list
    @@wagon_list
  end

  def free_place
    @total_space - @used_space
  end

  protected

  def validate!
    raise 'Number cannot be empty' if @number.zero? || @number.nil?
  end
end

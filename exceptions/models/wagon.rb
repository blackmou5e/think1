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

  def initialize(number)
    self.class.register_instance
    validate!
    @type = nil
    @number = number
    @@wagon_list << self
  end

  def self.wagon_list
    @@wagon_list
  end

  protected

  def validate!
    raise 'Number cannot be empty' if @number.length.zero? || @number.nil?
    raise 'Number format incorrect' if @number.length < 3
  end
end

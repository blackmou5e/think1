# frozen_string_literal: true

require_relative '../modules/vendor'
require_relative '../modules/instance_counter'

class Wagon
  include Vendor
  include InstanceCounter

  attr_reader :type, :number

  @@wagon_list = []

  def initialize(number)
    self.class.register_instance
    @type = nil
    @number = number
    @@wagon_list << self
  end

  def self.wagon_list
    @@wagon_list
  end
end

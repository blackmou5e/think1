# frozen_string_literal: true

require_relative '../modules/vendor'
require_relative '../modules/instance_counter'
require_relative '../modules/validator'
require_relative '../modules/accessor'

class Wagon
  include Vendor
  include InstanceCounter
  include Validation
  extend Accessors

  attr_reader :type, :number

  attr_accessor_with_history :a, :d
  strong_attr_accessor :b, String

  validate :capacity, :presence
  validate :capacity, :type, Integer

  def initialize(number = nil, capacity = nil, type = :unknown)
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
end

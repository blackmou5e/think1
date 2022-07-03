# frozen_string_literal: true

module WagonCapacity
  attr_reader :capacity, :occupancy

  def load_wagon(volume)
    raise 'Not enough place' if volume > available_capacity

    @busy += volume
  end

  def available_capacity
    @capacity - @busy
  end

  private

  attr_writer :capacity, :busy
end

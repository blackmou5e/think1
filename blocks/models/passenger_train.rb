# frozen_string_literal: true

require_relative 'train'

class PassengerTrain < Train
  def hitch_wagon(wagon)
    @type = :passenger
    super
  end

  def unhitch_wagon(wagon)
    @type = :passenger
    super
  end
end

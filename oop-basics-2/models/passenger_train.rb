# frozen_string_literal: true

require_relative 'train'

class PassengerTrain < Train
  def hitch_wagon(wagon)
    super if wagon.type == 'passenger'
  end

  def unhitch_wagon(wagon)
    super if wagon.type == 'passenger'
  end
end

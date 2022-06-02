# frozen_string_literal: true

require_relative 'train'

class CargoTrain < Train
  def hitch_wagon(wagon)
    super if wagon.type == 'cargo'
  end

  def unhitch_wagon(wagon)
    super if wagon.type == 'cargo'
  end
end

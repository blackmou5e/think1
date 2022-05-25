# frozen_string_literal: true

class Train
  def initialize(number, type, wagons_amount)
    @number = number
    @type = type
    @wagons_amount = wagons_amount
    @speed = 0
    @route = nil
    @current_station = nil
  end

  def increase_speed(speed)
    self.speed += speed
  end

  def stop
    self.speed = 0
  end

  def current_speed
    speed
  end

  def current_wagons
    wagons_amount
  end

  def hitch_wagon
    self.wagons_amount += 1 if speed.zero?
  end

  def unhitch_wagon
    self.wagons_amount -= 1 if speed.zero?
  end

  def assign_route(route)
    self.route = route
    self.current_station = route.stations.first
    self.route.stations.first.add_train(train)
  end

  def move_forward
    return if current_station == route.stations.last

    @current_station.remove_train(self)

    self.current_station = route.stations[route.stations.find(current_station) + 1]
    @current_station.add_train(self)
  end

  def move_backward
    return if current_station == route.stations.first

    @current_station.remove_train(self)

    self.current_station = route.stations[route.stations.find(curent_station) - 1]
    @current_station.add_train(self)
  end

  def print_location
    current_station_index = route.stations.find(current_station)

    puts "Previous station: #{route.stations[current_station_index - 1]}" \
    "Current station: #{current_station}" \
    "Next station: #{route.stations[current_station_index + 1]}"
  end
end

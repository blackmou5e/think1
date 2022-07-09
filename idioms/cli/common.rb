# frozen_string_literal: true

module Common
  private

  def choose_train(message = false, choice = false)
    puts 'Pick a train' if message == true
    Train.train_list.each_with_index { |train, index| puts "#{index + 1} - #{train.number}" }
    Train.train_list[gets.to_i - 1] if choice == true
  end

  def choose_route(message = false, choice = false)
    puts 'Pick a route' if message == true
    Route.routes_array.each_with_index { |route, index| puts "#{index + 1} - #{route}" }
    Route.routes_array[gets.to_i - 1] if choice == true
  end

  def choose_wagon(message = false, choice = false)
    puts 'Pick a wagon' if message == true
    Wagon.wagon_list.each_with_index { |wagon, index| puts "#{index + 1} - #{wagon.number}" }
    Wagon.wagon_list[gets.to_i - 1] if choice == true
  end

  def choose_station(message = false, choice = false)
    puts 'Pick a station' if message == true
    Station.station_list.each_with_index { |station, index| puts "#{index + 1} - #{station.name}" }
    Station.station_list[gets.to_i - 1] if choice == true
  end
end

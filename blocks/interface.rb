# frozen_string_literal: true

class Interface
  FAILURES = 2
  TRAIN_TYPES = { 1 => CargoTrain, 2 => PassengerTrain }
  WAGON_TYPES = { 1 => CargoTrain, 2 => PassengerTrain }

  def call
    loop do
      puts "\n"
      puts 'Choose action:'
      puts '1: Stations'
      puts '2: Trains'
      puts '3: Routes'
      puts '4: Wagons'
      puts '0: Exit'
      case gets.to_i
      when 1
        stations_handler
      when 2
        trains_handler
      when 3
        routes_handler
      when 4
        wagons_handler
      when 0
        break
      end
    end
  end

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

  def stations_handler
    loop do
      puts "\n"
      puts 'Choose action for stations:'
      puts '1: Print stations'
      puts '2: Print trains stopped at station'
      puts '3: Create new station'
      puts '0: Back'
      case gets.to_i
      when 1
        choose_station
      when 2
        station = choose_station(true, true)
        station.each_train do |train, index|
          puts "#{index + 1}. Number: #{train.number}, Type: #{train.type.capitalize}, Wagons: #{train.wagons.length}"
        end
      when 3
        puts 'Enter new station name:'
        Station.new(gets.chomp)
        puts 'Station successfully added'
      when 0
        break
      end
    end
  end

  def trains_handler
    loop do
      puts "\n"
      puts 'Choose an action for train:'
      puts '1: Print trains'
      puts '2: Create train'
      puts '3: Assign route to a train'
      puts '4: Hitch a wagon'
      puts '5: Unhitch a wagon'
      puts '6: List wagons'
      puts '7: Move forward'
      puts '8: Move backward'
      puts '0: Back'
      case gets.to_i
      when 1
        choose_train
      when 2
        create_train
      when 3
        train = choose_train(true, true)
        route = choose_route(true, true)
        train.assign_route(route)
        puts 'Route assigned'
      when 4
        train = choose_train(true, true)
        wagon = choose_wagon(true, true)
        puts train.hitch_wagon(wagon)
      when 5
        train = choose_train(true, true)
        wagon = choose_wagon(true, true)
        puts train.unhitch_wagon(wagon)
      when 6
        train = choose_train(true, true)
        puts train.wagons
        train.each_wagon do |w, i|
          puts "#{i + 1}: Type: #{w.type.capitalize} >> Occupied: #{w.capacity} >> Free: #{w.available_capacity}"
        end
      when 7
        puts choose_train(true, true).move_next_station
      when 8
        puts choose_train(true, true).move_past_station
      when 0
        break
      end
    end
  end

  def create_train
    attempts = 0
    begin
      attempts += 1
      train = set_train_type
      puts 'Enter a new train number:'
      train.new(gets.chomp)
      puts 'Train created'
    rescue StandardError => e
      puts "Train wasn't created: #{e.message}"
      puts "Attemps left: #{FAILURES - attempts}" if attempts <= FAILURES
      retry if attempts <= FAILURES
    end
  end

  def set_train_type
    puts 'Enter train type:'
    TRAIN_TYPES.each { |key, value| puts "#{key}: #{value.name}" }

    input = gets.chomp.to_i
    raise 'Selected wrong type' if input.nil?

    TRAIN_TYPES[input]
  end

  def wagons_handler
    loop do
      puts '1: Add a wagon'
      puts '2: load wagon'
      puts '0: Back'
      case gets.to_i
      when 1
        puts 'Enter a new wagon number:'
        number = gets.to_i
        puts 'Choose wagon type (1 - cargo, 2 - passenger):'
        type = gets.to_i

        case type
        when 1
          puts 'Enter cargohold capacity:'
          capacity = gets.to_i
          CargoWagon.new(number, capacity)
          puts 'Wagon added'
        when 2
          puts 'Enter seats amount:'
          seats = gets.to_i
          PassengerWagon.new(number, seats)
          puts 'Wagon added'
        else
          puts 'Incorrect wagon type selected.'
        end
      when 2
        wagon = choose_wagon(true, true)
        puts 'Enter seats/volume to load:'
        wagon.load_wagon(gets.to_i)
      when 0
        break
      end
    end
  end

  def routes_handler
    loop do
      puts "\n"
      puts 'Choose an action for route:'
      puts '1: Create route'
      puts '2: Add station to route'
      puts '3: Remove station from route'
      puts '4: Print route'
      puts '0: Back'

      case gets.to_i
      when 1
        puts 'Enter starting station'
        station1 = choose_station(true, true)
        puts 'Enter destination'
        station2 = choose_station(true, true)
        Route.new(station1, station2)
        puts 'Route created'
      when 2
        route = choose_route(true, true)
        station = choose_station(true, true)
        route.add_transit_station(station)
      when 3
        route = choose_route(true, true)
        station = choose_station(true, true)
        route.remove_transit_station(station)
      when 4
        route = choose_route(true, true)
        route.print_route
      when 0
        break
      end
    end
  end
end

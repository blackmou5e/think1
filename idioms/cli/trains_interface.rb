# frozen_string_literal: true

module TrainsInterface
  FAILURES = 2
  TRAIN_TYPES = { 1 => CargoTrain, 2 => PassengerTrain }.freeze

  private

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
end

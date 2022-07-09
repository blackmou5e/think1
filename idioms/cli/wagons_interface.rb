# frozen_string_literal: true

module WagonsInterface
  private

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
        if wagon.type == :passenger
          wagon.take_place
          puts 'Seat successfully booked.'
        else
          puts 'Enter volume to load: '
          wagon.load_wagon(gets.to_i)
        end
      when 0
        break
      end
    end
  end
end

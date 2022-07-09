# frozen_string_literal: true

module StationsInterface
  private

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
end

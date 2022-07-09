# frozen_string_literal: true

module RoutesInterface
  private

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

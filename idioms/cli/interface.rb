# frozen_string_literal: true

require_relative 'stations_interface'
require_relative 'trains_interface'
require_relative 'wagons_interface'
require_relative 'routes_interface'
require_relative 'common'

class Interface
  include RoutesInterface
  include WagonsInterface
  include TrainsInterface
  include StationsInterface
  include Common

  def call
    loop do
      puts "\nChoose action:\n1: Stations\n2: Train\n3: Routes\n4: Wagons\n0: Exit"
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
end

require './lib/oystercard'
class Journey

attr_accessor :entry_station, :exit_station

def initialize(station)

  @entry_station =station
end

def exit_station(station)
  @exit_station = station
end

end

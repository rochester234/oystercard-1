require './lib/oystercard'
class Journey

attr_accessor  :in_progress, :fare, :entry_station, :exit_station

PENALTY = 6

def initialize(in_progress = false)
  @in_progress = in_progress
end

def touch_in(station)
  @in_progress = true
  @entry_station = station

end

def touch_out(station)
  @in_progress = false
  @exit_station = station

end

def calculate_fare
 @fare = 1
end

def in_progress?
  @in_progress
end

end

require './lib/oystercard'
class Journey

attr_accessor :entry_station, :exit_station, :in_progress, :fare

def initialize(in_progress = false)
  @in_progress = in_progress
end

def touch_in(station)
  @in_progress = true
  @entry_station = station

end

def touch_out(station)
  self.in_progress?(false)
  @exit_station = station

end

def calculate_fare
 @fare = 1
end

def in_progress?(in_progress)
  @in_progress = in_progress
end

end

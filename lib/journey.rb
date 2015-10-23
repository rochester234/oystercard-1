require './lib/oystercard'
class Journey

attr_accessor :fare, :entry_station, :exit_station, :entry_zone, :exit_zone

PENALTY = 6

def initialize(station)
  @entry_station = station.name
  @entry_zone = station.zone
end

def fare
  1
end


# def start_journey(station)
#   @in_progress = true
#   @entry_station = station
#
# end
# if journeys == []
#     @new_journey = Journey.new
#     station.entry_station
#     @new_journey.touch_in(station)
#     @journeys << station
#     deduct(@new_journey.calculate_fare)
#   else
#     @new_journey = Journey.new
#     station.entry_station
#     @new_journey.touch_in(station)
#     @journeys << station
#     deduct(@new_journey.calculate_fare)
#       if journeys[-2].exitstation == ""
#           deduct(Journey::PENALTY)
#       end
# end
# if journeys == []
#   deduct(Journey::PENALTY)
#   @new_journey = Journey.new
#   station.exit_station
#   @new_journey.touch_out(station)
#   @journeys << station
# elsif journeys[-1].entrystation ==""
#   @new_journey = Journey.new
#   deduct(Journey::PENALTY)
#   station.exit_station
#   @new_journey.touch_out(station)
#   @journeys << station
# else
#     deduct(@new_journey.calculate_fare)
#     station.exit_station
#     @new_journey.touch_out(station)
#     @journeys << station
# end
def end_journey(station)
  @in_progress = false
  @exit_station = station

end

# def in_journey?
#   @new_journey.in_progress?
# end


def calculate_fare
 @fare = 1
end

def in_progress?
  @in_progress
end

end

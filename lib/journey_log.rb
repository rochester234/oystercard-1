require './lib/oystercard'
class JourneyLog

attr_reader :journeys, :fare

def initialize(journey_klass: Journey)
  @journeys = []
  @journey_klass = journey_klass
end

def start_journey(station)
 journeys << journey_klass.new(station)
 @fare = 1
end

def exit_journey(station)
journeys.last.exit_station = station.name
journeys.last.exit_zone = station.zone
end

def outstanding_charges
  if  journeys.last.entry_station == nil
    journeys << journey_klass.new(station)
    journeys.last.entry_station = nil
    journeys.last.entry_zone = nil
    @fare = 6
  else
    @fare = 1
  end
end

def complete
  (journeys.last.exit_station && journeys.last.entry_station != nil) ? true : false
end

private

attr_reader :journey_klass

end

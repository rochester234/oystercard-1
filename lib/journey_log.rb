require './lib/oystercard'
class JourneyLog

attr_reader :journeys

def initialize(journey_klass: Journey)
  @journeys = []
  @journey_klass = journey_klass
end

def start_journey(station)
 journeys << journey_klass.new(station)
end


private

attr_reader :journey_klass

end

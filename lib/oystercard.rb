require './lib/station'
require_relative 'journey'
require_relative 'journey_log'

class Oystercard

  attr_reader :balance, :journeys, :journey
  DEFAULT_BALANCE = 0
  BALANCE_LIMIT = 90
  MIN_BALANCE = 1


  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    #@journey = journey_klass
    @journeys = []

  end

  def touch_in(station)
    fail "Insufficient funds, please top up #{MIN_BALANCE}" if insufficient_balance?
    if journeys == []
        @new_journey = Journey.new
        station.entry_station
        @new_journey.touch_in(station)
        @journeys << station
        deduct(@new_journey.calculate_fare)
      else
        @new_journey = Journey.new
        station.entry_station
        @new_journey.touch_in(station)
        @journeys << station
        deduct(@new_journey.calculate_fare)
          if journeys[-2].exitstation == ""
              deduct(Journey::PENALTY)
          end
    end
  end

  def touch_out(station)
    if journeys == []
      deduct(Journey::PENALTY)
      @new_journey = Journey.new
      station.exit_station
      @new_journey.touch_out(station)
      @journeys << station
    elsif journeys[-1].entrystation ==""
      @new_journey = Journey.new
      deduct(Journey::PENALTY)
      station.exit_station
      @new_journey.touch_out(station)
      @journeys << station
    else
        deduct(@new_journey.calculate_fare)
        station.exit_station
        @new_journey.touch_out(station)
        @journeys << station


    # if @new_journey == nil
    #     @new_journey = Journey.new
    #     deduct(Journey::PENALTY)
    #     station.exit_station
    #     @new_journey.touch_out(station)
    #     @journeys << station
    # else
    #     deduct(@new_journey.calculate_fare)
    #     station.exit_station
    #     @new_journey.touch_out(station)
    #     @journeys << station
    end
  end



  def top_up(amount)
    fail "The limit is #{BALANCE_LIMIT}" if full?(amount)
    @balance += amount
  end

  def in_journey?
    @new_journey.in_progress?
  end

private

  def full?(amount)
    @balance + amount > BALANCE_LIMIT
  end

  def insufficient_balance?
    @balance < MIN_BALANCE
  end

  def deduct(fare)
    @balance -= fare
  end

end

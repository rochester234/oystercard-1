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
    #@station = nil
  end

  def touch_in(station)
    fail "Insufficient funds, please top up #{MIN_BALANCE}" if insufficient_balance?
    #@journey[:entry_station] = station
    #@station = station
    @new_journey = Journey.new
    @new_journey.touch_in(station)

  end

  def touch_out(station)
    deduct(@new_journey.calculate_fare)
    #@journey[:exit_station] = station
    #@journeys << {@station => station}
    @new_journey.touch_out(station)
    #@station = nil
  end



  def top_up(amount)
    fail "The limit is #{BALANCE_LIMIT}" if full?(amount)
    @balance += amount
  end

  def in_journey?
    @station == nil ? false : true
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

require './lib/station'
require_relative 'journey'

class Oystercard

  attr_reader :balance, :journeys, :journey
  DEFAULT_BALANCE = 0
  BALANCE_LIMIT = 90
  MIN_BALANCE = 1

  def initialize(balance = DEFAULT_BALANCE, journey_klass = 'tube')
    @balance = balance
    @journey = journey_klass
    @journeys = []
    @station = nil
  end

  def touch_in(station)
    fail "Insufficient funds, please top up #{MIN_BALANCE}" if insufficient_balance?
    #@journey[:entry_station] = station
    new_journey = Journey.new
    new_journey.in_progress = true
    @station = station
  end

  def touch_out(station)
    deduct(MIN_BALANCE)
    #@journey[:exit_station] = station
    @journeys << {@station => station}
    @station = nil
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

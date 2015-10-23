require './lib/station'
require_relative 'journey'
require_relative 'journey_log'

class Oystercard

  attr_reader :balance, :current_journey, :journey_log
  DEFAULT_BALANCE = 0
  BALANCE_LIMIT = 90
  MIN_BALANCE = 1


  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @journey_log = []
  end

  def top_up(amount)
    fail "The limit is #{BALANCE_LIMIT}" if full?(amount)
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient funds, please top up #{MIN_BALANCE}" if insufficient_balance?
    @current_journey = JourneyLog.new
    @current_journey.start_journey(station)
    deduct(current_journey.fare)
    
  end

  def touch_out(station)
    @current_journey.outstanding_charges
    @current_journey.exit_journey(station)
    deduct(@current_journey.fare)
    @journey_log << @current_journey.journeys
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

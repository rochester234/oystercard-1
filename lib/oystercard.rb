class Oystercard

  attr_reader :balance, :entry_station, :journeys
  DEFAULT_BALANCE = 0
  BALANCE_LIMIT = 90
  MIN_BALANCE = 1

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @journey = {}
    @journeys = []
  end

  def touch_in(entry_station)
    fail "Insufficient funds, please top up #{MIN_BALANCE}" if insufficient_balance?
    @entry_station = entry_station
    @journey[:entry_station] = entry_station
  end

  def touch_out(exit_station)
    deduct(MIN_BALANCE)
    @journey[:exit_station] = exit_station
    @journeys << @journey
    @entry_station = nil
  end


  def in_journey?
    entry_station == nil ? false : true
  end

  def top_up(amount)
    fail "The limit is #{BALANCE_LIMIT}" if full?(amount)
    @balance += amount
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

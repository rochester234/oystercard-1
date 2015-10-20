class Oystercard

  attr_accessor :balance, :in_journey
  DEFAULT_BALANCE = 0
  BALANCE_LIMIT = 90

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  def top_up(amount)
    fail "The limit is 90" if amount + balance > BALANCE_LIMIT
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end
end

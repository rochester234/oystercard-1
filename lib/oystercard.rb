class Oystercard

  attr_accessor :balance, :in_journey
  DEFAULT_BALANCE = 0
  BALANCE_LIMIT = 90
  MIN_BALANCE = 1

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def touch_in
    fail "Insufficient funds, please top up #{MIN_BALANCE}" if balance < MIN_BALANCE
    @in_journey = true
  end

  def touch_out
    deduct(MIN_BALANCE)
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  def top_up(amount)
    fail "The limit is 90" if amount + balance > BALANCE_LIMIT
    @balance += amount
  end

private

  def deduct(fare)
    @balance -= fare
  end
end

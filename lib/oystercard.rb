class Oystercard

  attr_accessor :balance
  DEFAULT_BALANCE = 0
  BALANCE_LIMIT = 90

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(amount)
    fail "The limit is 90" if amount + balance > BALANCE_LIMIT
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end
end

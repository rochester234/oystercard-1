require 'oystercard'

describe Oystercard do
  # let (:oystercard) {Oystercard.new}
  it "has a balance of zero" do
    expect(subject.balance).to eq (0)
  end

describe '#top_up' do
  it "responds to top_up" do
    expect(subject).to respond_to(:top_up).with(1).argument
  end

  it "tops up by an amount" do
    expect{subject.top_up 1}.to change{subject.balance}.by 1
  end

  it "has a maximum balance at 90" do
    max_balance = Oystercard::BALANCE_LIMIT
    subject.top_up(max_balance)
    expect{subject.top_up 1}.to raise_error "The limit is 90"
  end
end

describe '#deduct' do
  it 'deducts money from card' do
    oystercard = Oystercard.new(30)
    balance = oystercard.balance
    fare = 2
    expect(oystercard.deduct(fare)).to eq (balance - fare)
  end
end

describe "#touch_in" do
  it   { expect(subject).to respond_to(:touch_in) }

  it "should return in journey when touched in" do
    oystercard = Oystercard.new(5)
    oystercard.touch_in
    expect(oystercard.in_journey?).to eq true
  end

  it "should return in journey when touched in" do
    oystercard = Oystercard.new()
    message = "Insufficient funds, please top up #{Oystercard::MIN_BALANCE}"
    expect{oystercard.touch_in}.to raise_error message
  end
end

describe "#touch_out" do

  it   { expect(subject).to respond_to(:touch_out) }

  it "should return in journey when touched out" do
    oystercard = Oystercard.new
    oystercard.touch_out
    expect(oystercard.in_journey?).to eq false
  end

  end
end

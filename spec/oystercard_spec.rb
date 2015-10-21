require 'oystercard'

describe Oystercard do
  let (:entry_station) {double :entry_station}

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
    expect{subject.top_up 1}.to raise_error "The limit is #{Oystercard::BALANCE_LIMIT}"
  end
end

describe '#deduct' do
  it 'deducts money from card' do
    subject.top_up(Oystercard::MIN_BALANCE)
    subject.touch_in(entry_station)
    expect{subject.touch_out}.to change{subject.balance}.by(-Oystercard::MIN_BALANCE)
  end
end

describe "#touch_in(entry_station)" do
  before(:each) do
    subject.top_up(Oystercard::MIN_BALANCE)
    subject.touch_in(entry_station)
  end

  it   { expect(subject).to respond_to(:touch_in) }



  it "should return in journey when touched in" do
    expect(subject.in_journey?).to eq true
  end

  it "should return in journey when touched in" do
    subject.touch_out
    message = "Insufficient funds, please top up #{Oystercard::MIN_BALANCE}"
    expect{subject.touch_in(entry_station)}.to raise_error message
  end

  it "shoud return entry station when in journey" do
    expect(subject.entry_station).to eq entry_station
  end

end

describe "#touch_out" do
  before(:each) do
    subject.top_up(Oystercard::MIN_BALANCE)
    subject.touch_in(entry_station)
    subject.touch_out
  end

  it   { expect(subject).to respond_to(:touch_out) }

  it "should return in journey when touched out" do
    expect(subject.in_journey?).to eq false
  end

  it "should charge when touching out" do
    expect{subject.touch_out}.to change{subject.balance}.by(-Oystercard::MIN_BALANCE)
  end

  it "should return nil when not in journey" do
    expect(subject.entry_station).to eq nil
  end

  end
end

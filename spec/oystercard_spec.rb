require 'oystercard'

describe Oystercard do
  let (:station) {double :station, name: "Aldgate", zone: 1, entry_station: "Aldgate", exit_station: 'Monument', entrystation: "Aldgate", exitstation: "Monument"}
    let (:journey) {double :journey}

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
    allow(subject).to receive(:journey).and_return(journey)
    subject.top_up(Oystercard::MIN_BALANCE)
    subject.touch_in(station)
    expect{subject.touch_out(station)}.to change{subject.balance}.by(-Oystercard::MIN_BALANCE)
  end
end

describe "#touch_in(station)" do
  before(:each) do
    subject.top_up(Oystercard::MIN_BALANCE)
    subject.touch_in(station)
  end

  it   { expect(subject).to respond_to(:touch_in) }

  it 'checks a journey is in progress after a touch in' do
      expect(subject.in_journey?).to eq true
  end

  it "should return wn error when insufficient funds" do
    subject.touch_out(station)
    message = "Insufficient funds, please top up #{Oystercard::MIN_BALANCE}"
    expect{subject.touch_in(station)}.to raise_error message
  end


end

describe "#touch_out(exit_station)" do
  before(:each) do
    subject.top_up(Oystercard::MIN_BALANCE)
    subject.touch_in(station)
  end

  it   { expect(subject).to respond_to(:touch_out) }

  it 'should show a journey is not in progress after touch out' do
    subject.touch_out(station)
    expect(subject.in_journey?).to eq false
  end

  it "should charge when touching out" do
    expect{subject.touch_out(station)}.to change{subject.balance}.by(-Oystercard::MIN_BALANCE)
  end
end

describe '#fare penalty for not completing journey' do
let (:station1) {double :station, name: "Aldgate", zone: 1, exit_station: 'Monument', exitstation: "Monument"}
let (:station2) {double :station, name: "Aldgate", zone: 1, entry_station: "Aldgate", entrystation: "Aldgate", exitstation: "bank"}
let (:station3) {double :station, name: "Aldgate", zone: 1, entry_station: "Aldgate", entrystation: "Aldgate"}

  it 'charges a penalty fare if upon touch out there is no entry station' do
    expect{subject.touch_out(station1)}.to change{subject.balance}.by(-Journey::PENALTY)
  end
  # it 'charges a penalty fare if upon touch in, the previous journey did not touch out' do
  #   subject.top_up(Oystercard::BALANCE_LIMIT)
  #   subject.touch_in(station2)
  #   expect{subject.touch_in(station3)}.to change{subject.balance}.by(-(Journey::PENALTY + 1))
  # end

end

end

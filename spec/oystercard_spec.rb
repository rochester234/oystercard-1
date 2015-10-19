require 'oystercard'

describe Oystercard do
  let (:oystercard) {Oystercard.new}
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

end

require 'oystercard'

describe Oystercard do
  it "has a balance of zero" do
    card = Oystercard.new
    expect(subject.balance).to eq (0)
  end


end

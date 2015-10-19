require 'oystercard'

describe Oystercard do
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
end


end

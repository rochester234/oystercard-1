it 'records a journey' do
  expect(subject.journeys).to be_empty
end

it "should return in journey when touched in" do
  expect(subject.in_journey?).to eq true
end
it "shoud return entry station when in journey" do
  expect(subject.in_journey?).to eq true
end

it "should return in journey when touched out" do
  expect(subject.in_journey?).to eq false
end

it "should return nil when not in journey" do
  expect(subject.in_journey?).to eq false
end

it "should record one journey (set of an entry and exit stations)" do
  expect(subject.journeys).to eq [{station => station1}]
  end
end

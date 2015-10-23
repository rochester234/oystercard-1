require './lib/oystercard'

describe Journey do
let(:station) {double :station, entry_station: "Aldgate"}
let(:oystercard) {double :oystercard, touch_in: station}
  it 'should store a station in entry station' do
    oystercard.touch_in(station)
  expect(subject.entry_station).to eq "Aldgate"
end

  it 'should store a station in exit' do
  expect(subject.touch_out(station)).to eq station.name
  end

  it 'should calculate a fare' do
  expect(subject.calculate_fare).to eq 1
  end

  describe '#in_progress?' do
      it 'journey status should be false when initialized' do
        expect(subject.in_progress).to eq false
      end

      it ' should return in progres to true when touched in' do
        subject.touch_in(station)
        expect(subject.in_progress).to be true
      end
      it 'should return in progress to false when touched out' do
        subject.touch_out(station)
        expect(subject.in_progress).to be false
      end
  end
end




# it 'records a journey' do
#   expect(subject.journeys).to be_empty
# end
#
# it "should return in journey when touched in" do
#   expect(subject.in_journey?).to eq true
# end
# it "shoud return entry station when in journey" do
#   expect(subject.in_journey?).to eq true
# end
#
# it "should return in journey when touched out" do
#   expect(subject.in_journey?).to eq false
# end
#
# it "should return nil when not in journey" do
#   expect(subject.in_journey?).to eq false
# end
#
# it "should record one journey (set of an entry and exit stations)" do
#   expect(subject.journeys).to eq [{station => station1}]
#   end
# end

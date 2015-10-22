
# in progress
#
# fare_calc
#
# start_journey
#
# end_journey
#
# attr journey_log
require 'oystercard'
require 'journey'

describe Journey do

  let (:oystercard) {double :oystercard, touch_in = true}


  it { expect(subject).to respond_to(:in_progress?) }

  it { expect(subject).to respond_to(:fare_calc) }

  it { expect(subject).to respond_to(:start_journey) }

  it { expect(subject).to respond_to(:end_journey) }

  context 'testing journey class functionality' do
    it "#in_progress should tell us when we're in_journey" do
      card = Oystercard.new
      card.top_up(10)
      station = Station.new
      card.touch_in(station)
      expect(subject.in_progress?).to eq true
    end
  end

end

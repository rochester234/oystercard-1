require 'oystercard'

describe JourneyLog do
  subject(:journey_log) { described_class.new(journey_klass: journey_klass) }

  let(:journey_klass) { double(:journey_klass) }

  let(:journey) { double(:journey) }

  describe "Starting a journey" do
    it "adds a journey to the log" do
      allow(journey_klass).to receive(:new).with(:station).and_return(journey)
      journey_log.start_journey(:station)
      expect(journey_log.journeys).to include(journey)
    end
  end
end

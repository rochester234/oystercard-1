require 'station'

describe Station do

subject {described_class.new("Old Street",1)}

it "station has a name" do
  expect(subject.name).to eq("Old Street")
end

it "station has a zone" do
  expect(subject.zone).to eq(1)
end

end

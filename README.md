# Makers Academy: Oystercard



##Challenge_12:
We now need to store the previous journeys in a variable (journeys).
Each journey can be recorded with entry_station and exit_station.

Let's use a hash for each journey with:

  *entry_station/exit_station as a key.
  *names of entry_station/exit_station as a value.

##Challenge_13:
We want to attribute a zone to each station.
We therefore need to create a station class that can respond to zone.

NB: defining subject in rspec when subject takes 2 arguments, syntax is:
subject {described_class.new("Old Street",1)}

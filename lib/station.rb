require './lib/oystercard'
class Station

attr_reader :name, :zone
# , :entrystation, :exitstation

    def initialize(name, zone)
    @name = name
    @zone = zone
    end

    # def entry_station
    #   @entrystation = @name
    # end
    #
    # def exit_station
    #   @exitstation = @name
    # end

end

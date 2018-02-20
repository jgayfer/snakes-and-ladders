module Snakes
  class Transition
    attr_reader :start_index, :dest_index

    def initialize(start_index, dest_index)
      @start_index = start_index
      @dest_index = dest_index
    end
  end
end

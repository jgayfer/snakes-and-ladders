module Snakes
  class Board
    attr_reader :winning_index, :dimension, :transitions

    def initialize(transitions, dimension)
      @dimension = dimension
      @winning_index = dimension**2 - 1
      @transitions = transitions
    end

    def compute_destination_index(start_index)
      transition = @transitions.find { |t| t.start_index == start_index }
      new_index = transition ? transition.dest_index : start_index
      new_index > @winning_index ? @winning_index : new_index
    end
  end
end

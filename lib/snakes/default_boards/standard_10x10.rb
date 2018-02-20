require_relative '../transition'
require_relative '../board'

module Snakes
  module DefaultBoards
    STANDARD_BOARD_DIMENSION = 10
    class Standard10x10
      class << self
        def new
          Board.new(transitions, STANDARD_BOARD_DIMENSION)
        end

        def transitions
          ladders = [Transition.new(1, 37),
                    Transition.new(20, 41),
                    Transition.new(3, 13),
                    Transition.new(8, 30),
                    Transition.new(27, 83),
                    Transition.new(50, 66),
                    Transition.new(79, 99),
                    Transition.new(70, 90)]
          snakes  = [Transition.new(16, 6),
                    Transition.new(61, 18),
                    Transition.new(86, 23),
                    Transition.new(53, 33),
                    Transition.new(63, 59),
                    Transition.new(96, 78),
                    Transition.new(94, 74),
                    Transition.new(92, 72)]
          ladders + snakes
        end
      end
    end
  end
end

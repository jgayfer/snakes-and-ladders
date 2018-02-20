module Snakes
  class PlayerState
    attr_reader :player, :index, :last_roll

    def initialize(player, index = 0, last_roll = 0)
      @player = player
      @index = index
      @last_roll = last_roll
    end
  end
end

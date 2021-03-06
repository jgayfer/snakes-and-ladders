require_relative 'snakes/player'
require_relative 'snakes/player_state'
require_relative 'snakes/transition'
require_relative 'snakes/board'
require_relative 'snakes/game'
require_relative 'snakes/die'
require_relative 'snakes/text_formatter'
require_relative 'snakes/json_formatter'
require_relative 'snakes/default_boards/standard_10x10'
require_relative 'snakes/version'

# While not explicitly neccessary, this code provides a helper method
# for creating a new game of snakes and ladders. This can be done
# manually, but it can be tedious if the desired outcome is a standard game.
module Snakes
  class << self
    def standard_game(player_names, die_sides = 6)
      die = Die.new(die_sides)
      board = Snakes::DefaultBoards::Standard10x10.new
      Game.new(board, initial_player_states(player_names), die)
    end

    private

    def initial_player_states(player_names)
      player_names.map do |player_name|
        PlayerState.new(Player.new(player_name))
      end
    end
  end
end

require_relative 'player_state'

module Snakes
  class Game
    attr_reader :board

    def initialize(board, initial_player_states, rules)
      @board = board
      @move_history = initial_player_states
      @rules = rules
    end

    def move_next_player
      roll_num = @rules.roll_dice
      current_index = current_state(next_player).index
      new_index = @board.compute_destination_index(current_index + roll_num)
      @move_history << PlayerState.new(next_player, new_index, roll_num)
    end

    def last_move_was_a_win
      @move_history.last.index == @board.winning_index
    end

    def last_roll(player)
      current_state(player).last_roll
    end

    def previous_player
      @move_history.last.player
    end

    def next_player
      current_player_states.first.player
    end

    def players_at_index(index)
      current_player_states.select { |p_state| p_state.index == index }.map(&:player)
    end

    def players
      @move_history.uniq(&:player)
    end

    private

    def current_player_states
      @move_history.last(players.count)
    end

    def current_state(player)
      @move_history.select { |p_state| p_state.player == player }.last
    end
  end
end

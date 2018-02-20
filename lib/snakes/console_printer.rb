class ConsolePrinter
  def initialize(game)
    @game = game
  end

  def display_board
    puts
    (0..(dimension - 1)).reverse_each do |row_num|
      print_row(row_num)
      puts
    end
  end

  private

  def print_row(row_num)
    dimension.times do |index|
      index += row_num * 10
      print_square(index)
    end
    puts '|'
  end

  def print_square(index)
    print "| #{square_num_str(index)} #{transition_str(index)}"\
          " #{players_str(index)} "
  end

  def square_num_str(index)
    (index + 1).to_s.ljust(max_digit_count)
  end

  def transition_str(index)
    transition = @game.board.transitions.find { |t| t.start_index == index }
    if transition
      dest_index_str = (transition.dest_index + 1).to_s.ljust(max_digit_count)
      "#{transition_symbol(transition)}->#{dest_index_str}"
    else
      ''.ljust(max_digit_count + 3)
    end
  end

  def players_str(index)
    players = @game.players_at_index(index) || []
    player_symbols = players.map { |player| player_symbol(player) }
    player_symbols.join.ljust(@game.players.count)
  end

  def transition_symbol(transition)
    transition.start_index > transition.dest_index ? 'S' : 'L'
  end

  def player_symbol(player)
    player.name[0].upcase
  end

  def max_digit_count
    (@game.board.winning_index + 1).to_s.size
  end

  def dimension
    @game.board.dimension
  end
end

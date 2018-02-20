require_relative '../lib/snakes'

game = Snakes.standard_game(%w[James Sebastian])

until game.last_move_was_a_win
  Snakes.print(game)
  player = game.next_player
  print "It's your turn #{player}. Press any key to roll the dice: "
  gets.chomp
  game.move_next_player
  puts "You rolled a #{game.last_roll(player)}"
end

Snakes.print(game)
puts "#{player} wins!"

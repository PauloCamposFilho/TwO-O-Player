require './game'

begin
game = Game.new()
game.game_start
rescue ArgumentError => e
  puts "Could not start game. Error: #{e.message}"
end
exit 0
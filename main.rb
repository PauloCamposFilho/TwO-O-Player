require './player'
require './question'

print "Who will be Player1? "
name1 = gets.chomp
print "and who will be Player2? "
name2 = gets.chomp

if name1.strip.empty? || name2.strip.empty?
  exit 0
end

player1 = Player.new(name1)
player2 = Player.new(name2)
last_to_play = player1

puts "#{player1.name} vs #{player2.name}! You each start with #{Player.starting_score} lives!"

while player1.current_score > 0 && player2.current_score > 0
  question = Question.new()
  puts question.text
  print "#{last_to_play.name} > "
  answer = gets.chomp.to_i
  if answer != question.answer
    last_to_play.lose_life
    puts "Oof, #{last_to_play.name}! You answered #{answer} but the actual answer was #{question.answer}. Lives remaining: #{last_to_play.current_score}"
  else
    puts "Well done, #{last_to_play.name}! Right on! You still have #{last_to_play.current_score} lives remaining"
  end
  puts "---- NEW TURN ----"
  if last_to_play == player2
    last_to_play = player1
  else
    last_to_play = player2
  end
end

puts "Game over!"
if player1.current_score > 0
  winner = player1
else
  winner = player2
end
puts "Congratulations #{winner.name}! You had #{winner.current_score} lives left! a #{winner.current_score} - 0 victory!"
exit 0
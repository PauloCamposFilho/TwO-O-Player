require './player'
require './question'

class Game
  def initialize
    print "Who will be Player 1? "
    player1_name = gets.chomp
    print "and who will be Player 2? "
    player2_name = gets.chomp

    player1_name = player1_name.strip
    player2_name = player2_name.strip

    if player1_name.empty? || player2_name.empty?
      raise ArgumentError, "Player names cannot be empty."
    end
    @player1 = Player.new(player1_name)
    @player2 = Player.new(player2_name)
    # Randomize player going first. Coin toss
    @current_player = randomize_starting_player()
  end

  def randomize_starting_player
    rand(2) == 0 ? @player1 : @player2
  end

  def generate_question
    @question = Question.new()
  end

  def change_turn
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def game_over?
    @player1.current_score == 0 || @player2.current_score == 0
  end

  def winner
    if @player1.current_score > 0
      return @player1
    end
    return @player2
  end

  def game_loop
    while !game_over?
      generate_question
      puts @question.text
      print "#{@current_player.name} > "
      answer = gets.chomp.to_i
      if !@question.is_correct?(answer)
        @current_player.lose_life
        puts "Oof, #{@current_player.name}! You answered #{answer} but the actual answer was #{@question.correct_answer}. Lives remaining: #{@current_player.current_score}"
      else
        puts "Well done, #{@current_player.name}! Right on! You still have #{@current_player.current_score} lives remaining"
      end
      puts "---- NEW TURN ----"
      change_turn()
    end
  end

  def game_end
    puts "Game over!"
    puts "Congratulations #{winner.name}! You had #{winner.current_score} lives left! a #{winner.current_score} - 0 victory!"
  end

  def game_start
    puts "Coin toss to determine who goes first!"
    puts "Looks like #{@current_player.name} gets to start"
    game_loop
    game_end
  end
end
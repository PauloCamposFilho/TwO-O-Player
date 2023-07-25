class Player
  attr_reader :name, :lives
  INITIAL_LIVES = 3
  def initialize(name)
    @name = name
    @lives = INITIAL_LIVES
  end
  def lose_life
    @lives -= 1
  end
  def current_score
    @lives
  end
  def self.starting_score
    INITIAL_LIVES
  end
end
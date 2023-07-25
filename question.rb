class Question
  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @answer = @num1 + @num2
  end
  def text
    "What is #{@num1} plus #{@num2}?"
  end
  def correct_answer
    @answer
  end
  def is_correct?(answer)
    answer == @answer
  end
end

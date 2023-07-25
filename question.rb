class Question
  attr_reader :text, :answer
  def initialize
    num1 = rand(1..20)
    num2 = rand(1..20)
    @text = "What is #{num1} plus #{num2}?"
    @answer = num1 + num2
  end
  def text
    @text
  end
  def answer
    @answer
  end
end

class Guesser
  attr_reader :type
  def initialize(type)
    @type = type
  end

  def guess
    type == :human ? human_guess : computer_guess
  end

  private

  def human_guess
    guess = []
    guess = gets.chomp.upcase.split(" ")
  end

  def computer_guess
    colors = %w(R G B Y P W)
    guess = colors.sample(4)
  end
end
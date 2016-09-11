class Board
  attr_accessor :board
  def initialize
    @board = Array.new(12) { Array.new(5) { "x" } }
  end

  def show_board
    board.each do |row|
      puts row.join(" ")
    end
  end

  def update_board(guess, turn)
    board[-turn] = guess.colorize
  end
end


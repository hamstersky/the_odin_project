class Game
  attr_reader :codemaker, :guesser, :secret_code, :board
  attr_accessor :turn
  def initialize
    types = game_mode
    @guesser = Guesser.new(types[0])
    @codemaker = Codemaker.new(types[1])
    @board = Board.new
    @turn = 1
    @secret_code = codemaker.secret_code
  end

  def guess_prompt
    puts "#{colors.join(", ")}. Make your guess: "
  end

  def check_guess
    guess = guesser.guess
    puts "#{guesser.type} guess: #{guess.join(" ")}"
    good_color = 0
    good_position = 0
    return :win if secret_code == guess
    guess.each_with_index do |x, index|
      if x == secret_code[index]
        good_position += 1
        good_color += 1
      elsif secret_code.include?(x)
        good_color += 1
      end 
    end
    feedback = "Good position: #{good_position}, good color: #{good_color}"
    guess << feedback
    board.update_board(guess, turn)
  end

  def play
    while true
      board.show_board
      guess_prompt if guesser.type == :human
      if check_guess == :win
        board.show_board
        puts "#{guesser.type} wins!"
        return
      elsif turn == 12
        board.show_board
        puts "#{codemaker.type} wins!"
        puts "The secret code was #{secret_code.colorize.join(" ")}"
        return
      end
      @turn += 1
    end
  end

  private

  def game_mode
    types = []
    puts "You want to be the GUESSER or CODEMAKER?"
    choice = gets.chomp.upcase
    if choice == "GUESSER"
      (types << [:human, :computer]).flatten!
    else
      (types << [:computer, :human]).flatten!
    end
  end

  def colors
    colors = ["R".red, "G".green, "B".blue, "Y".yellow, "P".purple, "W"]
  end
end
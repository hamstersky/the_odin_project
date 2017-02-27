require 'yaml'

class Hangman
  attr_reader :secret_word, :incorrect_guesses, :correct_guesses

  def initialize(dictionary_file, *load)
    @secret_word = random_word(dictionary_file)
    @incorrect_guesses = []
    @correct_guesses = []
  end

  def play
    until chances_left == 0 || win?
      puts '------------------------------------------------------------------'
      puts "Incorrect guesses: #{incorrect_guesses.join(" ")}\n\n" if !incorrect_guesses.empty?
      puts "Chances left: #{chances_left}\n\n"
      puts "Try to guess:\n #{display_word}\n\n"
      evaluate_guess(player_guess)
    end

    if win?
      puts "You won! The word was #{secret_word}"
    else
      puts "You lose! The word was #{secret_word}"
    end
  end

  private

  def create_dictionary(file_name)
  end

  def random_word(file_name)
    dictionary = File.readlines(file_name).map { |word| word.strip.downcase}
    word = dictionary.select { |word| word.length > 4 &&
                                      word.length < 12}.sample
  end

  def display_word
    secret_word.split('').map do |char|
      if correct_guesses.include?(char)
        char
      else
        '_'
      end
    end.join(' ')
  end

  def chances_left
    6 - incorrect_guesses.length
  end

  def player_guess
    guess = ''
    until valid_guess?(guess)
      puts "Enter a letter or write 'save' to save the game: "
      guess = gets.chomp
      save if guess == 'save'
    end
    guess
  end

  def evaluate_guess(guess)
    if secret_word.include?(guess)
      correct_guesses << guess
    else
      incorrect_guesses << guess
    end
  end

  def win?
    !display_word.include?('_')
  end

  def valid_guess?(guess)
    !guess.empty?
  end

  def save
    puts "Enter save name: "
    save_name = gets.chomp
    save_file = File.new("saves/#{save_name}", 'w')
    save_file.puts(YAML::dump(self))
    save_file.close
    puts "Game saved!"
    play
  end
end

puts "MAIN MENU"
puts "----------"
puts "1. New Game"
puts "2. Load"
puts "3. Exit"
user_input = gets.chomp
case user_input
when '1' 
  game = Hangman.new('5desk.txt')
  game.play
when '2'
  puts "\n"
  puts "Saves:"
  puts "----------"
  Dir.glob("saves/*").each_with_index do |file, index|
    puts "#{index + 1}. #{File.basename(file)}"
  end
  while true
    puts "\nChoose save number: "
    save_number = gets.chomp.to_i
    if !Dir.glob("saves/*")[save_number - 1].nil?
      load = YAML::load_file(Dir.glob("saves/*")[save_number - 1])
      puts "Save loaded!"
      load.play 
    else
      puts "Save doesn't exist!\n"
    end
  end
when '3'
  exit
else
  puts "Invalid input! Aborting..."
  exit
end
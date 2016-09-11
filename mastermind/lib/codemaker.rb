class Codemaker
  attr_reader :type, :secret_code
  def initialize(type)
    @type = type
    @secret_code = generate_code
  end

  def generate_code
    (type == :human) ? human_made_code : computer_made_code
  end

  private

  def human_made_code
    code = []
    loop do
      puts "Colors to choose: #{colors.join(", ")}.\nEnter a secret code: "
      input = gets.chomp.upcase
      code = input.split(" ")
      break if valid_code?(code)
      puts "Code invalid! Try again."
    end
    code
  end

  def computer_made_code
    colors = %w(R G B Y P W)
    code = colors.sample(4)
  end

  def valid_code?(code)
    return true if code.uniq.size == 4
    false
  end

  def colors
    colors = %w(R G B Y P W).colorize
  end
end

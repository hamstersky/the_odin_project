def echo(string)
  "#{string}"
end

def shout(string)
  string.upcase
end

def repeat(string, n = 2)
  repeat = []
  n.times do
    repeat << string
  end
  repeat.join(" ")
end

def start_of_word(string, start)
  string[0..(start - 1)]
end

def first_word(string)
  string.split(" ").first
end

def titleize(string)
  small_words = %w(a an and the over)
  string = string.split(" ").map do |word|
    if small_words.include?(word)
      word
    else
      word.capitalize
    end 
  end
  string.first.capitalize!
  string.join(" ")
end


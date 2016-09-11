def translate(string)
  vowels = %w(a e i o u)
  string = string.split(" ")
  string.map! do |word|
    if vowels.include?(word[0])
      word += "ay"
    else
      consonants = ""
      until vowels.include?(word[0])
        consonants << word.slice!(0)
        if word[0] == "u" && consonants[-1] == "q"
          consonants << word.slice!(0)
        end
      end
      word = word + consonants + "ay"
    end
  end
  string.join(" ")
end
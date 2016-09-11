class Book
  attr_accessor :title
  def title
    non_capitalized = %w(a an and in of the)
    @title = @title.split(' ').map do |word|
      if non_capitalized.include?(word)
        word
      else
        word.capitalize
      end
    end
    @title.first.capitalize!
    @title.join(' ') 
  end
end
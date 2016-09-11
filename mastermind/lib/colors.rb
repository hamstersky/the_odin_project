class String
  def red
    "\e[31m#{self}\e[0m"
  end

  def green
    "\e[32m#{self}\e[0m"
  end

  def yellow
    "\e[33m#{self}\e[0m"
  end

  def blue
    "\e[34m#{self}\e[0m"
  end

  def purple
    "\e[35m#{self}\e[0m"
  end
end

class Array
  def colorize
    self.map do |element|
      case element
      when "R" then "R".red
      when "G" then "G".green
      when "Y" then "Y".yellow
      when "B" then "B".blue
      when "P" then "P".purple
      else element
      end
    end
  end
end
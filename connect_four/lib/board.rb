require_relative 'cell'

class Board
	attr_accessor :grid
	
	def initialize
		@grid = default_grid
	end

	def update_cell(x, color)
		if move_valid?(x)
			grid.reverse.each do |row|
				if row[x].color == ''
					row[x].color = color
					break
				end
			end
		else
			puts "Move not possible! Not enough space in the column!"
			return false
		end
	end

	def show_board
		str = ''
		grid.each do |row|
			str << "|"
			row.each do |cell|
				cell.color.empty? ? str << " " : str << cell.color
				str << "|"
			end
			str << "\n"
		end
		str << "---------------\n"
		str << " 0 1 2 3 4 5 6 "
		puts str
	end

	private

	def default_grid
		Array.new(6) { Array.new(7) { Cell.new } }
	end

	def move_valid?(x)
		grid.transpose[x].any? { |cell| cell.color.empty? } ? true : false
	end

end
require_relative 'board'
require_relative 'player'

class Game
	attr_accessor :current_player, :other_player
	attr_reader :board, :players

	def initialize
		@board = Board.new
		@players = [Player.new("\e[31m\u25cf\e[0m"), Player.new("\e[33m\u25cf\e[0m")]
		@current_player = players.shuffle![0]
		@other_player = players[1]
	end

	def start_game
		until winner? || draw?
			switch_players
			board.show_board
			puts "Player #{current_player.color} turn."
			move = prompt_move
			board.update_cell(move, current_player.color)
		end
		board.show_board
		if winner?
			puts "#{current_player.color} wins!"
		else
			puts "Draw!"
		end
	end

	def prompt_move
		puts "Make your move by typing the column number(0-6): "
		move = gets.to_i		
	end

	def switch_players
		@current_player, @other_player = @other_player, @current_player
	end

	def winner?
		if winning_row? || winning_column? || winning_diagonal?
			return true
		end
		return false
	end

	def draw?
		board.grid.each do |row|
			if row.any? { |cell| cell.color.strip.empty? }
				return false
			end
		end
		return true
	end

	def winning_row?
		board.grid.each do |row|
			4.times do |i|
				first = row[i]
				if !first.color.empty? && row[i..(i+3)].all? { |cell| cell.color == first.color } 
					return true
				end
			end
		end
		return false
	end

	def winning_column?
		board.grid.transpose.each do |row|
			3.times do |i|
				first = row[i]
				if !first.color.empty? && row[i..(i+3)].all? { |cell| cell.color == first.color } 
					return true
				end
			end
		end
		return false
	end

	def winning_diagonal?
		diagonals = collect_diagonals
		diagonals.each do |diagonal|
			3.times do |i|
				first = diagonal[i]
				if !first.color.empty? && diagonal[i..(i+3)].all? { |cell| cell.color == first.color } 
					return true
				end
			end
		end
		return false
	end

	def collect_diagonals
		diagonals = []
		board.grid[0].each_with_index do |cell, index|
			result = []
			row = 0
			column = index
			until column == 6
				result << board.grid[row][column]
				row +=1 
				column +=1
			end
			diagonals << result
		end
		board.grid[0].each_with_index do |cell, index|
			result = []
			row = 0
			column = index
			until column == 0
				result << board.grid[row][column]
				row +=1 
				column -=1
			end
			diagonals << result
		end
		diagonals.select { |diagonal| diagonal.length >= 4 }
	end

end

g = Game.new
# g.board.update_cell(0, g.current_player.color)
# g.board.update_cell(1, g.other_player.color)
# g.board.update_cell(2, g.current_player.color)
# g.board.update_cell(3, g.current_player.color)
# g.board.show_board

# g.board.grid[0][6].color = 'r'
# g.board.grid[1][5].color = 'r'
# g.board.grid[2][4].color = 'r'
# g.board.grid[3][3].color = 'r'
# g.board.grid[4][2].color = 'y'
# g.board.grid[5][1].color = 'r'
# g.board.show_board

# p g.winner?
# p g.collect_diagonals


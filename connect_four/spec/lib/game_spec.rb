require 'spec_helper'
require 'game'
require 'cell'

describe Game do

	game = Game.new
	board = game.board

	describe "#initialize" do
		it "creates a new board when initialized" do
			expect(game.board).to be_a(Board)
		end

		it "creates two players with different colors" do
			expect(game.players[0].color).not_to be(game.players[1].color) 
		end

		it "sets a random current player" do
			allow(game.players).to receive(:shuffle).and_return([game.players[0], game.players[1]])
			expect(game.current_player).to eql(game.players[0])
		end

		it "sets another player" do
			allow(game.players).to receive(:shuffle).and_return([game.players[0], game.players[1]])
			expect(game.other_player).to eql(game.players[1])			
		end
	end


	describe "#start_game" do

		it "switches current player each turn" do

		end
	end

	describe "#winner?" do

		before(:example) do
			game = Game.new
			board = game.board
		end

		context "no win - empty board" do
			it "returns false" do
				expect(game.winner?).to be false
			end
		end

		context "row win - when there are 4 adjacent cells of same color in a row" do

			it "returns true" do
				board.grid[0][0].color = 'r'
				board.grid[0][1].color = 'y'
				board.grid[0][2].color = 'y'
				board.grid[0][3].color = 'r'
				board.grid[0][4].color = 'r'
				board.grid[0][5].color = 'r'
				board.grid[0][6].color = 'r'

				expect(game.winner?).to be true
			end
		end

		context "column win - when there are 4 adjacent cells of same color in a column" do
			it "returns true" do
				board.grid[0][0].color = 'r'
				board.grid[1][0].color = 'y'
				board.grid[2][0].color = 'r'
				board.grid[3][0].color = 'r'
				board.grid[4][0].color = 'r'
				board.grid[5][0].color = 'r'

				expect(game.winner?).to be true
			end
		end

		context "downhill diagonal win" do
			it "returns true" do
				board.grid[0][0].color = 'r'
				board.grid[1][1].color = 'y'
				board.grid[2][2].color = 'r'
				board.grid[3][3].color = 'r'
				board.grid[4][4].color = 'r'
				board.grid[5][5].color = 'r'


				expect(game.winner?).to be true
			end
		end

		context "uphill diagonal win" do
			it "returns true" do
				board.grid[0][6].color = 'r'
				board.grid[1][5].color = 'y'
				board.grid[2][4].color = 'r'
				board.grid[3][3].color = 'r'
				board.grid[4][2].color = 'r'
				board.grid[5][1].color = 'r'

				expect(game.winner?).to be true
			end
		end
	end

	describe "#draw?" do

		before(:example) do
			game = Game.new
			board = game.board
		end

		context "all cells taken, but no winner" do
			it "returns true" do
				grid = [[Cell.new('a'), Cell.new('b'), Cell.new('c')],
								[Cell.new('d'), Cell.new('e'), Cell.new('f')]]
				board.grid = grid

				expect(game.draw?).to be true
			end
		end

		context "there are free cells on the grid" do
			it "returns false" do
				grid = [[Cell.new(' '), Cell.new('b'), Cell.new('c')],
								[Cell.new('d'), Cell.new(' '), Cell.new('f')]]
				board.grid = grid

				expect(game.draw?).to be false
			end
		end
	end

	describe "#prompt_move" do
		let(:input) { 0 }

		before do
			allow(game).to receive(:gets).and_return(input)
		end

		it 'prompts a player to make a move' do
			expect { game.prompt_move }.to output.to_stdout
		end

		it "returns the player's move" do
			expect(game.prompt_move).to eql(0)
		end
	end

	describe "#switch_players" do
		it "switches current player with other player" do
			current = game.current_player
			other = game.other_player

			game.switch_players
			expect(game.current_player).to eql(other)  
		end
	end

end
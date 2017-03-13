require 'spec_helper'
require 'tictactoe'

describe Player do

	let(:board) { Board.new }
	let(:player1) { Player.new('test', :X, board) }
	let(:player2) { Player.new('test2', :O, board) }

	describe "#winner?" do

		context "board cells set to player1's vertical win" do

			before do
				board.cells = ['X', 'X', 'X',
											 '4', '5', '6',
											 '7', '8', '9']
			end

			it "returns true for player1" do
				expect(player1.winner?).to be true
			end

			it 'returns false for player2' do
				expect(player2.winner?).to be false				
			end
		end

		context "board cells set to player1's horizontal win" do

			before do
				board.cells = ['X', '2', '3',
											 'X', '5', '6',
											 'X', '8', '9']
			end

			it "returns true for player1" do
				expect(player1.winner?).to be true				
			end

			it "returns false for player2" do
				expect(player2.winner?).to be false
			end

		end

		context "board cells set to player2's diagonal win" do

			before do
				board.cells = ['O', '2', '3',
											 '4', 'O', '6',
											 '7', '8', 'O']
			end

			it "returns false for player1" do
				expect(player1.winner?).to be false				
			end

			it "returns true for player2" do
				expect(player2.winner?).to be true
			end

		end
	end

	describe "#move" do

		context "player1 places marker on a free cell" do
			it "updates the cells array to ['1', '2', '3', 'X', '5', '6', '7', '8', '9']" do
				player1.move(4)
				expect(board.cells).to eql(['1', '2', '3', 'X', '5', '6', '7', '8', '9'])
			end
		end

		context "player1 places marker on a taken cell" do
			it "returns false" do
				player2.move(4)
				expect(player1.move(4)).to be false
			end

			it "prints 'Cell not empty! Choose other cell.'" do
				player2.move(4)
				expect { player1.move(4) }.to output("Cell not empty! Choose other cell.\n").to_stdout
			end
		end

	end

end
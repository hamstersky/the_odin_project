require 'spec_helper'
require	'board'

describe Board do

	let(:board) { Board.new }
	let(:cell) { Cell.new('red')}

	describe "#initialize" do

		context "when initialized with arguments" do
			it "raises an exception" do
				expect { Board.new('something') }.to raise_error(ArgumentError)
			end
		end

		context "when initialized without arguments" do
			it "doesn't raise an exception" do
				expect { Board.new }.to_not raise_error
			end
		end

		it "creates a default grid with 6 rows" do
			expect(board.grid.size).to eql(6)
		end


		it "creates a default grid with 7 columns" do
			expect(board.grid.all? { |row| row.size == 7 }).to be true
		end

		it "creates cells with empty color" do
			expect(board.grid.all? { |row| row.all? { |cell| cell.color == '' } }).to be true
		end
	end

	describe "#update_cell" do

		context "puts checker in a column with enough space" do
			it "updates the grid with a red cell object in column 5" do
				board.update_cell(5, 'red')
				expect(board.grid[5][5].color).to eql('red')
			end

			it "updates the grid with two red cells in column 5" do
				2.times { board.update_cell(5, 'red') }
				expect(board.grid[4][5].color).to eql('red')
			end

			it "updates only one cell" do
				board.update_cell(5, 'red')
				expect(board.grid[0][5].color).to eql('')
			end
		end

		context "puts a checker in a column without enough space" do

			before { 7.times { board.update_cell(0, 'red')} }

			it "returns false" do
				expect(board.update_cell(0, cell)).to be false
			end

			it "prints 'Move not possible! Not enough space in the column!'" do
				expect { board.update_cell(0, cell) }.to output("Move not possible! Not enough space in the column!\n").to_stdout
			end
		end
	end

	describe "#show_board" do

		context "empty board" do
			it "prints an empty board" do
				expect { board.show_board }.to output("| | | | | | | |\n"\
																							"| | | | | | | |\n"\
																							"| | | | | | | |\n"\
																							"| | | | | | | |\n"\
																							"| | | | | | | |\n"\
 																							"| | | | | | | |\n"\
																							"---------------\n"\
																							" 0 1 2 3 4 5 6 \n").to_stdout
			end
		end

		context "full first column" do
			it "prints a grid with 6 'r's in column 0" do
				7.times { board.update_cell(0, 'r')}
				expect { board.show_board }.to output("|r| | | | | | |\n"\
																							"|r| | | | | | |\n"\
																							"|r| | | | | | |\n"\
																							"|r| | | | | | |\n"\
																							"|r| | | | | | |\n"\
 																							"|r| | | | | | |\n"\
																							"---------------\n"\
																							" 0 1 2 3 4 5 6 \n").to_stdout
			end
		end

		context "4 cells" do

			it "prints a grid with 4 'r's in different cells" do
				board.update_cell(0, 'r')
				board.update_cell(0, 'r')
				board.update_cell(2, 'r')
				board.update_cell(4, 'r')

				expect { board.show_board }.to output("| | | | | | | |\n"\
																							"| | | | | | | |\n"\
																							"| | | | | | | |\n"\
																							"| | | | | | | |\n"\
																							"|r| | | | | | |\n"\
 																							"|r| |r| |r| | |\n"\
																							"---------------\n"\
																							" 0 1 2 3 4 5 6 \n").to_stdout
			end
		end
	end

end
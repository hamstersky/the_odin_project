require "spec_helper"
require "cell"

describe Cell do

	let(:cell) { Cell.new('red') }

	describe "#initialize" do

		context "when initialized without arguments" do
			it "color is '' by default" do
				cell = Cell.new
				expect(cell.color).to eql('')
			end
		end

		context "when initialized with more than 1 argument" do
			it "raises an exception" do
				expect { Cell.new('red', 'blue') }.to raise_error(ArgumentError)
			end
		end

		context "when initialized with 1 argument" do
			it "doesn't raise an exception" do
				expect { Cell.new('red') }.to_not raise_error
			end
		end
	end

	describe "#color" do
		it "returns color" do
			expect(cell.color).to eql('red')
		end
	end
end
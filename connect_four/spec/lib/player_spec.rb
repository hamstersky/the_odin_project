require 'spec_helper'
require 'player'

describe Player do

	let(:player) { Player.new('red') }

	describe "#initialize" do

		context "when initialized without arguments" do
			it "raises an exception" do
				expect { Player.new }.to raise_error(ArgumentError)
			end
		end

		context "when initialized with more than 1 argument" do
			it "raises an exception" do
				expect { Player.new('red', 'blue') }.to raise_error(ArgumentError)
			end
		end

		context "when initialized with 1 argument" do
			it "doesn't raise an exception" do
				expect { Player.new('red') }.to_not raise_error
			end
		end

	end

	describe "#color" do
		it "returns player's color" do
			expect(player.color).to eql('red')
		end
	end

end
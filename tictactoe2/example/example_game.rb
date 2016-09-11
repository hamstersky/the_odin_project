require_relative '../lib/tictactoe2.rb'

puts "Welcome to tic tac toe"
bob = TicTacToe2::Player.new({ color: "X", name: "Bob" })
frank = TicTacToe2::Player.new({ color: "O", name: "Frank" })
players = [bob, frank]
TicTacToe2::Game.new(players).play
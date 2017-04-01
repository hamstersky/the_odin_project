Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

game = Game.new
game.start_game
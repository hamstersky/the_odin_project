Dir[File.expand_path(File.dirname(__FILE__)) + "/lib/*.rb"].each { |file| require file}
game = Game.new
game.play
class Knight

  def initialize
    @board = Board.new
  end

  def knight_moves(start, finish)
    start = Node.new(start)
    path = create_path(bfs(start, finish))
    show_path(path)
  end

  def bfs(start, finish)
    queue = [start]
    current = queue.first

    until current.position == finish
      current = queue.shift
      @board.children_moves(current)
      current.children.each { |child| queue << child }
    end
    current
  end

  def create_path(node)
    path = []
    until node == nil
      path << node.position
      node = node.parent
    end
    path.reverse
  end

  def show_path(path)
    puts "You made it in #{path.length} moves! Here's your path:"
    path.each do |square|
      puts "#{square}"
    end
  end

end

class Board
  def possible_moves(node)
    x, y = node.position
    moves = [
      [x + 2, y + 1], [x - 2, y + 1],
      [x + 2, y - 1], [x - 2, y - 1],
      [x + 1, y + 2], [x - 1, y + 2],
      [x + 1, y - 2], [x - 1, y - 2]
    ]
    valid_moves = moves.select { |move| move[0].between?(0, 7) &&
                                        move[1].between?(0, 7) }
  end

  def children_moves(node)
    possible_moves(node).each do |move|
      node.children << Node.new(move, node)
    end
  end
end

class Node
  attr_accessor :position, :parent, :children

  def initialize(position, parent = nil)
    @position = position
    @parent = parent
    @children = []
  end
end


knight = Knight.new
knight.knight_moves([0,0], [3,3])
# knight.knight_moves([3,3],[4,3])

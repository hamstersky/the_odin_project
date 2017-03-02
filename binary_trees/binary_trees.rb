class Node
  attr_accessor :value, :parent, :left, :right

  def initialize(value)
    @value = value
    @parent = nil
    @left = nil
    @right = nil
  end
end

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def build_tree(array)
    @root = Node.new(array.first)
    array.shift
    array.each do |element|
      new_node = Node.new(element)
      current_node = @root
      loop do
        if new_node.value < current_node.value
          if current_node.left == nil
            current_node.left = new_node
            new_node.parent = current_node
            break
          else
            current_node = current_node.left
          end
        elsif new_node.value >= current_node.value
          if current_node.right == nil
            current_node.right = new_node
            new_node.parent = current_node
            break
          else
            current_node = current_node.right
          end
        end
      end # end of loop
    end
  end

  def bfs(data)
    queue = [@root]
    current_node = queue.first
    until current_node == nil || current_node.value == data
      queue.shift
      queue << current_node.left if !current_node.left.nil?
      queue << current_node.right if !current_node.right.nil?
      current_node = queue.first
    end
    current_node == nil ? nil : current_node
  end

  def dfs(data)
    stack = [@root]
    until stack.empty?
      current_node = stack.pop
      return current_node if current_node.value == data
      stack << current_node.right unless current_node.right.nil?
      stack << current_node.left unless current_node.left.nil?
    end
    nil
  end

  def dfs_rec(data, root = @root)
    return if root == nil
    return root if root.value == data
    dfs(data, root.left)
    dfs(data, root.right)
  end
end

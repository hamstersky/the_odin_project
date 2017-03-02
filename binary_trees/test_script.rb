require_relative 'binary_trees'

bst = BinarySearchTree.new
bst.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
# puts bst.root.value
# puts bst.root.right.value
# puts bst.root.right.right.value
# puts bst.root.right.left.value

puts bst.bfs(11)
puts bst.dfs(11)

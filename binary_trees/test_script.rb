require_relative 'binary_trees'

bst = BinarySearchTree.new
bst.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

puts bst.bfs(23)
puts bst.dfs(23)
puts bst.dfs_rec(23)
p bst.bfs(11)
p bst.dfs(11)
p bst.dfs_rec(11)

require_relative 'balanced_BST.rb'

#array = Array.new(15) { rand(1..100) }
array = [7,4,6,2,1,5]
#array = []
binary_tree = Tree.new(array)

binary_tree.pretty_print
#binary_tree.insert(3)
#binary_tree.pretty_print
#binary_tree.delete(6)
#binary_tree.pretty_print
#p binary_tree.find(4)
binary_tree.level_order
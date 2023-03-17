require_relative 'balanced_BST.rb'

array = (Array.new(15) { rand(1..100) })
#array = [2,5,1,7,9,4,8,6,3]
binary_tree = Tree.new(array)
#binary_tree.pretty_print

puts binary_tree.balanced?
p binary_tree.level_order
#binary_tree.level_order { |node| print "#{node.data} " }; print "\n"
p binary_tree.preorder
#binary_tree.preorder{ |node| print "#{node.data} " }; print "\n"
p binary_tree.postorder
#binary_tree.postorder{ |node| print "#{node.data} " }; print "\n"
p binary_tree.inorder
#binary_tree.inorder{ |node| print "#{node.data} " }; print "\n"
#binary_tree.pretty_print
binary_tree.insert(150)
binary_tree.insert(210)
binary_tree.insert(122)
puts binary_tree.balanced?
#binary_tree.pretty_print
binary_tree.rebalance
#binary_tree.pretty_print
puts binary_tree.balanced?
p binary_tree.level_order
#binary_tree.level_order { |node| print "#{node.data} " }; print "\n"
p binary_tree.preorder
#binary_tree.preorder{ |node| print "#{node.data} " }; print "\n"
p binary_tree.postorder
#binary_tree.postorder{ |node| print "#{node.data} " }; print "\n"
p binary_tree.inorder
#binary_tree.inorder{ |node| print "#{node.data} " }; print "\n"


#
#puts binary_tree.balanced?
#binary_tree.pretty_print

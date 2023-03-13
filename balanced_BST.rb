class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

class Tree
  attr_reader :root

  def initialize(array)
    @root = build_tree(array)
  end

  def build_tree(array, array_start = 0, array_end = array.length - 1)
    array = array.sort.uniq
    
    return nil if array_start > array_end
    array_middle = (array_start + array_end) / 2
    root_node = Node.new(array[array_middle])

    root_node.left = build_tree(array, array_start, array_middle - 1)
    root_node.right = build_tree(array, array_middle + 1, array_end)
    
    return root_node
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end


end
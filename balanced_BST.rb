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
    root = Node.new(array[array_middle])

    root.left = build_tree(array, array_start, array_middle - 1)
    root.right = build_tree(array, array_middle + 1, array_end)
    
    return root
  end


  
  def insert(value, node = @root)
    if @root == nil
      return @root = Node.new(value)
    end
    if node == nil
      return Node.new(value)
    end

    if value < node.data
      node.left = insert(value, node.left)
    else
      node.right = insert(value, node.right)
    end
    return node
  end

  def delete(value, node = @root)
    return @root if @root == nil
    
    if value < node.data
      node.left = delete(value, node.left)
    elsif value > node.data
      node.right = delete(value, node.right)
    else
      if node.left == nil
        return node.right
      elsif node.right == nil
        return node.left
      end
    
      node.data = min_value(node.right)
      node.right = delete(node.data, node.right)
    end
    return node
  end

  def min_value(node)
    min_val = node.data
    while node.left != nil
      min_val = node.left.data
      node = node.left
    end
    return min_val
  end

  def find(value, node = @root)
    return nil if @root == nil
    return node if node.data == value
    
    return find(value, node.right) if node.data < value
    return find(value, node.left) if node.data > value
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end


end
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
    array = array.sort

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
    if node == nil
      return "That node does not exist"
    elsif node.data > value
      return find(value, node.left)
    elsif node.data < value
      return find(value, node.right)
    else
      return node
    end
  end

  def level_order(node = @root, &block)
    return if node == nil
    queue = []
    result = []
    queue.push(node)
    while(!queue.empty?)
      node = queue.shift
      queue.push(node.left) if (node.left != nil)
      queue.push(node.right) if (node.right != nil)
        
      if block_given?
        block.call(node)
      else
        result.push(node.data)
      end
    end
    return result if !block_given?
  end

  def inorder(node = @root, result = [], &block)
    return if node == nil
    
    if block_given?
      inorder(node.left, &block) if node.left
      block.call(node)
      inorder(node.right, &block) if node.right
    else
      inorder(node.left, result) if node.left
      result.push(node.data)
      inorder(node.right, result) if node.right
      return result if !block_given?
    end
  end

  def preorder(node = @root, result = [], &block)
    return if node == nil
    
    if block_given?
      block.call(node)
      preorder(node.left, &block) if node.left
      preorder(node.right, &block) if node.right
    else
      result.push(node.data)
      preorder(node.left, result) if node.left
      preorder(node.right, result) if node.right
      return result if !block_given?
    end
  end

  def postorder(node = @root, result = [], &block)
    return if node == nil
    
    if block_given?
      postorder(node.left, &block) if node.left
      postorder(node.right, &block) if node.right
      block.call(node)
    else
      postorder(node.left, result) if node.left
      postorder(node.right, result) if node.right
      result.push(node.data)
      return result if !block_given?
    end
  end

  def height(node = @root)
    return -1 if node.nil?
    
    node = find(node) if node.is_a?(Integer)
    left_height = height(node.left)
    right_height = height(node.right)

    if left_height > right_height
      return left_height + 1
    elsif right_height > left_height
      return right_height + 1
    end
  end

  def depth(value, count = 0, node = @root)
    if node == nil
      return "That node does not exist"
    elsif node.data > value
      return depth(value, count + 1, node.left)
    elsif node.data < value
      return depth(value, count + 1, node.right)
    else
      puts count
    end
  end

  

  def balanced?(node = @root)
    if node.nil?
      return -1
    end

    left_tree = balanced?(node.left)
    return left_tree if left_tree == false

    right_tree = balanced?(node.right)
    return right_tree if right_tree == false

    balance = (left_tree - right_tree).abs

    return false if balance > 1
    return true if node == @root
    balance
  end

  def rebalance
    new_array = self.inorder
    @root = build_tree(new_array)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    return if node == nil
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

end
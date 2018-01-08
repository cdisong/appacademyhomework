# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.
require_relative "bst_node"

class BinarySearchTree
  attr_reader :root
  def initialize
    @root = nil 
  end

  def insert(value)
    @root = add_n(@root, value, nil)
  end

  def find(value, tree_node = @root)
    if !tree_node 
      return nil
    end 
    if value == tree_node.value 
      return tree_node 
    end 
    if value < tree_node.value
      find(value, tree_node.left) 
    else 
      find(value, tree_node.right)
    end 
  end

  def delete(value)
    node = find(value)
    return nil unless node
    if !node.left && !node.right
      remove_node(node, nil)
    elsif !node.right
      remove_node(node, node.left)
    elsif !node.left
      remove_node(node, node.right)
    else
      greatest_left = maximum(node.left)
      greatest_left.parent.right = greatest_left.left if greatest_left.left
      remove_node(node, greatest_left)
    end
  end
  
  # helper method for #delete:
  def maximum(tree_node = @root)
    if !tree_node
      return nil 
    end 
    if !tree_node.right 
      return tree_node 
    end 
    maximum(tree_node.right)
  end
  
  def depth(tree_node = @root)
    if !tree_node
      return 0 
    end 
    if tree_node.left || tree_node.right
      return 1 + [depth(tree_node.left), depth(tree_node.right)].max
    else
      return 0
    end
  end 
  
  def is_balanced?(tree_node = @root)
    return true unless tree_node
    if depth(tree_node.left) == depth(tree_node.right) && is_balanced?(tree_node.left) && is_balanced?(tree_node.right)
      return true
    end
    false
  end
  
  def in_order_traversal(tree_node = @root, arr = [])
    traversed_n = []
    current = tree_node
    dup_arr = arr
    while true
      if current
        traversed_n << current
        current = current.left
      else
        return dup_arr if traversed_n.empty?
        node = traversed_n.pop
        dup_arr << node.value
        current = node.right
      end
    end
  end

  def self.size(tree_node = @root)
    return 0 if tree_node.nil?
    1 + size(tree_node.left) + size(tree_node.right)
  end
  
  private
  # optional helper methods go here:
  def add_n(node, val, parent_node)
    if !node
      node = BSTNode.new(val, parent_node)
    elsif val < node.value
      node.left = add_n(node.left, val, node)
    else
      node.right = add_n(node.right, val, node)
    end
    node
  end

  def remove_node(node, next_node)
    if node.parent
      if node.value < node.parent.value
        node.parent.left = next_node
      else
        node.parent.right = next_node
      end
      next_node.parent = node.parent if next_node
      node.parent = nil
    else
      @root = next_node
    end

    if next_node
      next_node.left = node.left
      next_node.right = node.right
    end
  end
end


class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # prev_node = self.prev 
    # next_node = self.next 
    # prev_node.next = next_node
    # next_node.prev = prev_node
    self.next.prev = self.prev
    self.prev.next = self.next
    self.next, self.prev = nil, nil
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  attr_reader :head, :tail
  
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    current_node = @head 
    until current_node.key == key || current_node == @tail 
      current_node = current_node.next
    end
    current_node.val
  end
  
  def get_node(key)
    current_node = @head 
    until current_node.key == key || current_node == @tail 
      current_node = current_node.next
    end
    return nil if current_node == @tail
    current_node
  end

  def include?(key)
    current_node = @head 
    until current_node == @tail 
      return true if current_node.key == key
      current_node = current_node.next
    end 
    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    # new_node.next = @tail 
    # new_node.prev = @tail.prev.next
    # @tail.prev.next = new_node 
    # @tail.prev = new_node 
    new_node.next = @tail 
    new_node.prev = @tail.prev 
    @tail.prev.next = new_node
    @tail.prev = new_node
  end

  def update(key, val)
    node_update = get_node(key)
    return nil unless !!node_update
    node_update.val = val
  end

  def remove(key)
    node_remove = get_node(key)
    # node_remove.prev.next = node_remove.next
    # node_remove.next.prev = node_remove.prev 
    node_remove.remove
    # nil
    node_remove
  end

  def each(&prc)
    current_node = @head.next
    until current_node == @tail 
      prc.call(current_node)
      current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end

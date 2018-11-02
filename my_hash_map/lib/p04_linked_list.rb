require 'byebug'
class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

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
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end

  def inspect
    "Key: #{self.key} Val: #{self.val} Prev: #{self.prev} Next: #{self.next}"
  end
end

class LinkedList

  include Enumerable

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
    return true if @head.next == @tail
    false
  end

  def get(key)
    self.each do |node|
      return node.val if node.key == key
    end
    nil
  end

  def include?(key)
    # debugger
    self.each do |node|
      return true if node.key == key
    end
    false
  end

  def append(key, val)
    # debugger
    temp = Node.new(key, val)
    temp.next = @tail
    temp.prev = @tail.prev
    @tail.prev.next = temp
    @tail.prev = temp
  end

  def update(key, val)
    self.each do |node|
      node.val = val if node.key == key
    end 
  end

  def remove(key)
    temp = nil
    self.each do |node|
      temp = node if node.key == key
    end
    temp.prev.next = temp.next
    temp.next.prev = temp.prev

  end

  def each(&prc)
    # debugger
    result = []
    next_node = @head.next
    until next_node == @tail
      # result << next_node.val
      result << prc.call(next_node)
      next_node = next_node.next
    end
    result
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end

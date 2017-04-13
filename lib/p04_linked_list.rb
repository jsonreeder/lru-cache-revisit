class Link
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
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Link.new
    @tail = Link.new
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
    while current_node.next
      return current_node.val if current_node.key == key
      current_node = current_node.next
    end
  end

  def include?(key)
    current_node = @head
    while current_node.next
      return true if current_node.key == key
      current_node = current_node.next
    end
    false
  end

  def append(key, val)
    new_node = Link.new(key, val)
    penultimate = @tail.prev
    penultimate.next = new_node
    new_node.prev = penultimate
    new_node.next = @tail
    @tail.prev = new_node
  end

  def update(key, val)
    current_node = @head
    while current_node.next
      if current_node.key == key
        current_node.val = val
        break
      end
      current_node = current_node.next
    end
  end

  def remove(key)
    current_node = @head
    while current_node.next
      if current_node.key == key
        n_prev = current_node.prev
        n_next = current_node.next
        n_prev.next = n_next
        n_next.prev = n_prev
        break
      end
      current_node = current_node.next
    end
  end

  def each
    current_node = @head.next
    while current_node.next
      yield current_node
      current_node = current_node.next
    end
  end

  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end

require_relative 'node'

class List
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(node)
    if @head.nil?
      @head = node
    elsif @tail.nil?
      @head.next = node
      @tail = node
    else
      @tail.next = Node
      @tail = Node
    end
  end

  def prepend(node)
    if @head.nil?
      @head = node
    else
      node.next = @head
      @tail = @head
      @head = node
    end
  end

  def size
    count = 0
    header = @head
    until header.nil?
      count += 1
      header = header.next
    end
    count
  end

  def at_index(index)
    point = 0
    node = @head
    until point == index
      point += 1
      node = node.next
      return nil if node.nil?
    end
    node
  end

  def pop
    original_tail = @tail
    @tail = at_index(size - 2)
    @tail.next = nil
    original_tail
  end

  def contains?(value)
    node = @head
    size.times do
      return true if node.value == value

      node = node.next
    end
    false
  end

  def find(value)
    node = @head
    size.times do |index|
      return index if node.value == value

      node = node.next
    end
    nil
  end

  def insert_at(node, index)
    if index <= 0
      prepend node
      return node
    end
    index = size - 1 if index > size - 1
    node_before_index = at_index(index - 1)
    tail_node = node_before_index.next
    node.next = tail_node
    node_before_index.next = node
    node
  end

  def remove_at(index)
    if index <= 0
      node = @head
      @head = @head.next
      node.next = nil
      nil
    elsif index >= size - 1
      pop
    else
      node_before = at_index(index - 1)
      node = node_before.next
      node_after = node.next

      node_before.next = node_after
      node.next = nil
      node
    end
  end

  def to_s
    string = ''
    header = @head
    until header.nil?
      string += "(#{header.value}) -> "
      header = header.next
    end
    string + 'nil'
  end
end

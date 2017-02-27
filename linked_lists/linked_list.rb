class LinkedList

  def initialize
    @head = nil
    @tail = nil
  end

  def append(node)
    if @head == nil
      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
  end

  def prepend(node)
    if @head == nil
      @head = node
      @tail = node
    else
      node.next_node = @head
      @head = node
    end
  end

  def size
    return 0 if @head == nil
    return 1 if @head.next_node == nil
    i = 0
    current_node = @head
    until current_node == nil do
      i += 1
      current_node = current_node.next_node
    end
    return i
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    return @head if index == 0
    i = 0
    current_node = @head
    until i == index
      current_node = current_node.next_node
      i += 1
    end
    current_node
  end

  def pop
    if size == 0
      'The list is empty already!'
    elsif size == 1
      @head, @tail = nil, nil
    else
      current_node = @head
      until current_node.next_node == @tail
        current_node = current_node.next_node
      end
      current_node.next_node = nil
      @tail = current_node
    end
  end

  def contains?(input_value)
    return false if @head == nil
    current_node = @head
    until current_node == nil || current_node.value == input_value
      current_node = current_node.next_node
    end
    current_node == nil ? false : true
  end

  def find(data)
    return nil if @head == nil
    current_node = @head
    index = 0
    until current_node == nil || current_node.value == data
      current_node = current_node.next_node
      index += 1
    end
    current_node == nil ? nil : index
  end

  def to_s
    string = ''
    current_node = @head
    until current_node == nil
      string = "#{string}( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    string + 'nil'
  end

  def insert_at(index, node)
    if index == 0
      prepend(node)
    elsif index == size
      append(node)
    else
      current_node = @head
      i = 0
      until i == index - 1
        current_node = current_node.next_node
        i += 1
      end
      node.next_node = current_node.next_node
      current_node.next_node = node
    end
  end

  def remove_at(index)
      if index == 0
        current_node = @head
        @head = current_node.next_node
      elsif size == 1
        @head = nil
        @tail = nil
      elsif index == size - 1
        pop
      else
        current_node = @head
        i = 0
        until i == index - 1
          current_node = current_node.next_node
          i += 1
        end
        current_node.next_node = current_node.next_node.next_node
      end
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end

node1 = Node.new(1)
node2 = Node.new(2)
node3 = Node.new(3)
node4 = Node.new(4)
list = LinkedList.new
puts list.to_s # => nil
list.append(node1)
puts list.to_s # => ( 1 ) -> nil
list.prepend(node2)
puts list.to_s # => ( 2 ) -> ( 1 ) -> nil
list.append(node3)
puts list.to_s # => ( 2 ) -> ( 1 ) -> ( 3 ) -> nil
puts list.size # => 3
puts "#{list.head}, value: #{list.head.value}"
puts "#{list.tail}, value: #{list.tail.value}"
puts "#{list.at(1)}, value: #{list.at(1).value}"
puts list.to_s # => ( 2 ) -> ( 1 ) -> ( 3 ) -> nil
list.pop
puts list.to_s # => ( 2 ) -> ( 1 ) -> nil
list.append(node3)
puts list.contains?(2) # => true
puts list.contains?(4) # => false
p list.find(2) # => 0
p list.find(4) # => nil
puts list.to_s # => ( 2 ) -> ( 1 ) -> ( 3 ) -> nil
list.insert_at(2, node4)
puts list.to_s # => ( 2 ) -> ( 1 ) -> ( 4 ) -> ( 3 ) -> nil
list.remove_at(1)
puts list.to_s # => ( 2 ) -> ( 4 ) -> ( 3 ) -> nil

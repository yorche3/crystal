module DataStructuresBasics
  VERSION = "0.1.0"

  FAILURE_VALUE = -1

  class Node
    @value : Int32
    @next : Node?

    def initialize(@value : Int32)
      @next = nil
    end

    def get_value : Int32
      @value
    end

    def get_next : Node?
      @next
    end

    def set_next(next_node : Node?)
      @next = next_node
    end
  end

  class LinkedList
    @head : Node?
    @tail : Node?
    @count : Int32

    def initialize
      @head = nil
      @tail = nil
      @count = 0
    end

    def is_empty : Bool
      @count == 0
    end

    def size : Int32
      @count
    end

    def get_head : Int32
      return FAILURE_VALUE if is_empty
      @head.not_nil!.get_value
    end

    def insert_head(value : Int32)
      new_node = Node.new(value)
      if is_empty
        @head = new_node
        @tail = new_node
      else
        new_node.set_next(@head)
        @head = new_node
      end
      @count += 1
    end

    def insert_tail(value : Int32)
      new_node = Node.new(value)
      if is_empty
        @head = new_node
        @tail = new_node
      else
        @tail.not_nil!.set_next(new_node)
        @tail = new_node
      end
      @count += 1
    end

    def delete(value : Int32) : Bool
      previous : Node? = nil
      current : Node? = @head
      while current
        if current.get_value == value
          if previous
            previous.set_next(current.get_next)
          else
            @head = current.get_next
          end
          if current == @tail
            @tail = previous
          end
          @count -= 1
          return true
        end
        previous = current
        current = current.get_next
      end
      false
    end
  end

  class Stack
    @top : Node?
    @count : Int32

    def initialize
      @top = nil
      @count = 0
    end

    def is_empty : Bool
      @count == 0
    end

    def size : Int32
      @count
    end

    def push(value : Int32)
      new_node = Node.new(value)
      new_node.set_next(@top)
      @top = new_node
      @count += 1
    end

    def peek : Int32
      if is_empty
        FAILURE_VALUE
      else
        @top.not_nil!.get_value
      end
    end

    def pop : Int32
      if is_empty
        FAILURE_VALUE
      else
        value = @top.not_nil!.get_value
        @top = @top.not_nil!.get_next
        @count -= 1
        value
      end
    end
  end

  class Queue
    @front : Node?
    @rear : Node?
    @count : Int32

    def initialize
      @front = nil
      @rear = nil
      @count = 0
    end

    def is_empty : Bool
      @count == 0
    end

    def size : Int32
      @count
    end

    def enqueue(value : Int32)
      new_node = Node.new(value)
      if is_empty
        @front = new_node
        @rear = new_node
      else
        @rear.not_nil!.set_next(new_node)
        @rear = new_node
      end
      @count += 1
    end

    def peek : Int32
      if is_empty
        FAILURE_VALUE
      else
        @front.not_nil!.get_value
      end
    end

    def dequeue : Int32
      if is_empty
        FAILURE_VALUE
      else
        value = @front.not_nil!.get_value
        @front = @front.not_nil!.get_next
        @count -= 1
        if is_empty
          @rear = nil
        end
        value
      end
    end
  end
end

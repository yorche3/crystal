module DataStructuresBasics
  VERSION = "0.1.0"

  class Node
    @value : Int32
    @next : Node?

    def initialize
      @value = uninitialized Int32
      @next = nil
    end

    def init(value : Int32) : Nil
      nil
    end

    def get_value : Int32
      uninitialized Int32
    end

    def get_next : Node?
      nil
    end

    def set_next(next_node : Node?) : Nil
      nil
    end
  end

  class LinkedList
    @head : Node?
    @tail : Node?
    @count : Int32

    def initialize
      @head = nil
      @tail = nil
      @count = uninitialized Int32
    end

    def init : Nil
      nil
    end

    def get_head : Int32?
      nil
    end

    def insert_head(value : Int32) : Nil
      nil
    end

    def insert_tail(value : Int32) : Nil
      nil
    end

    def delete(value : Int32) : Bool?
      nil
    end

    def is_empty : Bool
      false
    end

    def size : Int32
      uninitialized Int32
    end
  end

  class Stack
    @top : Node?
    @count : Int32

    def initialize
      @top = nil
      @count = uninitialized Int32
    end

    def init : Nil
      nil
    end

    def push(value : Int32) : Nil
      nil
    end

    def pop : Int32?
      nil
    end

    def peek : Int32?
      nil
    end

    def is_empty : Bool
      false
    end

    def size : Int32
      uninitialized Int32
    end
  end

  class Queue
    @front : Node?
    @rear : Node?
    @count : Int32

    def initialize
      @front = nil
      @rear = nil
      @count = uninitialized Int32
    end

    def init : Nil
      nil
    end

    def enqueue(value : Int32) : Nil
      nil
    end

    def dequeue : Int32?
      nil
    end

    def peek : Int32?
      nil
    end

    def is_empty : Bool
      false
    end

    def size : Int32
      uninitialized Int32
    end
  end
end

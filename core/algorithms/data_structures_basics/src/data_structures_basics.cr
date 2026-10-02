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
      FAILURE_VALUE
    end

    def get_next : Node?
      nil
    end

    def set_next(next_node : Node?)
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

    def get_head : Int32
      FAILURE_VALUE
    end

    def insert_head(value : Int32)
    end

    def insert_tail(value : Int32)
    end

    def delete(value : Int32) : Bool
      false
    end

    def is_empty : Bool
      false
    end

    def size : Int32
      @count
    end
  end

  class Stack
    @top : Node?
    @count : Int32

    def initialize
      @top = nil
      @count = 0
    end

    def push(value : Int32)
      nil
    end

    def pop : Int32
      FAILURE_VALUE
    end

    def peek : Int32
      FAILURE_VALUE
    end

    def is_empty : Bool
      false
    end

    def size : Int32
      @count
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

    def enqueue(value : Int32)
    end

    def dequeue : Int32
      FAILURE_VALUE
    end

    def peek : Int32
      FAILURE_VALUE
    end

    def is_empty : Bool
      false
    end

    def size : Int32
      @count
    end
  end
end

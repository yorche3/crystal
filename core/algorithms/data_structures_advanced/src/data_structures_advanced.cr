# Contrato del modulo: arbol binario de busqueda y grafo dirigido.
module DataStructuresAdvanced
  VERSION = "0.1.0"

  # Base del modulo: solo el valor, sin enlaces ni instancias propias.
  abstract class Node
    @value : Int32

    def initialize(@value : Int32)
    end

    def get_value : Int32
      @value
    end
  end

  class TreeNode < Node
    @left : TreeNode?
    @right : TreeNode?

    def initialize(value : Int32)
      super(value)
      @left = nil
      @right = nil
    end

    def get_left : TreeNode?
      @left
    end

    def get_right : TreeNode?
      @right
    end

    def set_left(node : TreeNode?) : Nil
      @left = node
    end

    def set_right(node : TreeNode?) : Nil
      @right = node
    end
  end

  class BinaryTree
    @root : TreeNode?
    @count : Int32

    def initialize
      @root = nil
      @count = 0
    end

    def insert(value : Int32) : Bool
      if @root.nil?
        @root = TreeNode.new(value)
        @count += 1
        return true
      end
      current = @root.not_nil!
      loop do
        current_value = current.get_value
        if value < current_value
          child = current.get_left
          if child.nil?
            current.set_left(TreeNode.new(value))
            @count += 1
            return true
          end
          current = child
        elsif value > current_value
          child = current.get_right
          if child.nil?
            current.set_right(TreeNode.new(value))
            @count += 1
            return true
          end
          current = child
        else
          return true
        end
      end
    end

    def contains(value : Int32) : Bool
      current = @root
      while current
        if value == current.get_value
          return true
        elsif value < current.get_value
          current = current.get_left
        else
          current = current.get_right
        end
      end
      false
    end

    def is_empty : Bool
      @count == 0
    end

    def size : Int32
      @count
    end
  end

  # Internos del modulo: Graph recorre el registro y la adyacencia.
  class GraphNode < Node
    getter neighbors : Array(Int32)
    property next_vertex : GraphNode?

    def initialize(label : Int32)
      super(label)
      @neighbors = [] of Int32
      @next_vertex = nil
    end
  end

  class Graph
    @vertices : GraphNode?
    @vertex_total : Int32
    @edges : Int32

    def initialize
      @vertices = nil
      @vertex_total = 0
      @edges = 0
    end

    private def find_vertex(label : Int32) : GraphNode?
      current = @vertices
      while current
        return current if current.get_value == label
        current = current.next_vertex
      end
      nil
    end

    def add_vertex(label : Int32) : Bool
      return true unless find_vertex(label).nil?

      new_vertex = GraphNode.new(label)
      new_vertex.next_vertex = @vertices
      @vertices = new_vertex
      @vertex_total += 1
      true
    end

    def add_edge(u : Int32, v : Int32) : Bool
      u_vertex = find_vertex(u)
      v_vertex = find_vertex(v)
      return false unless u_vertex && v_vertex

      neighbors = u_vertex.neighbors
      position = 0
      while position < neighbors.size && neighbors[position] < v
        position += 1
      end
      if position < neighbors.size && neighbors[position] == v
        return true
      end
      neighbors.insert(position, v)
      @edges += 1
      true
    end

    def has_edge(u : Int32, v : Int32) : Bool
      u_vertex = find_vertex(u)
      return false unless u_vertex
      u_vertex.neighbors.includes?(v)
    end

    def get_neighbors(u : Int32) : Array(Int32)?
      u_vertex = find_vertex(u)
      return nil unless u_vertex
      u_vertex.neighbors.dup
    end

    def is_empty : Bool
      @vertex_total == 0
    end

    def vertex_count : Int32
      @vertex_total
    end

    def edge_count : Int32
      @edges
    end
  end
end

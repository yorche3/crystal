# Contrato del modulo: arbol binario de busqueda y grafo dirigido.
module DataStructuresAdvanced
  VERSION = "0.1.0"

  # Base del modulo: solo el valor, sin enlaces ni instancias propias.
  abstract class Node
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
      nil
    end

    def get_right : TreeNode?
      nil
    end

    def set_left(node : TreeNode?) : Nil
      nil
    end

    def set_right(node : TreeNode?) : Nil
      nil
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
      false
    end

    def contains(value : Int32) : Bool
      false
    end

    def is_empty : Bool
      false
    end

    def size : Int32
      0
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

    def add_vertex(label : Int32) : Bool
      false
    end

    def add_edge(u : Int32, v : Int32) : Bool
      false
    end

    def has_edge(u : Int32, v : Int32) : Bool
      false
    end

    def get_neighbors(u : Int32) : Array(Int32)?
      nil
    end

    def is_empty : Bool
      false
    end

    def vertex_count : Int32
      0
    end

    def edge_count : Int32
      0
    end
  end
end

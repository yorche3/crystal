require "./spec_helper"

private def assert_expected(case_name : String, actual : A, expected : E) forall A, E
  fail "#{case_name} should be #{expected.inspect} but was #{actual.inspect}" unless actual == expected
end

private def build_tree(values : Array(Int32)) : DataStructuresAdvanced::BinaryTree
  tree = DataStructuresAdvanced::BinaryTree.new
  values.each { |value| tree.insert(value) }
  tree
end

private def build_graph(labels : Array(Int32)) : DataStructuresAdvanced::Graph
  graph = DataStructuresAdvanced::Graph.new
  labels.each { |label| graph.add_vertex(label) }
  graph
end

private def tree_cases(case_name : String, values : Array(Int32), absent_input : Int32, size_output : Int32)
  tree = DataStructuresAdvanced::BinaryTree.new
  values.each_with_index do |value, index|
    assert_expected("#{case_name} insert #{index + 1} (#{value})", tree.insert(value), true)
  end
  assert_expected("#{case_name} size", tree.size, size_output)
  assert_expected("#{case_name} is_empty", tree.is_empty, false)
  values.uniq.each do |value|
    assert_expected("#{case_name} contains #{value}", tree.contains(value), true)
  end
  assert_expected("#{case_name} contains #{absent_input}", tree.contains(absent_input), false)
end

describe DataStructuresAdvanced do
  describe "TreeNode" do
    it "create a tree node" do
      node = DataStructuresAdvanced::TreeNode.new(10)
      assert_expected("create a tree node value", node.get_value, 10)
    end

    it "absent initial links" do
      node = DataStructuresAdvanced::TreeNode.new(10)
      assert_expected("absent initial links left", node.get_left, nil)
      assert_expected("absent initial links right", node.get_right, nil)
    end

    it "link two children" do
      parent = DataStructuresAdvanced::TreeNode.new(10)
      parent.set_left(DataStructuresAdvanced::TreeNode.new(20))
      parent.set_right(DataStructuresAdvanced::TreeNode.new(30))
      assert_expected("link two children left value", parent.get_left.try(&.get_value), 20)
      assert_expected("link two children right value", parent.get_right.try(&.get_value), 30)
    end

    it "traverse each link" do
      parent = DataStructuresAdvanced::TreeNode.new(10)
      parent.set_left(DataStructuresAdvanced::TreeNode.new(20))
      parent.set_right(DataStructuresAdvanced::TreeNode.new(30))
      left = parent.get_left
      right = parent.get_right
      assert_expected("traverse each link left value", left.try(&.get_value), 20)
      assert_expected("traverse each link right value", right.try(&.get_value), 30)
      assert_expected("traverse each link left.left", left.try(&.get_left), nil)
      assert_expected("traverse each link left.right", left.try(&.get_right), nil)
      assert_expected("traverse each link right.left", right.try(&.get_left), nil)
      assert_expected("traverse each link right.right", right.try(&.get_right), nil)
    end

    it "unlink children" do
      parent = DataStructuresAdvanced::TreeNode.new(10)
      parent.set_left(DataStructuresAdvanced::TreeNode.new(20))
      parent.set_right(DataStructuresAdvanced::TreeNode.new(30))
      parent.set_left(nil)
      assert_expected("unlink children step 1 left", parent.get_left, nil)
      assert_expected("unlink children step 1 right", parent.get_right.try(&.get_value), 30)
      assert_expected("unlink children step 1 value", parent.get_value, 10)
      parent.set_right(nil)
      assert_expected("unlink children step 2 left", parent.get_left, nil)
      assert_expected("unlink children step 2 right", parent.get_right, nil)
      assert_expected("unlink children step 2 value", parent.get_value, 10)
    end
  end

  describe "BinaryTree" do
    it "create empty" do
      tree = DataStructuresAdvanced::BinaryTree.new
      assert_expected("create empty is_empty", tree.is_empty, true)
      assert_expected("create empty size", tree.size, 0)
      assert_expected("create empty contains 50", tree.contains(50), false)
    end

    it "insert the root" do
      tree_cases("insert the root", [50], 99, 1)
    end

    it "insert lower and higher" do
      tree_cases("insert lower and higher", [50, 30, 70], 99, 3)
    end

    it "multilevel branches" do
      tree_cases("multilevel branches", [50, 30, 70, 20, 40], 99, 5)
    end

    it "missing value in nonempty tree" do
      tree = build_tree([50])
      assert_expected("missing value contains 99", tree.contains(99), false)
      assert_expected("missing value size", tree.size, 1)
      assert_expected("missing value contains 50", tree.contains(50), true)
    end

    it "idempotent duplicate" do
      tree_cases("idempotent duplicate", [50, 30, 70, 30], 99, 3)
    end

    it "ordered insertions" do
      tree_cases("ordered insertions", [20, 30, 40, 50, 70], 99, 5)
    end
  end

  describe "Graph" do
    it "create empty" do
      graph = DataStructuresAdvanced::Graph.new
      assert_expected("create empty is_empty", graph.is_empty, true)
      assert_expected("create empty vertex_count", graph.vertex_count, 0)
      assert_expected("create empty edge_count", graph.edge_count, 0)
      assert_expected("create empty has_edge(10,30)", graph.has_edge(10, 30), false)
      assert_expected("create empty get_neighbors(10)", graph.get_neighbors(10), nil)
    end

    it "isolated vertex" do
      graph = DataStructuresAdvanced::Graph.new
      assert_expected("isolated vertex add_vertex(10)", graph.add_vertex(10), true)
      assert_expected("isolated vertex is_empty", graph.is_empty, false)
      assert_expected("isolated vertex vertex_count", graph.vertex_count, 1)
      assert_expected("isolated vertex edge_count", graph.edge_count, 0)
      assert_expected("isolated vertex neighbors of 10", graph.get_neighbors(10), [] of Int32)
    end

    it "nonconsecutive labels and directed edge" do
      graph = build_graph([10, 70])
      assert_expected("directed edge add_edge(10,70)", graph.add_edge(10, 70), true)
      assert_expected("directed edge has_edge(10,70)", graph.has_edge(10, 70), true)
      assert_expected("directed edge has_edge(70,10)", graph.has_edge(70, 10), false)
      assert_expected("directed edge vertex_count", graph.vertex_count, 2)
      assert_expected("directed edge edge_count", graph.edge_count, 1)
    end

    it "duplicate vertex preserves adjacency" do
      graph = DataStructuresAdvanced::Graph.new
      assert_expected("duplicate vertex add_vertex(10)", graph.add_vertex(10), true)
      assert_expected("duplicate vertex add_vertex(30)", graph.add_vertex(30), true)
      assert_expected("duplicate vertex add_edge(10,30)", graph.add_edge(10, 30), true)
      assert_expected("duplicate vertex add_vertex(10) again", graph.add_vertex(10), true)
      assert_expected("duplicate vertex vertex_count", graph.vertex_count, 2)
      assert_expected("duplicate vertex edge_count", graph.edge_count, 1)
      assert_expected("duplicate vertex neighbors of 10", graph.get_neighbors(10), [30])
    end

    it "duplicate edge" do
      graph = build_graph([10, 30])
      assert_expected("duplicate edge first add_edge(10,30)", graph.add_edge(10, 30), true)
      assert_expected("duplicate edge second add_edge(10,30)", graph.add_edge(10, 30), true)
      assert_expected("duplicate edge vertex_count", graph.vertex_count, 2)
      assert_expected("duplicate edge edge_count", graph.edge_count, 1)
      assert_expected("duplicate edge neighbors of 10", graph.get_neighbors(10), [30])
    end

    it "missing endpoint without mutation" do
      graph = build_graph([10, 30])
      graph.add_edge(10, 30)
      assert_expected("missing endpoint add_edge(10,99)", graph.add_edge(10, 99), false)
      assert_expected("missing endpoint add_edge(99,10)", graph.add_edge(99, 10), false)
      assert_expected("missing endpoint add_edge(98,99)", graph.add_edge(98, 99), false)
      assert_expected("missing endpoint add_edge(99,99)", graph.add_edge(99, 99), false)
      assert_expected("missing endpoint vertex_count", graph.vertex_count, 2)
      assert_expected("missing endpoint edge_count", graph.edge_count, 1)
      assert_expected("missing endpoint neighbors of 10", graph.get_neighbors(10), [30])
      assert_expected("missing endpoint neighbors of 30", graph.get_neighbors(30), [] of Int32)
      assert_expected("missing endpoint has_edge(10,99)", graph.has_edge(10, 99), false)
      assert_expected("missing endpoint has_edge(99,10)", graph.has_edge(99, 10), false)
      assert_expected("missing endpoint has_edge(98,99)", graph.has_edge(98, 99), false)
      assert_expected("missing endpoint has_edge(99,99)", graph.has_edge(99, 99), false)
      assert_expected("missing endpoint neighbors of 98", graph.get_neighbors(98), nil)
      assert_expected("missing endpoint neighbors of 99", graph.get_neighbors(99), nil)
    end

    it "sorted neighbours and counts" do
      graph = build_graph([10, 30, 50, 70])
      assert_expected("sorted neighbours add_edge(10,70)", graph.add_edge(10, 70), true)
      assert_expected("sorted neighbours add_edge(10,30)", graph.add_edge(10, 30), true)
      assert_expected("sorted neighbours add_edge(10,50)", graph.add_edge(10, 50), true)
      assert_expected("sorted neighbours add_edge(30,50)", graph.add_edge(30, 50), true)
      assert_expected("sorted neighbours of 10", graph.get_neighbors(10), [30, 50, 70])
      assert_expected("sorted neighbours of 30", graph.get_neighbors(30), [50])
      assert_expected("sorted neighbours of 50", graph.get_neighbors(50), [] of Int32)
      assert_expected("sorted neighbours of 70", graph.get_neighbors(70), [] of Int32)
      assert_expected("sorted neighbours vertex_count", graph.vertex_count, 4)
      assert_expected("sorted neighbours edge_count", graph.edge_count, 4)
    end

    it "missing-edge query" do
      graph = build_graph([10, 30])
      assert_expected("missing-edge has_edge(10,30)", graph.has_edge(10, 30), false)
      assert_expected("missing-edge vertex_count", graph.vertex_count, 2)
      assert_expected("missing-edge edge_count", graph.edge_count, 0)
      assert_expected("missing-edge is_empty", graph.is_empty, false)
    end

    it "neighbours of missing vertex" do
      graph = DataStructuresAdvanced::Graph.new
      graph.add_vertex(10)
      assert_expected("missing vertex get_neighbors(99)", graph.get_neighbors(99), nil)
      assert_expected("missing vertex neighbors of 10 stay empty", graph.get_neighbors(10), [] of Int32)
      assert_expected("missing vertex vertex_count", graph.vertex_count, 1)
      assert_expected("missing vertex edge_count", graph.edge_count, 0)
    end

    it "self-loop and duplicate" do
      graph = build_graph([10])
      assert_expected("self-loop first add_edge(10,10)", graph.add_edge(10, 10), true)
      assert_expected("self-loop second add_edge(10,10)", graph.add_edge(10, 10), true)
      assert_expected("self-loop has_edge(10,10)", graph.has_edge(10, 10), true)
      assert_expected("self-loop neighbors of 10", graph.get_neighbors(10), [10])
      assert_expected("self-loop vertex_count", graph.vertex_count, 1)
      assert_expected("self-loop edge_count", graph.edge_count, 1)
    end

    it "neighbour-result isolation" do
      graph = build_graph([10, 30, 50])
      graph.add_edge(10, 30)
      saved = graph.get_neighbors(10)
      if copy = graph.get_neighbors(10)
        copy << 99
      end
      assert_expected("isolation saved after changing copy", saved, [30])
      assert_expected("isolation graph after changing copy", graph.get_neighbors(10), [30])
      assert_expected("isolation add_edge(10,50)", graph.add_edge(10, 50), true)
      assert_expected("isolation saved after add_edge", saved, [30])
      assert_expected("isolation fresh query", graph.get_neighbors(10), [30, 50])
      assert_expected("isolation vertex_count", graph.vertex_count, 3)
      assert_expected("isolation edge_count", graph.edge_count, 2)
    end
  end
end

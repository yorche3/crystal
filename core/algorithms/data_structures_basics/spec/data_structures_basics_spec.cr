require "./spec_helper"

private def assert_expected(case_name : String, actual : T, expected : T) forall T
  actual.should eq(expected), "#{case_name} should return #{expected}"
end

private def run_cases(cases : Array(Tuple(String, Proc(Nil))))
  cases.each do |case_name, operation|
    operation.call
  end
end

describe DataStructuresBasics do
  it "Node operations" do
    first_node_input = 10
    first_node_value_output = 10
    first_node_next_output = nil
    second_node_input = 20
    linked_node_value_output = 20
    second_node_next_output = nil
    first_node = DataStructuresBasics::Node.new(first_node_input)
    second_node = DataStructuresBasics::Node.new(second_node_input)

    cases = [] of Tuple(String, Proc(Nil))
    cases << {"initialize and observe value and link", -> {
      assert_expected("initialize and observe value and link value", first_node.get_value, first_node_value_output)
      assert_expected("initialize and observe value and link next", first_node.get_next, first_node_next_output)
      nil
    }}
    cases << {"initialize another node, link, and traverse", -> {
      first_node.set_next(second_node)
      assert_expected("initialize another node, link, and traverse value", first_node.get_next.not_nil!.get_value, linked_node_value_output)
      assert_expected("initialize another node, link, and traverse next", second_node.get_next, second_node_next_output)
      nil
    }}

    run_cases(cases)
  end

  it "LinkedList operations" do
    empty_size_output = 0
    empty_head_output = DataStructuresBasics::FAILURE_VALUE
    inserted_tail_input = 10
    second_tail_input = 20
    inserted_head_input = 5
    repeated_tail_input = 10
    inserted_size_output = 4
    inserted_head_output = 5
    deleted_value_input = 10
    deleted_size_output = 3
    deleted_head_output = 5
    absent_value_input = 99
    empty_head_after_deletions_output = DataStructuresBasics::FAILURE_VALUE
    list = DataStructuresBasics::LinkedList.new

    cases = [] of Tuple(String, Proc(Nil))
    cases << {"empty state", -> {
      assert_expected("empty state is_empty", list.is_empty, true)
      assert_expected("empty state size", list.size, empty_size_output)
      assert_expected("empty state get_head", list.get_head, empty_head_output)
      nil
    }}
    cases << {"insert at both ends", -> {
      list.insert_tail(inserted_tail_input)
      list.insert_tail(second_tail_input)
      list.insert_head(inserted_head_input)
      list.insert_tail(repeated_tail_input)
      assert_expected("insert at both ends size", list.size, inserted_size_output)
      assert_expected("insert at both ends head", list.get_head, inserted_head_output)
      nil
    }}
    cases << {"delete first occurrence", -> {
      assert_expected("delete first occurrence", list.delete(deleted_value_input), true)
      assert_expected("delete first occurrence size", list.size, deleted_size_output)
      assert_expected("delete first occurrence head", list.get_head, deleted_head_output)
      nil
    }}
    cases << {"absent value", -> {
      assert_expected("absent value", list.delete(absent_value_input), false)
      assert_expected("absent value size", list.size, deleted_size_output)
      assert_expected("absent value head", list.get_head, deleted_head_output)
      nil
    }}
    cases << {"empty the list", -> {
      assert_expected("empty the list delete head", list.delete(inserted_head_input), true)
      assert_expected("empty the list delete middle", list.delete(second_tail_input), true)
      assert_expected("empty the list delete tail", list.delete(repeated_tail_input), true)
      assert_expected("empty the list is_empty", list.is_empty, true)
      assert_expected("empty the list size", list.size, empty_size_output)
      assert_expected("empty the list get_head", list.get_head, empty_head_after_deletions_output)
      nil
    }}

    run_cases(cases)
  end

  it "Stack operations" do
    empty_size_output = 0
    empty_value_output = DataStructuresBasics::FAILURE_VALUE
    first_push_input = 10
    second_push_input = 20
    third_push_input = 30
    reuse_push_input = 40
    populated_size_output = 3
    stack = DataStructuresBasics::Stack.new

    cases = [] of Tuple(String, Proc(Nil))
    cases << {"empty state and failed removal", -> {
      assert_expected("empty state and failed removal is_empty", stack.is_empty, true)
      assert_expected("empty state and failed removal size", stack.size, empty_size_output)
      assert_expected("empty state and failed removal peek", stack.peek, empty_value_output)
      assert_expected("empty state and failed removal pop", stack.pop, empty_value_output)
      nil
    }}
    cases << {"LIFO and non-mutating peek", -> {
      stack.push(first_push_input)
      stack.push(second_push_input)
      stack.push(third_push_input)
      assert_expected("LIFO and non-mutating peek value", stack.peek, third_push_input)
      assert_expected("LIFO and non-mutating peek size", stack.size, populated_size_output)
      nil
    }}
    cases << {"removal and reuse", -> {
      assert_expected("removal and reuse first pop", stack.pop, third_push_input)
      stack.push(reuse_push_input)
      assert_expected("removal and reuse second pop", stack.pop, reuse_push_input)
      assert_expected("removal and reuse third pop", stack.pop, second_push_input)
      assert_expected("removal and reuse fourth pop", stack.pop, first_push_input)
      assert_expected("removal and reuse is_empty", stack.is_empty, true)
      assert_expected("removal and reuse size", stack.size, empty_size_output)
      nil
    }}
    cases << {"empty after removal", -> {
      assert_expected("empty after removal pop", stack.pop, empty_value_output)
      assert_expected("empty after removal is_empty", stack.is_empty, true)
      nil
    }}

    run_cases(cases)
  end

  it "Queue operations" do
    empty_size_output = 0
    empty_value_output = DataStructuresBasics::FAILURE_VALUE
    first_enqueue_input = 10
    second_enqueue_input = 20
    third_enqueue_input = 30
    reuse_enqueue_input = 40
    populated_size_output = 3
    queue = DataStructuresBasics::Queue.new

    cases = [] of Tuple(String, Proc(Nil))
    cases << {"empty state and failed removal", -> {
      assert_expected("empty state and failed removal is_empty", queue.is_empty, true)
      assert_expected("empty state and failed removal size", queue.size, empty_size_output)
      assert_expected("empty state and failed removal peek", queue.peek, empty_value_output)
      assert_expected("empty state and failed removal dequeue", queue.dequeue, empty_value_output)
      nil
    }}
    cases << {"FIFO and non-mutating peek", -> {
      queue.enqueue(first_enqueue_input)
      queue.enqueue(second_enqueue_input)
      queue.enqueue(third_enqueue_input)
      assert_expected("FIFO and non-mutating peek value", queue.peek, first_enqueue_input)
      assert_expected("FIFO and non-mutating peek size", queue.size, populated_size_output)
      nil
    }}
    cases << {"removal and reuse", -> {
      assert_expected("removal and reuse first dequeue", queue.dequeue, first_enqueue_input)
      queue.enqueue(reuse_enqueue_input)
      assert_expected("removal and reuse second dequeue", queue.dequeue, second_enqueue_input)
      assert_expected("removal and reuse third dequeue", queue.dequeue, third_enqueue_input)
      assert_expected("removal and reuse fourth dequeue", queue.dequeue, reuse_enqueue_input)
      assert_expected("removal and reuse is_empty", queue.is_empty, true)
      assert_expected("removal and reuse size", queue.size, empty_size_output)
      nil
    }}
    cases << {"empty after removal", -> {
      assert_expected("empty after removal dequeue", queue.dequeue, empty_value_output)
      assert_expected("empty after removal is_empty", queue.is_empty, true)
      nil
    }}

    run_cases(cases)
  end
end

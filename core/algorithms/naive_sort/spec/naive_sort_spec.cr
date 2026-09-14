require "./spec_helper"

# Define the test data constants
STANDARD_INPUT = [5, 2, 9, 1, 5, 6]
STANDARD_OUTPUT = [1, 2, 5, 5, 6, 9]

SORTED_INPUT = [1, 2, 3, 4, 5]
SORTED_OUTPUT = [1, 2, 3, 4, 5]

REVERSE_INPUT = [5, 4, 3, 2, 1]
REVERSE_OUTPUT = [1, 2, 3, 4, 5]

IDENTICAL_INPUT = [7, 7, 7, 7]
IDENTICAL_OUTPUT = [7, 7, 7, 7]

NEGATIVE_INPUT = [3, -1, 4, -5, 0]
NEGATIVE_OUTPUT = [-5, -1, 0, 3, 4]

SINGLE_INPUT = [42]
SINGLE_OUTPUT = [42]

EMPTY_INPUT = [] of Int32
EMPTY_OUTPUT = [] of Int32

# Helper method to run all tests for a sorting function
def run_sort_tests(sort_function, algorithm_name)
  # Case 1: Standard unsorted array
  STANDARD_OUTPUT.should eq(sort_function.call(STANDARD_INPUT.dup)), "#{algorithm_name} should sort an unsorted array"

  # Case 2: Already sorted array
  SORTED_OUTPUT.should eq(sort_function.call(SORTED_INPUT.dup)), "#{algorithm_name} should handle an already sorted array"

  # Case 3: Reverse sorted array
  REVERSE_OUTPUT.should eq(sort_function.call(REVERSE_INPUT.dup)), "#{algorithm_name} should sort a reverse sorted array"

  # Case 4: Identical elements
  IDENTICAL_OUTPUT.should eq(sort_function.call(IDENTICAL_INPUT.dup)), "#{algorithm_name} should handle identical elements"

  # Case 5: With negative numbers
  NEGATIVE_OUTPUT.should eq(sort_function.call(NEGATIVE_INPUT.dup)), "#{algorithm_name} should handle negative numbers"

  # Case 6: Single element
  SINGLE_OUTPUT.should eq(sort_function.call(SINGLE_INPUT.dup)), "#{algorithm_name} should handle single element array"

  # Case 7: Empty array
  EMPTY_OUTPUT.should eq(sort_function.call(EMPTY_INPUT.dup)), "#{algorithm_name} should handle empty array"
end

describe NaiveSort do
  describe "selection_sort" do
    it "should sort arrays correctly" do
      run_sort_tests(->(arr : Array(Int32)) { NaiveSort.selection_sort(arr) }, "Selection Sort")
    end
  end

  describe "bubble_sort" do
    it "should sort arrays correctly" do
      run_sort_tests(->(arr : Array(Int32)) { NaiveSort.bubble_sort(arr) }, "Bubble Sort")
    end
  end

  describe "insertion_sort" do
    it "should sort arrays correctly" do
      run_sort_tests(->(arr : Array(Int32)) { NaiveSort.insertion_sort(arr) }, "Insertion Sort")
    end
  end
end

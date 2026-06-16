require "./spec_helper"

describe Numbers do
  it "Sum of first n numbers recursive" do
    Numbers.sum_first_n_rec(0).should eq 0
    Numbers.sum_first_n_rec(3).should eq 6
  end

  it "Factorial recursive" do
    Numbers.factorial_rec(0).should eq 1
    Numbers.factorial_rec(4).should eq 24
  end

  it "Fibonacci recursive" do
    Numbers.fibonacci_rec(0).should eq 0
    Numbers.fibonacci_rec(1).should eq 1
    Numbers.fibonacci_rec(6).should eq 8
  end

  it "Largest common divisor recursive" do
    Numbers.largest_common_divisor_rec(12, 8).should eq 4
    Numbers.largest_common_divisor_rec(7, 5).should eq 1
  end
  
  it "Least common multiple recursive" do
    Numbers.least_common_multiple_rec(6, 8).should eq 24
    Numbers.least_common_multiple_rec(6, 4).should eq 12
  end
end
